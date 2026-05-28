FROM python:alpine

RUN apk add portaudio dbus dbus-x11

#RUN curl -fsSL https://raw.githubusercontent.com/Sendspin/sendspin-cli/refs/heads/main/scripts/systemd/install-systemd.sh | sudo bash
RUN pip install sendspin

RUN <<EOF
sed -i '/^from ctypes.util import find_library as _find_library$/c\
from pathlib import Path\
\
def _find_library(name):\
    dir_path = Path("/usr/lib")\
\
    # Use .rglob() for recursive search, or .iterdir() for top-level only\
    for file_path in dir_path.rglob("*"):\
        if file_path.is_file() and name in file_path.name:\
            return str(file_path.resolve())\
\
    return None\
' /usr/local/lib/python3.14/site-packages/sounddevice.py
EOF

COPY entrypoint.sh /
ENTRYPOINT [ "/entrypoint.sh" ]

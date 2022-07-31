FROM registry.fedoraproject.org/fedora-toolbox:36

ENV VERSION=36 NAME=base

LABEL name = $NAME \
      version = $VERSION \
      description = "Container for all LKCAMP activities" \
      author = "Pedro Sader Azevedo <pedro.azevedo@students.ic.unicamp.br>" \
      source = "https://github.com/pesader/toolboxes"

# upgrade and install packages
COPY packages /
RUN dnf upgrade -y --refresh \
    && dnf install -y $(<packages) \
    && dnf clean all \
    && rm /packages

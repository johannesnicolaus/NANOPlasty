# 1. Base image
FROM ubuntu:24.04

# 2. Metadata
LABEL maintainer="johannesnicolaus@github" \
      version="0.2" \
      description="NANOPlasty: BLAST+ • kalign3 • Perl MCE & Parallel::ForkManager"

# 3. Environment
ENV LC_ALL=C.UTF-8 \
    LANG=C.UTF-8 \
    PATH=/usr/local/bin:/usr/bin:$PATH

# 4. Install system packages & Perl deps
#    (Ubuntu's libmce-perl and libparallel-forkmanager-perl cover every module
#    NANOPlasty loads, so no CPAN build step is needed.)
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
      ncbi-blast+ \
      kalign \
      libparallel-forkmanager-perl \
      libmce-perl \
      gzip && \
    rm -rf /var/lib/apt/lists/*

# 5. Copy the code in
COPY . /opt/nanoplasty

# 6. Make scripts executable
RUN chmod -R +x /opt/nanoplasty

# 7. Set working dir
WORKDIR /opt/nanoplasty

ENV PATH=/opt/nanoplasty:$PATH

# 8. Default entrypoint (pass the config file as an argument, e.g. -c config.txt)
ENTRYPOINT ["perl", "/opt/nanoplasty/NANOPlasty0.2.pl"]

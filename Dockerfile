# SQL Server Command Line Tools - custom image
# From Alpine 3.11 (~5 MBs)
FROM alpine:3.11

# Labels
LABEL maintainer="@dbamastery"
LABEL org.label-schema.schema-version="1.0"
LABEL org.label-schema.name="mssql-tools-alpine"
LABEL org.label-schema.description="mssql-tools image alternative with Alpine"
LABEL org.label-schema.url="http://dbamastery.com"

# Installing system utilities
RUN apk add --no-cache curl gnupg

# Adding custom MS repository for mssql-tools and msodbcsql
RUN curl -O https://download.microsoft.com/download/e/4/e/e4e67866-dffd-428c-aac7-8d28ddafb39b/msodbcsql17_17.5.2.1-1_amd64.apk
RUN curl -O https://download.microsoft.com/download/e/4/e/e4e67866-dffd-428c-aac7-8d28ddafb39b/mssql-tools_17.5.2.1-1_amd64.apk

# Verifying signature
RUN curl -O https://download.microsoft.com/download/e/4/e/e4e67866-dffd-428c-aac7-8d28ddafb39b/msodbcsql17_17.5.2.1-1_amd64.sig
RUN curl -O https://download.microsoft.com/download/e/4/e/e4e67866-dffd-428c-aac7-8d28ddafb39b/mssql-tools_17.5.2.1-1_amd64.sig

# Importing gpg key
RUN curl https://packages.microsoft.com/keys/microsoft.asc  | gpg --import -
RUN gpg --verify msodbcsql17_17.5.2.1-1_amd64.sig msodbcsql17_17.5.2.1-1_amd64.apk && gpg --verify mssql-tools_17.5.2.1-1_amd64.sig mssql-tools_17.5.2.1-1_amd64.apk

# Installing packages 
RUN echo y | apk add --allow-untrusted msodbcsql17_17.5.2.1-1_amd64.apk mssql-tools_17.5.2.1-1_amd64.apk

# Adding SQL Server tools to $PATH
ENV PATH=$PATH:/opt/mssql-tools/bin
CMD ["/bin/sh"]

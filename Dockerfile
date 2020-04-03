FROM python:3.7.7-buster

RUN apt-get update \
&& apt-get install -y \
    python3-pip \
    ffmpeg \
&& python3 -m pip install \
    deepspeech

RUN mkdir /deepspeech \
&& cd /deepspeech \
&& wget https://github.com/mozilla/DeepSpeech/releases/download/v0.6.1/deepspeech-0.6.1-models.tar.gz \
&& tar xvfz deepspeech-0.6.1-models.tar.gz \
&& cp /deepspeech/deepspeech-0.6.1-models/* / \
&& rm -r /deepspeech

ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]


FROM ccr.ccs.tencentyun.com/tcb_public/requarks_wiki:2

USER root

# apk 加速
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apk/repositories

RUN apk add mysql-client

COPY ./entrypoint.sh ./entrypoint.sh

RUN chmod +x ./entrypoint.sh

ENTRYPOINT [ "./entrypoint.sh" ]

CMD ["node", "server"]

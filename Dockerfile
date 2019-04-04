FROM ansible/ansible:ubuntu1604


ADD k8s.1-12-7.tar.gz root/k8s
ADD ./hosts root/tools/
ADD ./auto_ssh.sh root/tools/


RUN sudo apt-get update \
    && apt-get install -y --no-install-recommends --fix-missing tcl tk expect \
    && git clone --depth=1 https://github.com/gjmzj/kubeasz.git ~/kubeasz \
    && mv ~/kubeasz/* /etc/ansible \
    && mv ~/k8s/bin/* /etc/ansible/bin \
    && rm /etc/ansible/hosts \
    && cp ~/tools/hosts /etc/ansible/ \
    && pip install --upgrade pip \
    && pip2 install ansible \
    && /usr/bin/expect ~/tools/auto_ssh.sh root 123456 10.60.38.181 2331 || true\
    && /usr/bin/expect ~/tools/auto_ssh.sh root 123456 10.60.38.181 2332 || true\
    && /usr/bin/expect ~/tools/auto_ssh.sh root 123456 10.60.38.181 2333 || true







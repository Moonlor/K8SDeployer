FROM ansible/ansible:ubuntu1604


RUN sudo apt-get update \
    && apt-get install -y --no-install-recommends --fix-missing tcl tk expect \
    && git clone git clone --depth=1 https://github.com/gjmzj/kubeasz.git ~/kubeasz \
    && mv kubeasz/* /etc/ansible
    && rm /etc/ansible/hosts \
    && cp ~/Ansible_Operator/hosts /etc/ansible/ \
    && pip install --upgrade pip \
    && pip2 install ansible \
    && pip2 install flask \
    && pip2 install flask_httpauth \
    && pip2 install requests \
    && git -C /root/Ansible_Operator pull \
    && /usr/bin/expect /root/Ansible_Operator/auto_ssh.sh root 123456 10.60.38.181 2331\
    && chmod 777 ~/Ansible_Operator/run.sh


CMD ["sh", "/root/Ansible_Operator/run.sh"]






sudo ./_output/bin/kubeadm  reset -f --cri-socket=unix:///var/run/crio/crio.sock
sudo ./_output/bin/kubeadm init --pod-network-cidr=10.244.0.0/16 --cri-socket=unix:///var/run/crio/crio.sock -v=3

mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

kubectl taint node ip-172-31-29-108.ec2.internal node-role.kubernetes.io/control-plane:NoSchedule-

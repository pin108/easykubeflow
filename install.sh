#!/bin/bash

# Function to check RAM and CPU specifications
check_system_specifications() {
    ram=$(grep -oP 'MemTotal:\s*\K[0-9]+' /proc/meminfo)
    cpu_cores=$(grep -c ^processor /proc/cpuinfo)

    echo "Checking system specifications..."

    # Check RAM
    if [ "$ram" -lt 16000000 ]; then
        echo "Error: Insufficient RAM. Minimum requirement is 16GB."
        exit 1
    elif [ "$ram" -lt 32000000 ]; then
        echo "Warning: Current RAM is below recommended specifications (32GB or higher)."
	echo "RAM: OK ($((ram/1000000)) GB)"

    else
        echo "RAM: OK ($((ram/1000000)) GB)"
    fi

    # Check CPU cores
    if [ "$cpu_cores" -lt 8 ]; then
        echo "Error: Insufficient CPU cores. Minimum requirement is 8 cores."
        exit 1
    elif [ "$cpu_cores" -lt 16 ]; then
        echo "Warning: Current CPU cores are below recommended specifications (16 or higher)."
	echo "CPU Cores: OK ($cpu_cores cores)"
    else
        echo "CPU Cores: OK ($cpu_cores cores)"
    fi
}
# Echo system recommendation spec
echo "System Recommendation Spec:"
echo "RAM: Minimum 16GB, Recommended 32GB or higher"
echo "CPU: Minimum 8 cores, Recommended 16 or higher"

sleep 5
# Check system specifications
check_system_specifications

sleep 5
# Clone Kubeflow git repository
git clone https://github.com/kubeflow/manifests.git
cd manifests

# Run Kubeflow installation
# Install with a single command
while ! kustomize build example | kubectl apply -f -; do
    echo "Retrying to apply resources"
    sleep 10
done

# Fix error loop callback
echo "Fixing error loop callback..."
sudo sysctl fs.inotify.max_user_instances=12800
sudo sysctl fs.inotify.max_user_watches=6553600

# Check progress of Kubeflow after 5 minutes
echo "Checking progress of Kubeflow installation after 5 minutes..."
sleep 300  # Sleep for 5 minutes
kubectl get pods -A

#network Mapping with NodePort
echo "Give Access Into Web ... ... ... ... . ... .. "
echo "Please Edit with command kubectl edit service -n istio-system istio-ingressgateway ..."
echo "change type:cluster into type:NodePort and add in line port with nodePort: 30001"
echo "happy enjoy and check in yourip:30001" 


Kubeflow Installation Script

This script automates the installation process for Kubeflow on your Kubernetes cluster.

System Requirements:
- RAM: Minimum 16GB, Recommended 32GB or higher
- CPU: Minimum 8 cores, Recommended 16 or higher

Installation Steps:
1. Ensure your system meets the RAM and CPU requirements mentioned above.
2. Clone this repository: `git clone <repository_url>`
3. Navigate to the cloned directory: `cd manifests`
4. Run the installation script: `sudo chmod +x install.sh && ./install.sh`
5. Follow the on-screen prompts and wait for the installation to complete.
6. Check the progress of Kubeflow installation using `kubectl get pods -A`.


Important Note:
- The installation process may take some time depending on your system specifications and cluster setup.
- Ensure that you have the necessary permissions and access to your Kubernetes cluster before running the script.

Login with the default user's credential. The default email address is user@example.com and the default password is 12341234.


For assistance or troubleshooting, please refer to the Kubeflow documentation or reach out to the Kubeflow community.

Happy Kubeflow-ing!

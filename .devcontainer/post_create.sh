#!/bin/bash
   # Install Python dependencies
   pip install --upgrade pip
   pip install pandas numpy matplotlib seaborn jupyter scikit-learn xgboost lightgbm tensorflow pytorch kaggle sqlalchemy psycopg2-binary opendatasets kagglehub

   # Ensure user bin is in PATH
   export PATH="$HOME/.local/bin:$PATH"

   # Install kaggle and verify
   pip install kaggle --user
   if ! command -v kaggle &> /dev/null; then
       echo "kaggle installation failed"
       exit 1
   fi
   
   # Install Jupyter and register kernel
   jupyter notebook --generate-config
   echo "c.NotebookApp.ip = '0.0.0.0'" >> /home/vscode/.jupyter/jupyter_notebook_config.py
   echo "c.NotebookApp.open_browser = False" >> /home/vscode/.jupyter/jupyter_notebook_config.py

   # Set up Kaggle API directory
   mkdir -p /home/vscode/.kaggle
   chmod 600 /home/vscode/.kaggle

   # Install SQLTools extension for VS Code
   code --install-extension mtxr.sqltools
   code --install-extension mtxr.sqltools-driver-pg

   echo "Environment setup complete. Please upload your kaggle.json to /home/vscode/.kaggle/"
   
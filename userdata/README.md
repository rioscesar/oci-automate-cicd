This directory needs to be populated with local keyfiles:

1) eshneken-bmcs.pem:  private key (.pem) for BMCS user
2) eshneken-chef-io.pem:  private key (.pem) for Chef.io user
3) eshneken-opc:  private key (RSA) for BMCS opc user
4) eshneken-opc.pub:  public key (RSA) corresponding to #4 private key file

Once the local directory has all of these, the userdata directory will be copied to the root /home/opc of the Jenkins Server.

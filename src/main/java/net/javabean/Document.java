package net.javabean;


public class Document {

  private String account;
  private String documentTitle;
  private String downloadIntegral;
  private String downloadCount;
  private String type;
  private String uploadTime;
  private String description;


  public String getAccount() {
    return account;
  }

  public void setAccount(String account) {
    this.account = account;
  }


  public String getDocumentTitle() {
    return documentTitle;
  }

  public void setDocumentTitle(String documentTitle) {
    this.documentTitle = documentTitle;
  }


  public String getDownloadIntegral() {
    return downloadIntegral;
  }

  public void setDownloadIntegral(String downloadIntegral) {
    this.downloadIntegral = downloadIntegral;
  }


  public String getDownloadCount() {
    return downloadCount;
  }

  public void setDownloadCount(String downloadCount) {
    this.downloadCount = downloadCount;
  }


  public String getType() {
    return type;
  }

  public void setType(String type) {
    this.type = type;
  }


  public String getUploadTime() {
    return uploadTime;
  }

  public void setUploadTime(String uploadTime) {
    this.uploadTime = uploadTime;
  }


  public String getDescription() {
    return description;
  }

  public void setDescription(String description) {
    this.description = description;
  }

}

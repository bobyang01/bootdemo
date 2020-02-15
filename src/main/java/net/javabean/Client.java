package net.javabean;


public class Client {

  private long clientid;
  private String account;
  private String password;
  private String sexy;
  private String education;
  private String profession;
  private String phone;
  private String email;
  private long statusid;
  private long integral;
  private String regtime;
  private int page;
  private int limit;

  public Client()
  {
    System.out.println("无参被实例化了");
  }

  public Client(String account)
  {
    this.account = account;
  }

  @Override
  public String toString()
  {
    return "Client{" + "account='" + account + '\'' + '}';
  }

  public long getClientid()
  {
    return clientid;
  }

  public void setClientid(long clientid)
  {
    this.clientid = clientid;
  }

  public String getAccount()
  {
    return account;
  }

  public void setAccount(String account)
  {
    this.account = account;
  }

  public String getPassword()
  {
    return password;
  }

  public void setPassword(String password)
  {
    this.password = password;
  }

  public String getSexy()
  {
    return sexy;
  }

  public void setSexy(String sexy)
  {
    this.sexy = sexy;
  }

  public String getEducation()
  {
    return education;
  }

  public void setEducation(String education)
  {
    this.education = education;
  }

  public String getProfession()
  {
    return profession;
  }

  public void setProfession(String profession)
  {
    this.profession = profession;
  }

  public String getPhone()
  {
    return phone;
  }

  public void setPhone(String phone)
  {
    this.phone = phone;
  }

  public String getEmail()
  {
    return email;
  }

  public void setEmail(String email)
  {
    this.email = email;
  }

  public long getStatusid()
  {
    return statusid;
  }

  public void setStatusid(long statusid)
  {
    this.statusid = statusid;
  }

  public long getIntegral()
  {
    return integral;
  }

  public void setIntegral(long integral)
  {
    this.integral = integral;
  }

  public String getRegtime()
  {
    return regtime;
  }

  public void setRegtime(String regtime)
  {
    this.regtime = regtime;
  }

  public int getPage()
  {
    return page;
  }

  public void setPage(int page)
  {
    this.page = page;
  }

  public int getLimit()
  {
    return limit;
  }

  public void setLimit(int limit)
  {
    this.limit = limit;
  }
}

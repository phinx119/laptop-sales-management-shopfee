/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/*
 *
 * @author ASUS
 */
public class Banner {

    protected int Banner_Id;
    protected String Banner_Name;
    protected String Banner_Image;
    protected String Banner_Link;

    public Banner() {
    }

    public Banner(int Banner_Id, String Banner_Name, String Banner_Image, String Banner_Link) {
        this.Banner_Id = Banner_Id;
        this.Banner_Name = Banner_Name;
        this.Banner_Image = Banner_Image;
        this.Banner_Link = Banner_Link;
    }

    public int getBanner_Id() {
        return Banner_Id;
    }

    public void setBanner_Id(int Banner_Id) {
        this.Banner_Id = Banner_Id;
    }

    public String getBanner_Name() {
        return Banner_Name;
    }

    public void setBanner_Name(String Banner_Name) {
        this.Banner_Name = Banner_Name;
    }

    public String getBanner_Image() {
        return Banner_Image;
    }

    public void setBanner_Image(String Banner_Image) {
        this.Banner_Image = Banner_Image;
    }

    public String getBanner_Link() {
        return Banner_Link;
    }

    public void setBanner_Link(String Banner_Link) {
        this.Banner_Link = Banner_Link;
    }

}

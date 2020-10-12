package cn.flin.bean;

public class bicycleimage {
    private Integer imageid;

    private Integer bid;

    private String image;

    public bicycleimage() {
    }

    public bicycleimage(Integer imageid, Integer bid, String image) {
        this.imageid = imageid;
        this.bid = bid;
        this.image = image;
    }

    public Integer getImageid() {
        return imageid;
    }

    public void setImageid(Integer imageid) {
        this.imageid = imageid;
    }

    public Integer getBid() {
        return bid;
    }

    public void setBid(Integer bid) {
        this.bid = bid;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image == null ? null : image.trim();
    }
}
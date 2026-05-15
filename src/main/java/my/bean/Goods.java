package my.bean;
public class Goods {
    private String name;  //商品名称
    private float price; //商品价格
    private int num;  //购买商品的数量
    public Goods() {
        super();
    }
    public Goods(String name) {
        super();
        this.name = name;
    }
    public Goods(String name, float price, int num) {
        super();
        this.name = name;
        this.price = price;
        this.num = num;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public float getPrice() {
        return price;
    }
    public void setPrice(float price) {
        this.price = price;
    }
    public int getNum() {
        return num;
    }
    public void setNum(int num) {
        this.num = num;
    }
}

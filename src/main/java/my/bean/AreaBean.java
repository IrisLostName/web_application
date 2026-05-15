package my.bean;

/**
 * AreaBean - 梯形面积计算 Bean
 * 公式：面积 = (上底 + 下底) × 高 ÷ 2
 */
public class AreaBean {
    private double upperBase;  // 上底
    private double lowerBase;  // 下底
    private double height;     // 高
    private double area;       // 面积

    // 默认构造器
    public AreaBean() {
    }

    // 全参构造器
    public AreaBean(double upperBase, double lowerBase, double height) {
        this.upperBase = upperBase;
        this.lowerBase = lowerBase;
        this.height = height;
    }

    // ===== Getter 方法 =====
    public double getUpperBase() {
        return upperBase;
    }

    public double getLowerBase() {
        return lowerBase;
    }

    public double getHeight() {
        return height;
    }

    public double getArea() {
        return area;
    }

    // ===== Setter 方法 =====
    public void setUpperBase(double upperBase) {
        this.upperBase = upperBase;
    }

    public void setLowerBase(double lowerBase) {
        this.lowerBase = lowerBase;
    }

    public void setHeight(double height) {
        this.height = height;
    }

    public void setArea(double area) {
        this.area = area;
    }

    // ===== 业务方法 =====
    /**
     * 计算梯形面积
     * 公式：面积 = (上底 + 下底) × 高 ÷ 2
     */
    public void calculateArea() {
        this.area = (upperBase + lowerBase) * height / 2;
    }

    @Override
    public String toString() {
        return "AreaBean{" +
                "upperBase=" + upperBase +
                ", lowerBase=" + lowerBase +
                ", height=" + height +
                ", area=" + area +
                '}';
    }
}

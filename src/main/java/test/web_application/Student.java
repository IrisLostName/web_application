package test.web_application;

/**
 * Student - 学生数据模型 (标准 JavaBean)
 */
public class Student {
    private int id;
    private String name;
    private int age;
    private String major;

    // 默认构造器（JavaBean 规范必需）
    public Student() {
    }

    // 全参构造器
    public Student(int id, String name, int age, String major) {
        this.id = id;
        this.name = name;
        this.age = age;
        this.major = major;
    }

    // ===== Getter 方法 =====
    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public int getAge() {
        return age;
    }

    public String getMajor() {
        return major;
    }

    // ===== Setter 方法 =====
    public void setId(int id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    @Override
    public String toString() {
        return "Student{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", age=" + age +
                ", major='" + major + '\'' +
                '}';
    }
}

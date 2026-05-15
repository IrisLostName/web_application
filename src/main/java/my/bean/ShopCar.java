package my.bean;
import java.util.*;
public class ShopCar {
    private ArrayList buylist=new ArrayList(); //用来存储购买的商品

    public ArrayList getBuylist() {
        return buylist;
    }

    public void addItem(Goods goodinfo)
    {
        if(goodinfo!=null)
        {
            if(buylist.size()==0) //如果buylist中不存任何商品
            {
                Goods temp=new Goods();
                temp.setName(goodinfo.getName());
                temp.setPrice(goodinfo.getPrice());
                temp.setNum(goodinfo.getNum());
                buylist.add(temp);  //存储商品
            }
            else{
                int i=0;  //如果buylist中存在商品
                for(;i<buylist.size();i++) //遍历buylist集合对象，判断该集合中是否已经存在当前要添加的商品
                {
                    Goods temp=(Goods)buylist.get(i); //获取buylist集合中当前元素
                    if(temp.getName().equals(goodinfo.getName())) //判断从buylist集合中获取当前商品的名称是否瑟要添加的名称相同
                    {
                        temp.setNum(temp.getNum()+1);
                        break;
                    }
                }
                if(i == buylist.size()) //说明buylist中不存要添加的商品
                {
                    Goods temp=new Goods();
                    temp.setName(goodinfo.getName());
                    temp.setPrice(goodinfo.getPrice());
                    temp.setNum(goodinfo.getNum());
                    buylist.add(temp); //存储商品

                }
            }
        }
    }
    public void removeItem(String name)
    {
        for(int i=0;i<buylist.size();i++)  //遍历buylist集合，查找指定名称的商品
        {
            Goods temp=(Goods)buylist.get(i);  //获取集合中当前位置的商品
            if(temp.getName().equals(MyTools.toChinese(name)));
            {
                if(temp.getNum()>1)  //如果商品的购买数量大于1
                {
                    temp.setNum(temp.getNum()-1); //则将购买数量减1
                    break;
                }else if(temp.getNum()==1)
                {
                    buylist.remove(i);
                }
            }

        }
    }
    public void clearCar()
    {
        buylist.clear();
    }
}

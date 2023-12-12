package tw.sure.model.cartItem;

import tw.sure.model.member.Member;
import tw.sure.model.product.Product;
/**
 * 使用db版本保存
 * @author sure
 *
 */
public class CartItem2 {

	private Integer id;
	private Product productBean;
	private Integer buyCount;
	private Member memberBean;

	// subTotal   
	public Integer getSubtotal() { // 如果price是double类型，就用bigDecimal和String构造器来做
		return productBean.getPrice() * buyCount;
	}

	public CartItem2() {
	}

	public CartItem2(Integer id, Product productBean, Integer buyCount, Member memberBean) {
		super();
		this.id = id;
		this.productBean = productBean;
		this.buyCount = buyCount;
		this.memberBean = memberBean;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Product getProductBean() {
		return productBean;
	}

	public void setProductBean(Product productBean) {
		this.productBean = productBean;
	}

	public Integer getBuyCount() {
		return buyCount;
	}

	public void setBuyCount(Integer buyCount) {
		this.buyCount = buyCount;
	}

	public Member getMemberBean() {
		return memberBean;
	}

	public void setMemberBean(Member memberBean) {
		this.memberBean = memberBean;
	}
}

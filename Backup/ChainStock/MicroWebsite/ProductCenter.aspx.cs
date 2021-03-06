using Chain.BLL;
using System;
using System.Data;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Wuqi.Webdiyer;

namespace ChainStock.MicroWebsite
{
	public class ProductCenter : PageBase
	{
		protected HtmlHead Head1;

		protected HtmlForm frmProductCenter;

		protected Literal ltlTitle;

		protected Button btnProductAdd;

		protected Button btnProductClass;

		protected Repeater gvwProductCenter;

		protected DropDownList drpPageSize;

		protected AspNetPager NetPagerParameter;

		private Chain.BLL.ProductCenter ProductCenterBll = new Chain.BLL.ProductCenter();

		protected void Page_Load(object sender, EventArgs e)
		{
			if (!base.IsPostBack)
			{
				this.Get_ParameterList();
			}
		}

		private void Get_ParameterList()
		{
			int Counts = this.NetPagerParameter.RecordCount;
			DataTable db = this.ProductCenterBll.GetProductCenterInfo(this.NetPagerParameter.PageSize, this.NetPagerParameter.CurrentPageIndex, out Counts, new string[]
			{
				" ProductClass.ClassID=ProductCenter.ClassID and SysUser.UserID=ProductCenter.CreateUserID "
			}).Tables[0];
			this.NetPagerParameter.RecordCount = Counts;
			this.NetPagerParameter.CustomInfoHTML = string.Format("<div class=\"results\"><span>当前第{0}/{1}页 共{2}条记录 每页{3}条</span></div>", new object[]
			{
				this.NetPagerParameter.CurrentPageIndex,
				this.NetPagerParameter.PageCount,
				this.NetPagerParameter.RecordCount,
				this.NetPagerParameter.PageSize
			});
			this.gvwProductCenter.DataSource = db;
			this.gvwProductCenter.DataBind();
			PageBase.BindSerialRepeater(this.gvwProductCenter, this.NetPagerParameter.PageSize * (this.NetPagerParameter.CurrentPageIndex - 1));
		}

		protected void drpPageSize_SelectedIndexChanged(object sender, EventArgs e)
		{
			this.NetPagerParameter.CurrentPageIndex = 1;
			this.NetPagerParameter.PageSize = int.Parse(this.drpPageSize.SelectedValue);
			this.Get_ParameterList();
		}

		protected void NetPagerParameter_PageChanging(object src, PageChangingEventArgs e)
		{
			this.NetPagerParameter.CurrentPageIndex = e.NewPageIndex;
			this.Get_ParameterList();
		}

		protected void btnProductAdd_Click(object sender, EventArgs e)
		{
			base.Response.Redirect("ProductCenterInfo.aspx");
		}

		protected void btnProductClass_Click(object sender, EventArgs e)
		{
			base.Response.Redirect("ProductClass.aspx");
		}
	}
}

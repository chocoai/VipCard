using Chain.BLL;
using Chain.Model;
using ChainStock.Controls;
using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Wuqi.Webdiyer;

namespace ChainStock.MicroWebsite
{
	public class SysRotatePrizeSum : PageBase
	{
		protected HtmlHead Head1;

		protected HtmlForm frmMicroExpHistory;

		protected HtmlInputHidden txtUser;

		protected HtmlInputHidden txtShopid;

		protected Literal ltlTitle;

		protected HtmlSelect sltShop;

		protected HtmlInputHidden HDsltshop;

		protected ChainStock.Controls.SysArea SysArea1;

		protected Button btnShopSearch;

		protected ImageButton ImgArrow1;

		protected ImageButton ImgArrow2;

		protected Repeater gvSysRotatePrizeLog;

		protected DropDownList drpPageSize;

		protected AspNetPager NetPagerParameter;

		protected HtmlInputCheckBox chkSMS;

		protected QuickSearch QuickSearch1;

		protected int RotateID = 0;

		protected void Page_Load(object sender, EventArgs e)
		{
			if (!base.IsPostBack)
			{
				PubFunction.BindShopSelect(this._UserShopID, this.sltShop, 0, this._UserShopID != 1);
				this.txtUser.Value = this._UserName;
				this.txtShopid.Value = this._UserShopID.ToString();
				this.BindStatus();
				this.BindExpenseHistory(this.QueryCondition());
				this.chkSMS.Checked = (this.curParameter.bolMoneySms && this.curParameter.bolAutoSendSMSByCommodityConsumption);
			}
		}

		protected string BindStatus(object status)
		{
			string result = "";
			string text = status.ToString();
			if (text != null)
			{
				if (!(text == "0"))
				{
					if (text == "1")
					{
						result = "已领取";
					}
				}
				else
				{
					result = "待领取";
				}
			}
			return result;
		}

		protected string BindPrizeName(object prizeLevel, object rotateID)
		{
			string result = "";
			Chain.BLL.SysRotate bllSysRotate = new Chain.BLL.SysRotate();
			Chain.Model.SysRotate modelSysRotate = bllSysRotate.GetModel(int.Parse(rotateID.ToString()));
			if (modelSysRotate != null)
			{
				string text = prizeLevel.ToString();
				if (text != null)
				{
					if (!(text == "一等奖"))
					{
						if (!(text == "二等奖"))
						{
							if (!(text == "三等奖"))
							{
								if (!(text == "四等奖"))
								{
									if (!(text == "五等奖"))
									{
										if (text == "六等奖")
										{
											result = modelSysRotate.SixPrizeName;
										}
									}
									else
									{
										result = modelSysRotate.FivePrizeName;
									}
								}
								else
								{
									result = modelSysRotate.FourPrizeName;
								}
							}
							else
							{
								result = modelSysRotate.ThreePrizeName;
							}
						}
						else
						{
							result = modelSysRotate.TwoPrizeName;
						}
					}
					else
					{
						result = modelSysRotate.OnePrizeName;
					}
				}
			}
			return result;
		}

		private void BindExpenseHistory(string strSql)
		{
			int Counts = this.NetPagerParameter.RecordCount;
			DataTable dtExpenseHistory = new Chain.BLL.SysRotatePrizeLog().GetListSP(false, "TotalCount", this.NetPagerParameter.PageSize, this.NetPagerParameter.CurrentPageIndex, out Counts, new string[]
			{
				strSql
			}).Tables[0];
			this.NetPagerParameter.RecordCount = Counts;
			this.NetPagerParameter.CustomInfoHTML = string.Format("<div class=\"results\"><span>当前第{0}/{1}页 共{2}条记录 每页{3}条</span></div>", new object[]
			{
				this.NetPagerParameter.CurrentPageIndex,
				this.NetPagerParameter.PageCount,
				this.NetPagerParameter.RecordCount,
				this.NetPagerParameter.PageSize
			});
			this.gvSysRotatePrizeLog.DataSource = dtExpenseHistory;
			this.gvSysRotatePrizeLog.DataBind();
			PageBase.BindSerialRepeater(this.gvSysRotatePrizeLog, this.NetPagerParameter.PageSize * (this.NetPagerParameter.CurrentPageIndex - 1));
		}

		protected string QueryCondition()
		{
			string strMemShopID = this.sltShop.Value;
			StringBuilder strSql = new StringBuilder();
			strSql.Append(" 1=1  ");
			if (strMemShopID != "")
			{
				strSql.AppendFormat("and MemShopID={0}", int.Parse(strMemShopID));
			}
			string strProvince = this.SysArea1.sltProvince.Value;
			string strCity = (base.Request["SysArea1$sltCity"] != null) ? base.Request["SysArea1$sltCity"].ToString() : "";
			string strCounty = (base.Request["SysArea1$sltCounty"] != null) ? base.Request["SysArea1$sltCounty"].ToString() : "";
			string strVillage = (base.Request["SysArea1$sltVillage"] != null) ? base.Request["SysArea1$sltVillage"].ToString() : "";
			if (strProvince != "")
			{
				strSql.AppendFormat(" and MemProvince='{0}'", strProvince);
			}
			if (strCity != "" || strProvince != "")
			{
				this.SysArea1.sltCity.Items.Clear();
				PubFunction.BindSysArea(this.SysArea1.sltCity, int.Parse(strProvince));
				this.SysArea1.sltCity.Value = strCity;
				if (strCity != "")
				{
					strSql.AppendFormat(" and MemCity='{0}'", strCity);
				}
			}
			if (strCounty != "" || strCity != "")
			{
				this.SysArea1.sltCounty.Items.Clear();
				PubFunction.BindSysArea(this.SysArea1.sltCounty, int.Parse(strCity));
				this.SysArea1.sltCounty.Value = strCounty;
				if (strCounty != "")
				{
					strSql.AppendFormat(" and MemCounty='{0}'", strCounty);
				}
			}
			if (strVillage != "" || strCounty != "")
			{
				this.SysArea1.sltVillage.Items.Clear();
				PubFunction.BindSysArea(this.SysArea1.sltVillage, int.Parse(strCounty));
				this.SysArea1.sltVillage.Value = strVillage;
				if (strVillage != "")
				{
					strSql.AppendFormat(" and MemVillage='{0}'", strVillage);
				}
			}
			this.RotateID = int.Parse(base.Request.QueryString["RotateID"]);
			strSql.AppendFormat(" and RotateID={0}", this.RotateID);
			return strSql.ToString();
		}

		private void BindExpenseHistoryNew(string strSql, bool isasc, string order)
		{
			int Counts = this.NetPagerParameter.RecordCount;
			DataTable dtExpenseHistory = new Chain.BLL.SysRotatePrizeLog().GetListSP(isasc, order, this.NetPagerParameter.PageSize, this.NetPagerParameter.CurrentPageIndex, out Counts, new string[]
			{
				strSql
			}).Tables[0];
			this.NetPagerParameter.RecordCount = Counts;
			this.NetPagerParameter.CustomInfoHTML = string.Format("<div class=\"results\"><span>当前第{0}/{1}页 共{2}条记录 每页{3}条</span></div>", new object[]
			{
				this.NetPagerParameter.CurrentPageIndex,
				this.NetPagerParameter.PageCount,
				this.NetPagerParameter.RecordCount,
				this.NetPagerParameter.PageSize
			});
			this.gvSysRotatePrizeLog.DataSource = dtExpenseHistory;
			this.gvSysRotatePrizeLog.DataBind();
			PageBase.BindSerialRepeater(this.gvSysRotatePrizeLog, this.NetPagerParameter.PageSize * (this.NetPagerParameter.CurrentPageIndex - 1));
		}

		protected void imgArrow1_Click(object sender, ImageClickEventArgs e)
		{
			this.NetPagerParameter.CurrentPageIndex = 1;
			string sql = this.QueryCondition();
			if (this.ImgArrow1.ImageUrl.ToString() == "~/images/Gift/arrow-down.gif")
			{
				this.ImgArrow1.ImageUrl = "~/images/Gift/arrow-up.gif";
				this.BindExpenseHistoryNew(sql, true, "TotalCount");
			}
			else
			{
				this.ImgArrow1.ImageUrl = "~/images/Gift/arrow-down.gif";
				this.BindExpenseHistoryNew(sql, false, "TotalCount");
			}
		}

		protected void imgArrow2_Click(object sender, ImageClickEventArgs e)
		{
			this.NetPagerParameter.CurrentPageIndex = 1;
			string sql = this.QueryCondition();
			if (this.ImgArrow2.ImageUrl.ToString() == "~/images/Gift/arrow-down.gif")
			{
				this.ImgArrow2.ImageUrl = "~/images/Gift/arrow-up.gif";
				this.BindExpenseHistoryNew(sql, true, "WinCount");
			}
			else
			{
				this.ImgArrow2.ImageUrl = "~/images/Gift/arrow-down.gif";
				this.BindExpenseHistoryNew(sql, false, "WinCount");
			}
		}

		protected string GetMemCard(string strMemCard)
		{
			string memCard;
			if (strMemCard == "0")
			{
				memCard = "无卡号";
			}
			else
			{
				memCard = strMemCard;
			}
			return memCard;
		}

		protected void NetPagerParameter_PageChanging(object src, PageChangingEventArgs e)
		{
			this.NetPagerParameter.CurrentPageIndex = e.NewPageIndex;
			this.BindExpenseHistory(this.QueryCondition());
		}

		protected void btnRptExpenseQuery_Click(object sender, EventArgs e)
		{
			this.NetPagerParameter.CurrentPageIndex = 1;
			this.BindExpenseHistory(this.QueryCondition());
		}

		protected void drpPageSize_SelectedIndexChanged(object sender, EventArgs e)
		{
			this.NetPagerParameter.CurrentPageIndex = 1;
			this.NetPagerParameter.PageSize = int.Parse(this.drpPageSize.SelectedValue);
			this.BindExpenseHistory(this.QueryCondition());
		}

		protected void rptExpenseHistory_ItemDataBound(object sender, RepeaterItemEventArgs e)
		{
		}

		protected void btnExpenseExcel_Click(object sender, EventArgs e)
		{
		}

		private void BindStatus()
		{
			List<ListItem> list = new List<ListItem>();
			list.Add(new ListItem("==== 请选择 ==== ", "0"));
			list.Add(new ListItem("待领取", "0"));
			list.Add(new ListItem("已领取", "1"));
		}
	}
}

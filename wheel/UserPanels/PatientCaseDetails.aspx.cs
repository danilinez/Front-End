using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Diagnostics;
using System.Data;
using Linez.Library.WHCS.BAL;
using Linez.Library.WHCS.SecurityManager;

public partial class UserPanels_PatientCaseDetails : System.Web.UI.Page
{
    Cases objCases;
    Contacts objPatient;
    Contacts objDoctor;
    GeneralQA objGeneralQA;
    Users objQueryAll;
    CaseOrder objCaseOrder;
    DetailQA objDetailQA;
    CaseDocument objCaseDocument;
    List<byte[]> fileChunks;
    OrderDetails objOrderDetail;
    int index = 0;
    public int chunkSize = 20480;//15360

    string fileName;
    double fileSize = 0;
    double sendData = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        ClientScript.RegisterStartupScript(GetType(), "Javascript", "javascript:initialize(); ", true);
        if (!IsPostBack)
        {
            if (Session["CaseID"] != null)
            {
                fnLoadDropDowns();
                fnLoadCaseDetail();
                fnLoadCasePostCode();
            }
            else
            {
                Response.Redirect("ManageCases.aspx", true);
                Response.End();
            }
        }
    }

    private void fnResetAllFields()
    {
        txtFirstName.Text = "";
        txtLastName.Text = "";
        txtDOB.Text = "";
        txtBillingAddress.Text = "";
        txtBillingEmail.Text = "";
        txtBillingPhone.Text = "";
        txtBillingPostCode.Text = "";

        txtShippingAddress.Text = "";
        txtShippingEmail.Text = "";
        txtShippingPhone.Text = "";
        txtShippingPostCode.Text = "";
  
        txtQAPastCondition.Text = "";
        txtQACurrentCondition.Text = "";
        txtQAFamilyCondition.Text = "";
        txtQADOB.Text = "";
        txtQAHeight.Text = "";
        txtQAWeight.Text = "";
        txtQAAllegiesList.Text = "";
        txtPhysicianPhone.Text = "";
        txtQAPrimaryPhysiican.Text = "";
        txtQALastDateVisit.Text = "";
        chkbQADrinkMoreThan2.Checked = false;
        chkbQAPlantoPragnent.Checked = false;
        chkbQAPragnent.Checked = false;
        chkbQASmokeMoreThan1.Checked = false;
        chkbQASmoke.Checked = false;

        //txtDQAAnswer.Text = "";
        //txtDQAQuestion.Text = "";
        txtOICaseDoctor.Text = "";
        txtOIDiscount.Text = "";

        if (ddlOIPharmacy.Items.Count > 0)
            ddlOIPharmacy.SelectedIndex = 0;

        txtOITrackingNo.Text = "";
        txtOIGiftCertificate.Text = "0";
        txtOIHandling.Text = "0";
        txtOIShipping.Text = "0";
        lblOIProductCode.Text = "-";
        txtOIQty.Text = "0";
        txtOIItemPrice.Text = "0";

        rdbOSCancelOrderNo.Checked = true;
        rdbOSOnHoldNo.Checked = true;

        txtOSCancelReason.Text = "";
        txtOSOnHoldReason.Text = "";
        txtOSComments.Text = "";

        txtDIDocInstructions.Text = "";
       


    }

    private void fnLoadCaseDetail()
    {
        objCases = new Cases();
        objCases.LoadByPrimaryKey(Convert.ToInt32(Session["CaseID"]));

        if (objCases.RowCount > 0)
        {
            Session["iPatientID"] = objCases.s_IPatientID;
            Session["iDoctorID"] = objCases.s_IExpretID;
            Session["iVenueID"] = objCases.s_IVenueID;

            if (objCases.s_SCaseStatus != "")
                ddlCaseStatus.SelectedValue = objCases.s_SCaseStatus;

            objPatient = new Contacts();
            objPatient.LoadByPrimaryKey(objCases.IPatientID);
            if (objPatient.RowCount > 0)
            {

                // Patient Information

                txtFirstName.Text = objPatient.s_SFirstName;
                txtLastName.Text = objPatient.s_SLastName;
                if (objPatient.s_DtDateOfBirth != "")
                    txtDOB.Text = objPatient.DtDateOfBirth.ToShortDateString();

                if (objPatient.s_SGender != "")
                    ddlGender.SelectedValue = objPatient.s_SGender;

                txtBillingAddress.Text = objCases.s_SBillingAddress;
                txtBillingPostCode.Text = objCases.s_SBillingPostCode;

                Session["sBillingPostCode"] = objCases.s_SBillingPostCode;

                hfBillingPostCode.Value = objCases.s_SBillingPostCode;
                txtBillingPhone.Text = objCases.s_SBillingPhone;
                txtBillingEmail.Text = objCases.s_SBillingEmail;
                if (objCases.s_SBillingCountry != "")
                    ddlBillingCountry.SelectedValue = objCases.s_SBillingCountry;


                txtShippingAddress.Text = objCases.s_SShippingAddress;
                txtShippingEmail.Text = objCases.s_SShippingEmail;
                txtShippingPhone.Text = objCases.s_SShippingPhone;
                txtShippingPostCode.Text = objCases.s_SShippingPostCode;
                if (objCases.s_SShippingCountry != "")
                    ddlShippingCountry.SelectedValue = objCases.s_SShippingCountry;

                // Patient Documents

                fnLoadCaseDocuments();

                // Basic Question and Answer

                objGeneralQA = new GeneralQA();
                objGeneralQA.Where.ICaseID.Value = objCases.ICaseID;
                objGeneralQA.Query.Load();
                if (objGeneralQA.RowCount > 0)
                {
                    if (objGeneralQA.s_DtDateofBirth != "")
                        txtQADOB.Text = objGeneralQA.DtDateofBirth.ToShortDateString();
                    else
                    {
                        if (objPatient.s_DtDateOfBirth != "")
                        {
                            txtQADOB.Text = objPatient.DtDateOfBirth.ToShortDateString();
                        }
                    }

                    if (objGeneralQA.s_SSex != "")
                        ddlQAGender.SelectedValue = objGeneralQA.s_SSex;
                    else
                    {
                        if (objPatient.s_SGender != "")
                        {
                            ddlQAGender.SelectedValue = objPatient.s_SGender;
                        }
                    }

                    if (objGeneralQA.s_SHieght != "")
                        txtQAHeight.Text = objGeneralQA.s_SHieght;
                    else
                        txtQAHeight.Text = "";

                    if (objGeneralQA.s_SWeight != "")
                        txtQAWeight.Text = objGeneralQA.s_SWeight;
                    else
                        txtQAWeight.Text = "";

                    chkbQADrinkMoreThan2.Checked = objGeneralQA.BtDoDrinkMoreThan2;
                    chkbQAPlantoPragnent.Checked = objGeneralQA.BtPlanToPragnent;
                    chkbQAPragnent.Checked = objGeneralQA.BtIsPregnant;
                    chkbQASmokeMoreThan1.Checked = objGeneralQA.BtSmokeMoreThan1;
                    chkbQASmoke.Checked = objGeneralQA.BtDoSmoke;
                    txtQAAllegiesList.Text = objGeneralQA.s_SListAllergies;
                    txtQAPastCondition.Text = objGeneralQA.s_SPastCondition;
                    txtQACurrentCondition.Text = objGeneralQA.s_SCurrentCondition;
                    txtQAFamilyCondition.Text = objGeneralQA.s_SFamilyCondition;

                    if (objGeneralQA.s_IPrimaryDoctorID == "")
                        ddlPrimaryPhysician.SelectedIndex = 0;
                    else
                        ddlPrimaryPhysician.SelectedValue = objGeneralQA.s_IPrimaryDoctorID;

                    txtQAPrimaryPhysiican.Text = objGeneralQA.s_SPrimaryPhyscian1;
                    txtPhysicianPhone.Text = objGeneralQA.s_SPhyscianPhone1;

                    if (objGeneralQA.s_DtDateLastDrVisit != "")
                        txtQALastDateVisit.Text = objGeneralQA.DtDateLastDrVisit.ToShortDateString();
                    else
                        txtQALastDateVisit.Text = "";
                }
                else
                {
                    if (ddlPrimaryPhysician.Items.Count > 0)
                        ddlPrimaryPhysician.SelectedIndex = 0;

                    txtQAPastCondition.Text = "";
                    txtQACurrentCondition.Text = "";
                    txtQAFamilyCondition.Text = "";
                    txtQADOB.Text = "";
                    txtQAHeight.Text = "";
                    txtQAWeight.Text = "";
                    txtQAAllegiesList.Text = "";
                    txtPhysicianPhone.Text = "";
                    txtQAPrimaryPhysiican.Text = "";
                    txtQALastDateVisit.Text = "";
                    chkbQADrinkMoreThan2.Checked = false;
                    chkbQAPlantoPragnent.Checked = false;
                    chkbQAPragnent.Checked = false;
                    chkbQASmokeMoreThan1.Checked = false;
                    chkbQASmoke.Checked = false;
                }

                // Load Detailed Question & Answers
                fnLoadDetailsQuestions();

                // Load Case Order Information
                fnLoadOrderInformation();

                // Load Case Notes
                fnLoadCaseNotes();
            }
        }


    }



    private void fnLoadCasePostCode()
    {
        Users objQuery = new Users();

        objQuery.ExecuteSql("SELECT sBillingPostCode,(Case when 1=1 then (select top 1 sPostCode from LinkedVenue WHERE iVenueID=objcase.iVenueID)else '' end)as sPostCode   from Cases objcase where iCaseID=" + Session["CaseID"].ToString() + "");
        //Session["sBillingCode"]=objQuery.DefaultView.Table;
        Session["sBillingCode"] = objQuery.DefaultView.Table.Rows[0].ItemArray[0].ToString();
        Session["sPostCode"] = objQuery.DefaultView.Table.Rows[0].ItemArray[1].ToString();
    }

    private void fnLoadCaseDocuments()
    {
        objQueryAll = new Users();
        objQueryAll.ExecuteSql("select iDocumentID, sDocumentName, sDocumentPath,sDescription from CaseDocument where iCaseID = " + Session["CaseID"].ToString() + "");

        lvDocument.Items.Clear();

        lvDocument.DataSource = objQueryAll.DefaultView;
        lvDocument.DataBind();
    }

    private void convertToChunks(byte[] imageFile)
    {
        double totalChunks = Math.Ceiling((double)imageFile.Length / (double)chunkSize);
        fileChunks = new List<byte[]>();

        for (int i = 0; i < totalChunks; i++)
        {
            byte[] chunk;

            int startIndex = i * chunkSize;
            if (startIndex + chunkSize > imageFile.Length)
                chunk = new byte[imageFile.Length - startIndex];
            else
                chunk = new byte[chunkSize];

            Array.Copy(imageFile, startIndex, chunk, 0, chunk.Length);

            fileChunks.Add(chunk);
        }
    }

    private void uploadChunks(int index, string filepaths)
    {
        saveFileChunk(fileName, fileChunks[index], filepaths);
    }

    public bool saveFileChunk(String fileName, byte[] chunk, string filepaths)
    {
        String bp = System.Web.Hosting.HostingEnvironment.MapPath(filepaths);
        String filePath = bp + fileName;
        if (System.IO.File.Exists(filePath))
        {
            try
            {
                FileStream fs = new FileStream(filePath, FileMode.Append, FileAccess.Write);
                if (fileChunks.Count != 0)
                {
                    for (int i = 0; i < fileChunks.Count; i++)
                        fs.Write(fileChunks[i], 0, fileChunks[i].Length);
                }
                fs.Close();

            }
            catch (Exception ex)
            {
                //throw ex;
            }
            return true;
        }
        else
        {
            try
            {
                FileStream fs = new FileStream(filePath, FileMode.Create, FileAccess.Write);
                //fs.Write(chunk, 0, (int)chunk.Length);

                if (fileChunks.Count != 0)
                {
                    for (int i = 0; i < fileChunks.Count; i++)
                        fs.Write(fileChunks[i], 0, fileChunks[i].Length);
                }
                fs.Close();
            }
            catch (Exception ex)
            {

            }
            return true;
        }
    }


    private void fnLoadGeneralQA()
    {
        GeneralQA objTmpGQA = new GeneralQA();
        objTmpGQA.Where.ICaseID.Value = Convert.ToInt32(Session["CaseID"]);
        objTmpGQA.Query.Load();

        if (objTmpGQA.RowCount > 0)
        {
            txtQADOB.Text = objTmpGQA.DtDateofBirth.ToShortDateString();
            txtQAHeight.Text = objTmpGQA.s_SHieght;

            txtQAWeight.Text = objTmpGQA.s_SWeight;

            ddlQAGender.SelectedValue = objTmpGQA.s_SSex;


            chkbQASmoke.Checked = objTmpGQA.BtDoSmoke;
            chkbQAPragnent.Checked = objTmpGQA.BtIsPregnant;
            chkbQASmokeMoreThan1.Checked = objTmpGQA.BtSmokeMoreThan1;
            chkbQADrinkMoreThan2.Checked = objTmpGQA.BtDoDrinkMoreThan2;

            chkbQAPlantoPragnent.Checked = objTmpGQA.BtPlanToPragnent;
            txtQAAllegiesList.Text = objTmpGQA.SListAllergies;
            txtQAPastCondition.Text = objTmpGQA.SPastCondition;
            txtQACurrentCondition.Text = objTmpGQA.s_SCurrentCondition;

            txtQAFamilyCondition.Text = objTmpGQA.SFamilyCondition;

            if (ddlPrimaryPhysician.SelectedIndex != 0)
            {
                objGeneralQA.s_IPrimaryDoctorID = ddlPrimaryPhysician.SelectedValue.ToString();
            }

            objGeneralQA.SPrimaryPhyscian1 = txtQAPrimaryPhysiican.Text;
            objGeneralQA.SPhyscianPhone1 = txtPhysicianPhone.Text;
            if (txtQALastDateVisit.Text != "")
            {
                objGeneralQA.DtDateLastDrVisit = Convert.ToDateTime(txtQALastDateVisit.Text);
            }

            objGeneralQA.s_IAdminCompanyID = Session["iAdminCompanyID"].ToString();
        }
        else
        {
            txtQAPastCondition.Text = "";
            txtQACurrentCondition.Text = "";
            txtQAFamilyCondition.Text = "";
            txtQADOB.Text = "";
            txtQAHeight.Text = "";
            txtQAWeight.Text = "";
            txtQAAllegiesList.Text = "";
            txtPhysicianPhone.Text = "";
            txtQAPrimaryPhysiican.Text = "";
            txtQALastDateVisit.Text = "";
            chkbQADrinkMoreThan2.Checked = false;
            chkbQAPlantoPragnent.Checked = false;
            chkbQAPragnent.Checked = false;
            chkbQASmokeMoreThan1.Checked = false;
            chkbQASmoke.Checked = false;
        }



    }

    private void fnLoadDropDowns()
    {
        Users objQuery = new Users();
        objQuery.ExecuteSql("select iContactID, isNull(sFirstName,'') +' '+ isNull(sLastName,'') as sName from Contacts where iUserTypeID = 2 and iAdminCompanyID = " + Session["iAdminCompanyID"].ToString() + "");

        CommonMethods.FillDropDownList(ddlPrimaryPhysician, objQuery.DefaultView, "sName", "iContactID");

        objQuery.ExecuteSql("select iContactID, isNull(sFirstName,'') +' '+ isNull(sLastName,'') as sName from Contacts where iUserTypeID = 3 and iAdminCompanyID = " + Session["iAdminCompanyID"].ToString() + "");
        CommonMethods.FillDropDownList(ddlOIPharmacy, objQuery.DefaultView, "sName", "iContactID");

        objQuery.ExecuteSql("select iProductID,sName from Products where iAdminCompanyID = " + Session["iAdminCompanyID"].ToString() + "");
        CommonMethods.FillDropDownList(ddlOIProducts, objQuery.DefaultView, "sName", "iProductID");


    }

    protected void ddlPrimaryPhysician_SelectedIndexChanged(object sender, EventArgs e)
    {
        Contacts objDoctor = new Contacts();
        objDoctor.LoadByPrimaryKey(Convert.ToInt32(ddlPrimaryPhysician.SelectedValue));
        if (objDoctor.RowCount > 0)
        {
            txtQAPrimaryPhysiican.Text = objDoctor.s_SFirstName + " " + objDoctor.s_SLastName;
            txtPhysicianPhone.Text = objDoctor.s_SPhone;
        }
    }


    private void fnResetDetailQAFields()
    {
        //txtDQAQuestion.Text = "";
        //txtDQAAnswer.Text = ""; ;
    }

    private void fnLoadDetailsQuestions()
    {
        objDetailQA = new DetailQA();
        DetailQA objTmpDetailQA = new DetailQA();
        objTmpDetailQA.Where.ICaseID.Value = Convert.ToInt32(Session["CaseID"]);

        objTmpDetailQA.Query.Load();

        if (objTmpDetailQA.RowCount > 0)
        {
            foreach (DataRow dr in objTmpDetailQA.DefaultView.Table.Rows)
            {
                objDetailQA.LoadByPrimaryKey(Convert.ToInt32(dr.ItemArray[0]));
                switch (dr.ItemArray[3].ToString().Trim())
                {
                    case "Do you suffer from depression?":
                        ddlQ1.SelectedValue = objDetailQA.SAnswer.Trim();
                        break;
                    case "Have you previously been treated for any type of immune deficiency?":
                        ddlQ2.SelectedValue = objDetailQA.SAnswer.Trim();
                        break;
                    case "Do you have a history of heart problems, fluid retention, or uncontrolled hypertension?":
                        ddlQ3.SelectedValue = objDetailQA.SAnswer.Trim();
                        break;
                    case "Have you ever had a seizure?":
                        ddlQ4.SelectedValue = objDetailQA.SAnswer.Trim();
                        break;
                    case "Have you ever had an allergic reaction to this medication?":
                        ddlQ5.SelectedValue = objDetailQA.SAnswer.Trim();
                        break;
                    case "Do you take or have you taken antidepressants?":
                        ddlQ6.SelectedValue = objDetailQA.SAnswer.Trim();
                        break;
                    case "Do you have a history of narcotic or opiate usage?":
                        ddlQ7.SelectedValue = objDetailQA.SAnswer.Trim();
                        break;
                    case "Do you have high blood pressure?":
                        ddlQ8.SelectedValue = objDetailQA.SAnswer.Trim();
                        break;
                    case "Your level of pain: On a scale of 1 - 10 with 1 being 'mild pain' and 10 being 'severe pain', please indicate how you would rate your level of pain.":
                        ddlQ9.SelectedValue = objDetailQA.SAnswer.Trim();

                        break;
                    case "Indicate the location of the pain :":
                        txtQ10.Text = objDetailQA.SAnswer.Trim();
                        break;
                    case "Indicate the duration of the pain: 0-6 months, 6 months - 1 year, greater than 1":
                        string[] strReply = objDetailQA.SAnswer.Split(',');
                        if (strReply.Length > 1)
                        {
                            ddlQ11.SelectedValue = strReply[0].Trim();
                            ddlQ112.SelectedValue = strReply[1].Trim();
                        }
                        break;

                }
            }
        }

    }

    //protected void lvDetailQA_ItemCommand(object sender, ListViewCommandEventArgs e)
    //{
    //    Session["iDetailQAID"] = e.CommandArgument;

    //    if (e.CommandName.ToString() == "EditQA")
    //    {
    //        objDetailQA = new DetailQA();

    //        objDetailQA.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument));

    //        if (objDetailQA.RowCount > 0)
    //        {
    //            txtDQAQuestion.Text = objDetailQA.s_SQuestion;
    //            txtDQAAnswer.Text = objDetailQA.s_SAnswer;
    //        }
    //    }
    //    else if (e.CommandName.ToString() == "DeleteQA")
    //    {
    //        objDetailQA = new DetailQA();

    //        objDetailQA.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument));

    //        objDetailQA.MarkAsDeleted();
    //        objDetailQA.Save();

    //        fnLoadDetailsQuestions();

    //    }
    //}

    private void fnLoadOrderInformation()
    {
        objCaseOrder = new CaseOrder();

        objCaseOrder.Where.ICaseID.Value = Convert.ToInt32(Session["CaseID"]);

        objCaseOrder.Query.Load();

        if (objCaseOrder.RowCount > 0)
        {
            objDoctor = new Contacts();

            objDoctor.LoadByPrimaryKey(Convert.ToInt32(Session["iDoctorID"]));

            txtOICaseDoctor.Text = objDoctor.s_SFirstName + " " + objDoctor.s_SLastName;

            txtOITrackingNo.Text = objCaseOrder.s_STrackingNo;

            if (objCaseOrder.s_NDiscount == "")
                txtOIDiscount.Text = objCaseOrder.s_NDiscount;
            else
                txtOIDiscount.Text = "0";

            if (objCaseOrder.s_NHandlingFee == "")
                txtOIHandling.Text = objCaseOrder.s_NHandlingFee;
            else
                txtOIHandling.Text = "0";

            if (objCaseOrder.s_NGiftCertification == "")
                txtOIGiftCertificate.Text = objCaseOrder.s_NGiftCertification;
            else
                txtOIGiftCertificate.Text = "0";

            if (objCaseOrder.s_NShippingFee == "")
                txtOIShipping.Text = objCaseOrder.s_NShippingFee;
            else
                txtOIShipping.Text = "0";

            if (objCaseOrder.s_IPharmacistID != "")
                ddlOIPharmacy.SelectedValue = objCaseOrder.s_IPharmacistID;


            // OTher info
            if (objCaseOrder.s_BtOnHold != "")
            {
                rdbOSOnHoldYes.Checked = objCaseOrder.BtOnHold;
                txtOSOnHoldReason.Text = objCaseOrder.s_SOnHoldReason;

            }
            else
                objCaseOrder.BtOnHold = false;

            if (objCaseOrder.s_BtOrderCancel != "")
            {
                rdbOSCancelOrderYes.Checked = objCaseOrder.BtOrderCancel;
                txtOSCancelReason.Text = objCaseOrder.s_SCancelReason;
            }
            else
                rdbOSCancelOrderNo.Checked = false;


            txtOSComments.Text = objCaseOrder.s_SComments;
            // Other Info




            objQueryAll = new Users();

            objQueryAll.ExecuteSql("select *,ROW_NUMBER() over (order by iOrderDetailID asc) as SerialNo from (select iOrderDetailID,(Case when 1=1 then (Select top 1 sName from Products where iProductID = objOD.iProductID) Else '' END) as sProductName,(Case when 1=1 then (Select top 1 sType from ProductType where iProductTypeID = objOD.iProductTypeID) Else '' END) as sType,isNull(nQuantity,0) as nQuantity,nItemPrice from OrderDetails objOD where iOrderID = " + objCaseOrder.s_IOrderID + " ) as t1 ");

            lvProductsList.Items.Clear();

            lvProductsList.DataSource = objQueryAll.DefaultView;

            lvProductsList.DataBind();

        }

        else
        {
            objDoctor = new Contacts();
            objDoctor.LoadByPrimaryKey(Convert.ToInt32(Session["iDoctorID"]));

            txtOICaseDoctor.Text = objDoctor.s_SFirstName + " " + objDoctor.s_SLastName;

            txtOIDiscount.Text = "0";

            if (ddlOIPharmacy.Items.Count > 0)
                ddlOIPharmacy.SelectedIndex = 0;

            txtOITrackingNo.Text = "";
            txtOIGiftCertificate.Text = "0";
            txtOIHandling.Text = "0";
            txtOIShipping.Text = "0";
            lblOIProductCode.Text = "-";
            txtOIQty.Text = "0";
            txtOIItemPrice.Text = "0";

            lvProductsList.Items.Clear();
        }

    }

    protected void ddlOIProducts_SelectedIndexChanged(object sender, EventArgs e)
    {
        Products objTmpProducts = new Products();
        objTmpProducts.LoadByPrimaryKey(Convert.ToInt32(ddlOIProducts.SelectedValue));
        if (objTmpProducts.RowCount > 0)
        {
            lblOIProductCode.Text = objTmpProducts.s_SProductCode;
            txtOIItemPrice.Text = objTmpProducts.s_NPrice;
        }
        else
            fnResetProductFields();
    }

    private void fnLoadOrderDetails(int iCaseOrderID)
    {
        objQueryAll = new Users();
        objQueryAll.ExecuteSql("select *,ROW_NUMBER() over (order by iOrderDetailID asc) as SerialNo from (select iOrderDetailID,(Case when 1=1 then (Select top 1 sName from Products where iProductID = objOD.iProductID) Else '' END) as sProductName,(Case when 1=1 then (Select top 1 sType from ProductType where iProductTypeID = objOD.iProductTypeID) Else '' END) as sType,isNull(nQuantity,0) as nQuantity,nItemPrice from OrderDetails objOD where iOrderID = " + iCaseOrderID.ToString() + " ) as t1 ");

        lvProductsList.Items.Clear();

        lvProductsList.DataSource = objQueryAll.DefaultView;
        lvProductsList.DataBind();
    }

    private void fnResetProductFields()
    {
        lblOIProductCode.Text = "-";
        txtOIQty.Text = "0";
        txtOIItemPrice.Text = "0";
    }

    private void fnLoadCaseNotes()
    {
        objQueryAll = new Users();
        objQueryAll.ExecuteSql("select *,ROW_NUMBER() over (order by iCaseNoteID asc) as CaseNoteSerialNo from (select iCaseNoteID, sDescription from CaseNotes where iCaseID = " + Session["CaseID"].ToString() + ") as t1 ");
        lvNotes.Items.Clear();
        lvNotes.DataSource = objQueryAll.DefaultView;
        lvNotes.DataBind();
    }

}
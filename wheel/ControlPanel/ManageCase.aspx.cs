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
public partial class ControlPanel_ManageCase : ControlPanelSessionManager
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

        txtDocumentTitle.Text = "";
        txtDocumentDescription.Text = "";

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
        txtDIDocNotes.Text = "";


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
                txtDIDocInstructions.Text = objCases.s_SDoctorInstructions;

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

    protected void imgBtnPatientSave_Click(object sender, ImageClickEventArgs e)
    {
        objCases = new Cases();

        objCases.LoadByPrimaryKey(Convert.ToInt32(Session["CaseID"]));

        if (objCases.RowCount > 0)
        {
            objPatient = new Contacts();

            if (Session["iPatientID"] != null)
                objPatient.LoadByPrimaryKey(Convert.ToInt32(Session["iPatientID"]));
            else
                objPatient.AddNew();

            objPatient.s_SFirstName = txtFirstName.Text;
            objPatient.s_SLastName = txtLastName.Text;
            objPatient.s_SGender = ddlGender.SelectedValue;
            objPatient.DtDateOfBirth = Convert.ToDateTime(txtDOB.Text);
            objPatient.s_SAddress = txtBillingAddress.Text;
            objPatient.s_SPostcode = txtBillingPostCode.Text;
            objPatient.s_SPhone = txtBillingPhone.Text;
            objPatient.s_SCountry = ddlBillingCountry.SelectedValue.ToString();

            objCases.s_SBillingAddress = txtBillingAddress.Text;
            objCases.s_SBillingCountry = ddlBillingCountry.SelectedValue.ToString();
            objCases.s_SBillingPhone = txtBillingPhone.Text;
            objCases.s_SBillingPostCode = txtBillingPostCode.Text;
            objCases.s_SBillingEmail = txtBillingEmail.Text;

            objCases.s_SShippingAddress = txtShippingAddress.Text;
            objCases.s_SShippingCountry = ddlShippingCountry.SelectedValue.ToString();
            objCases.s_SShippingPhone = txtShippingPhone.Text;
            objCases.s_SShippingPostCode = txtShippingPostCode.Text;
            objCases.s_SShippingEmail = txtShippingEmail.Text;
            objCases.s_SCaseStatus = ddlCaseStatus.SelectedValue.ToString();
            objCases.s_SDoctorInstructions = txtDIDocInstructions.Text;
            objCases.Save();
            Session["CaseID"] = objCases.s_ICaseID;
        }


    }
    protected void imgbtnSaveFile_Click(object sender, ImageClickEventArgs e)
    {
        objCaseDocument = new CaseDocument();

        if (Session["DocMode"] != null && Session["DocMode"].ToString() == "Edit" && Session["iDocID"] != null)
        {
            if (Session["UploadedFileTmp"] != null)
            {
                objCaseDocument.LoadByPrimaryKey(Convert.ToInt32(Session["iDocID"]));

                try
                {
                    if (File.Exists(Server.MapPath("~/UploadedCaseDocuments/" + objCaseDocument.s_SDocumentPath)))
                    {
                        File.Delete(Server.MapPath("~/UploadedCaseDocuments/" + objCaseDocument.s_SDocumentPath));
                    }
                }
                catch (Exception)
                {
                }


                FileUpload fluUploadDocument = (FileUpload)Session["UploadedFileTmp"];

                if (fluUploadDocument.HasFile)
                {
                    objCaseDocument.SDocumentName = txtDocumentTitle.Text;
                    objCaseDocument.SDescription = txtDocumentDescription.Text;
                    objCaseDocument.s_ICaseID = Session["CaseID"].ToString();
                    objCaseDocument.DtCreatedDate = System.DateTime.Now;
                    objCaseDocument.s_IPatient = Session["iPatientID"].ToString();
                    objCaseDocument.s_SDocumentPath = Guid.NewGuid().ToString() + fluUploadDocument.FileName;

                    string ext1 = System.IO.Path.GetExtension(objCaseDocument.s_SDocumentPath);

                    //if (ext1.ToLowerInvariant() == ".doc" || ext1.ToLowerInvariant() == ".jpg" || ext1.ToLowerInvariant() == ".jpeg" || ext1.ToLowerInvariant() == ".png" || ext1.ToLowerInvariant() == ".bmp" || ext1.ToLowerInvariant() == ".docx" || ext1.ToLowerInvariant() == ".pdf" || ext1.ToLowerInvariant() == ".rar" || ext1.ToLowerInvariant() == ".zip")
                    //{
                    // Modified By Adeel
                    #region New Upload Method

                    fileName = objCaseDocument.s_SDocumentPath;
                    Stream fs = fluUploadDocument.FileContent;
                    fileSize = (double)fs.Length;

                    index = 0;
                    sendData = 0;
                    byte[] file = new byte[fs.Length];
                    fs.Read(file, 0, file.Length);
                    convertToChunks(file);

                    uploadChunks(index, "~/UploadedCaseDocuments/");


                    #endregion
                    objCaseDocument.Save();

                    lblDocumentError.Text = "File Updated Successfully";
                    lblDocumentError.ForeColor = System.Drawing.Color.DarkGreen;
                    lblDocumentError.Visible = true;
                    fnResetDocumentFields();
                    Session["DocMode"] = null;
                    Session["iDocID"] = null;
                    Session["UploadedFileTmp"] = null;
                    fnLoadCaseDocuments();

                    fnResetDocumentFields();

                    return;

                    //}
                    //else
                    //{
                    //    lblDocumentError.Text = "Invalid document format";
                    //    lblDocumentError.ForeColor = System.Drawing.Color.Maroon;
                    //    lblDocumentError.Visible = true;
                    //}

                }


            }

        }
        else
        {
            if (Session["UploadedFileTmp"] != null)
            {
                objCaseDocument.AddNew();

                FileUpload fluUploadDocument = (FileUpload)Session["UploadedFileTmp"];

                if (fluUploadDocument.HasFile)
                {
                    objCaseDocument.SDocumentName = txtDocumentTitle.Text;
                    objCaseDocument.SDescription = txtDocumentDescription.Text;
                    objCaseDocument.s_ICaseID = Session["CaseID"].ToString();
                    objCaseDocument.DtCreatedDate = System.DateTime.Now;
                    objCaseDocument.s_IPatient = Session["iPatientID"].ToString();
                    objCaseDocument.s_SDocumentPath = Guid.NewGuid().ToString() + fluUploadDocument.FileName;

                    string ext1 = System.IO.Path.GetExtension(objCaseDocument.s_SDocumentPath);

                    if (ext1.ToLowerInvariant() == ".doc" || ext1.ToLowerInvariant() == ".jpg" || ext1.ToLowerInvariant() == ".jpeg" || ext1.ToLowerInvariant() == ".png" || ext1.ToLowerInvariant() == ".bmp" || ext1.ToLowerInvariant() == ".docx" || ext1.ToLowerInvariant() == ".pdf" || ext1.ToLowerInvariant() == ".rar" || ext1.ToLowerInvariant() == ".zip")
                    {
                        // Modified By Adeel
                        #region New Upload Method

                        fileName = objCaseDocument.s_SDocumentPath;
                        Stream fs = fluUploadDocument.FileContent;
                        fileSize = (double)fs.Length;

                        index = 0;
                        sendData = 0;
                        byte[] file = new byte[fs.Length];
                        fs.Read(file, 0, file.Length);
                        convertToChunks(file);

                        uploadChunks(index, "~/UploadedCaseDocuments/");


                        #endregion
                        objCaseDocument.Save();

                        lblDocumentError.Text = "File Added Successfully";
                        lblDocumentError.ForeColor = System.Drawing.Color.DarkGreen;
                        lblDocumentError.Visible = true;
                        fnResetDocumentFields();
                        Session["DocMode"] = null;
                        Session["iDocID"] = null;
                        Session["UploadedFileTmp"] = null;
                        fnLoadCaseDocuments();

                        fnResetDocumentFields();

                        return;

                    }
                    else
                    {
                        lblDocumentError.Text = "Invalid document format";
                        lblDocumentError.ForeColor = System.Drawing.Color.Maroon;
                        lblDocumentError.Visible = true;
                    }

                }
            }
        }

    }
    protected void imgbtnCancelFile_Click(object sender, ImageClickEventArgs e)
    {
        Session["DocMode"] = null;
        Session["iDocID"] = null;
    }
    protected void imgBtnPatientCancel_Click(object sender, ImageClickEventArgs e)
    {
        objPatient = new Contacts();
        objPatient.LoadByPrimaryKey(Convert.ToInt32(Session["iPatientID"]));

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

    private void fnResetDocumentFields()
    {
        txtDocumentTitle.Text = "";
        txtDocumentDescription.Text = "";
    }

    protected void lvDocument_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        int iDocumentID = Convert.ToInt32(e.CommandArgument);

        if (e.CommandName == "EditDocument")
        {
            objCaseDocument = new CaseDocument();
            objCaseDocument.LoadByPrimaryKey(iDocumentID);

            Session["DocMode"] = "Edit";
            Session["iDocID"] = iDocumentID.ToString();
            //Session["OldFileName"] = objCaseDocument.s_SDocumentPath;
            lblDocumentError.Text = "../" + objCaseDocument.s_SDocumentPath;
            lblDocumentError.ForeColor = System.Drawing.Color.DarkGreen;
            lblDocumentError.Visible = true;
        }
        else if (e.CommandName == "DeleteDocument")
        {
            objCaseDocument = new CaseDocument();
            objCaseDocument.LoadByPrimaryKey(iDocumentID);
            try
            {
                if (File.Exists(Server.MapPath("~/UploadedCaseDocuments/" + objCaseDocument.s_SDocumentPath)))
                {
                    File.Delete(Server.MapPath("~/UploadedCaseDocuments/" + objCaseDocument.s_SDocumentPath));
                }
            }
            catch (Exception)
            {
            }

            objCaseDocument.MarkAsDeleted();
            objCaseDocument.Save();

            fnLoadCaseDocuments();
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

    protected void imgBtnSaveQA_Click(object sender, ImageClickEventArgs e)
    {

        try
        {
            GeneralQA objTmpGQA = new GeneralQA();
            objGeneralQA = new GeneralQA();
            objTmpGQA.Where.ICaseID.Value = Convert.ToInt32(Session["CaseID"]);

            objTmpGQA.Query.Load();

            if (objTmpGQA.RowCount > 0)
            {
                objGeneralQA.LoadByPrimaryKey(objTmpGQA.IQaID);
            }
            else
                objGeneralQA.AddNew();


            objGeneralQA.s_ICaseID = Session["CaseID"].ToString();
            objGeneralQA.s_IPatient = Session["iPatientID"].ToString();
            objGeneralQA.DtDateofBirth = Convert.ToDateTime(txtQADOB.Text);
            objGeneralQA.SHieght = txtQAHeight.Text;
            objGeneralQA.SWeight = txtQAWeight.Text;
            objGeneralQA.SSex = ddlQAGender.SelectedValue.ToString();
            objGeneralQA.BtDoSmoke = chkbQASmoke.Checked;
            objGeneralQA.BtSmokeMoreThan1 = chkbQASmokeMoreThan1.Checked;
            objGeneralQA.BtDoDrinkMoreThan2 = chkbQADrinkMoreThan2.Checked;
            objGeneralQA.BtIsPregnant = chkbQAPragnent.Checked;
            objGeneralQA.BtPlanToPragnent = chkbQAPlantoPragnent.Checked;
            objGeneralQA.SListAllergies = txtQAAllegiesList.Text;
            objGeneralQA.SPastCondition = txtQAPastCondition.Text;
            objGeneralQA.s_SCurrentCondition = txtQACurrentCondition.Text;
            objGeneralQA.SFamilyCondition = txtQAFamilyCondition.Text;

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
            objGeneralQA.DtCreatedDate = System.DateTime.Now;

            objGeneralQA.Save();

        }
        catch (Exception)
        {
        }


    }

    protected void imgBtnCancelQA_Click(object sender, ImageClickEventArgs e)
    {
        // Basic Question and Answer

        objGeneralQA = new GeneralQA();
        objGeneralQA.Where.ICaseID.Value = Convert.ToInt32(Session["CaseID"]);
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

    protected void imgBtnDQACancel_Click(object sender, ImageClickEventArgs e)
    {
        Session["iDetailQAID"] = null;
        fnResetDetailQAFields();
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

    protected void btnAddProduct_Click(object sender, EventArgs e)
    {
        // Save Case order 
        int iCaseOrderID = fnSaveCaseOrder();
        Products objProduct = new Products();
        objProduct.LoadByPrimaryKey(Convert.ToInt32(ddlOIProducts.SelectedValue));

        objOrderDetail = new OrderDetails();

        if (Session["OrderDetailID"] == null)
        {
            objOrderDetail.AddNew();
        }

        else if (Session["OrderDetailID"] != null)
        {
            objOrderDetail.LoadByPrimaryKey(Convert.ToInt32(Session["OrderDetailID"]));
        }

        objOrderDetail.IOrderID = iCaseOrderID;
        objOrderDetail.s_IProductID = ddlOIProducts.SelectedValue.ToString();
        objOrderDetail.IProductTypeID = objProduct.IProductTypeID;
        objOrderDetail.s_NQuantity = txtOIQty.Text;
        objOrderDetail.s_NItemPrice = txtOIItemPrice.Text;
        objOrderDetail.Save();
        Session["OrderDetailID"] = null;
        fnLoadOrderDetails(iCaseOrderID);
        fnResetProductFields();
    }

    protected void btnCancelProduct_Click(object sender, EventArgs e)
    {
        if (ddlOIProducts.Items.Count > 0)
            ddlOIProducts.SelectedIndex = 0;
        txtOIItemPrice.Text = "0";
        lblOIProductCode.Text = "-";
        Session["OrderDetailID"] = null;
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

    private int fnSaveCaseOrder()
    {
        objCaseOrder = new CaseOrder();
        objCaseOrder.Where.ICaseID.Value = Convert.ToInt32(Session["CaseID"]);
        objCaseOrder.Query.Load();

        CaseOrder objTmpCaseOrder = new CaseOrder();

        if (objCaseOrder.RowCount > 0)
        {
            objTmpCaseOrder.LoadByPrimaryKey(objCaseOrder.IOrderID);
        }
        else
        {
            objTmpCaseOrder.AddNew();
        }

        objTmpCaseOrder.s_ICaseID = Session["CaseID"].ToString();
        objTmpCaseOrder.s_IAdminCompanyID = Session["iAdminCompanyID"].ToString();
        objTmpCaseOrder.s_IPatientID = Session["iPatientID"].ToString();
        objTmpCaseOrder.s_IDoctorID = Session["iDoctorID"].ToString();
        objTmpCaseOrder.s_STrackingNo = txtOITrackingNo.Text;
        objTmpCaseOrder.s_NDiscount = txtOIDiscount.Text;
        objTmpCaseOrder.s_NGiftCertification = txtOIGiftCertificate.Text;
        objTmpCaseOrder.s_NHandlingFee = txtOIHandling.Text;
        objTmpCaseOrder.s_NShippingFee = txtOIShipping.Text;
        objTmpCaseOrder.DtCreatedDate = System.DateTime.Now;
        objTmpCaseOrder.s_IPharmacistID = ddlOIPharmacy.SelectedValue.ToString();

        objTmpCaseOrder.Save();

        return objTmpCaseOrder.IOrderID;
    }

    private void fnLoadOrderDetails(int iCaseOrderID)
    {
        objQueryAll = new Users();
        objQueryAll.ExecuteSql("select *,ROW_NUMBER() over (order by iOrderDetailID asc) as SerialNo from (select iOrderDetailID,(Case when 1=1 then (Select top 1 sName from Products where iProductID = objOD.iProductID) Else '' END) as sProductName,(Case when 1=1 then (Select top 1 sType from ProductType where iProductTypeID = objOD.iProductTypeID) Else '' END) as sType,isNull(nQuantity,0) as nQuantity,nItemPrice from OrderDetails objOD where iOrderID = " + iCaseOrderID.ToString() + " ) as t1 ");

        lvProductsList.Items.Clear();

        lvProductsList.DataSource = objQueryAll.DefaultView;
        lvProductsList.DataBind();
    }

    protected void imgbtnOISave_Click(object sender, ImageClickEventArgs e)
    {
        int CaseOrderID = fnSaveCaseOrder();

        objCaseOrder = new CaseOrder();
        objCaseOrder.LoadByPrimaryKey(CaseOrderID);

        if (rdbOSOnHoldYes.Checked)
        {
            objCaseOrder.BtOnHold = true;
            objCaseOrder.s_SOnHoldReason = txtOSOnHoldReason.Text;

        }
        else if (rdbOSOnHoldNo.Checked)
        {
            objCaseOrder.BtOnHold = false;
        }
        else
            objCaseOrder.BtOnHold = false;

        if (rdbOSCancelOrderYes.Checked)
        {
            objCaseOrder.BtOrderCancel = true;
            objCaseOrder.s_SCancelReason = txtOSCancelReason.Text;

        }
        else if (rdbOSCancelOrderNo.Checked)
        {
            objCaseOrder.BtOrderCancel = false;
        }
        else
            objCaseOrder.BtOrderCancel = false;


        objCaseOrder.s_SComments = txtOSComments.Text;

        objCaseOrder.Save();

        fnResetProductFields();

    }

    private void fnResetProductFields()
    {
        lblOIProductCode.Text = "-";
        txtOIQty.Text = "0";
        txtOIItemPrice.Text = "0";
    }

    protected void imgbtnOICancel_Click(object sender, ImageClickEventArgs e)
    {
        // Load Case Order Information
        fnLoadOrderInformation();
    }

    protected void btnAddNote_Click(object sender, EventArgs e)
    {
        CaseNotes objCaseNotes = new CaseNotes();

        if (Session["iCaseNoteID"] != null)
        {
            objCaseNotes.LoadByPrimaryKey(Convert.ToInt32(Session["iCaseNoteID"]));
            objCaseNotes.DtModiffyDate = System.DateTime.Now;
        }
        else
        {
            objCaseNotes.AddNew();
            objCaseNotes.DtCreatedDate = System.DateTime.Now;
        }

        objCaseNotes.s_ICaseID = Session["CaseID"].ToString();
        objCaseNotes.s_SDescription = txtDIDocNotes.Text;

        Users objUser = (Users)Session["UserID"];

        objCaseNotes.IUserIDCreatedBy = objUser.IUserID;

        objCaseNotes.Save();
        Session["iCaseNoteID"] = null;

        txtDIDocNotes.Text = "";

        fnLoadCaseNotes();
    }

    protected void btnCancelNote_Click(object sender, EventArgs e)
    {
        fnLoadCaseNotes();
    }

    private void fnLoadCaseNotes()
    {
        objQueryAll = new Users();
        objQueryAll.ExecuteSql("select *,ROW_NUMBER() over (order by iCaseNoteID asc) as CaseNoteSerialNo from (select iCaseNoteID, sDescription from CaseNotes where iCaseID = " + Session["CaseID"].ToString() + ") as t1 ");
        lvNotes.Items.Clear();
        lvNotes.DataSource = objQueryAll.DefaultView;
        lvNotes.DataBind();
    }

    protected void lvProductsList_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        int iOrderDetailID = Convert.ToInt32(e.CommandArgument);

        if (e.CommandName.ToString() == "EditProduct")
        {
            objOrderDetail = new OrderDetails();
            objOrderDetail.LoadByPrimaryKey(iOrderDetailID);
            if (objOrderDetail.RowCount > 0)
            {
                Session["OrderDetailID"] = iOrderDetailID;
                if (objOrderDetail.s_IProductID != "")
                {
                    Products objProduct = new Products();
                    objProduct.LoadByPrimaryKey(objOrderDetail.IProductID);
                    if (objProduct.RowCount > 0)
                    {
                        ddlOIProducts.SelectedValue = objOrderDetail.s_IProductID;
                        lblOIProductCode.Text = objProduct.s_SProductCode;
                    }

                    txtOIItemPrice.Text = objOrderDetail.s_NItemPrice;
                    txtOIQty.Text = objOrderDetail.s_NQuantity;
                    return;
                }
            }
        }
        else if (e.CommandName.ToString() == "DeleteProduct")
        {
            objOrderDetail = new OrderDetails();
            objOrderDetail.LoadByPrimaryKey(iOrderDetailID);

            int iCaseOrderID = objOrderDetail.IOrderID;


            if (objOrderDetail.RowCount > 0)
            {
                objOrderDetail.MarkAsDeleted();
                objOrderDetail.Save();
            }

            fnLoadOrderDetails(iCaseOrderID);
        }

    }
    protected void imgBtnSaveDetailsQA_Click(object sender, ImageClickEventArgs e)
    {
        try
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
                            objDetailQA.SAnswer = ddlQ1.SelectedValue.ToString();
                            objDetailQA.Save();
                            break;
                        case "Have you previously been treated for any type of immune deficiency?":
                            objDetailQA.SAnswer = ddlQ2.SelectedValue.ToString();
                            objDetailQA.Save();
                            break;
                        case "Do you have a history of heart problems, fluid retention, or uncontrolled hypertension?":
                            objDetailQA.SAnswer = ddlQ3.SelectedValue.ToString();
                            objDetailQA.Save();
                            break;
                        case "Have you ever had a seizure?":
                            objDetailQA.SAnswer = ddlQ4.SelectedValue.ToString();
                            objDetailQA.Save();
                            break;
                        case "Have you ever had an allergic reaction to this medication?":
                            objDetailQA.SAnswer = ddlQ5.SelectedValue.ToString();
                            objDetailQA.Save();
                            break;
                        case "Do you take or have you taken antidepressants?":
                            objDetailQA.SAnswer = ddlQ6.SelectedValue.ToString();
                            objDetailQA.Save();
                            break;
                        case "Do you have a history of narcotic or opiate usage?":
                            objDetailQA.SAnswer = ddlQ7.SelectedValue.ToString();
                            objDetailQA.Save();
                            break;
                        case "Do you have high blood pressure?":
                            objDetailQA.SAnswer = ddlQ8.SelectedValue.ToString();
                            objDetailQA.Save();
                            break;
                        case "Your level of pain: On a scale of 1 - 10 with 1 being 'mild pain' and 10 being 'severe pain', please indicate how you would rate your level of pain.":
                            objDetailQA.SAnswer = ddlQ9.SelectedValue.ToString();
                            objDetailQA.Save();
                            break;
                        case "Indicate the location of the pain :":
                            objDetailQA.SAnswer = txtQ10.Text;
                            objDetailQA.Save();
                            break;
                        case "Indicate the duration of the pain: 0-6 months, 6 months - 1 year, greater than 1":
                            objDetailQA.SAnswer = ddlQ11.SelectedValue.ToString() + "," + ddlQ112.SelectedValue.ToString();
                            objDetailQA.Save();
                            break;

                    }
                }
            }
            else
            {
                for (int i = 1; i <= 11; i++)
                {
                    objDetailQA.AddNew();

                    objDetailQA.s_ICaseID = Session["CaseID"].ToString();
                    objDetailQA.s_IPatient = Session["iPatientID"].ToString();
                    objDetailQA.s_IAdminCompanyID = Session["iAdminCompanyID"].ToString();

                    Users objUsers = (Users)Session["UserID"];
                    if (objUsers.RowCount > 0)
                    {
                        objDetailQA.IUserID = objUsers.IUserID;
                    }
                    objDetailQA.DtCreatedDate = System.DateTime.Now;



                    switch (i)
                    {
                        case 1:
                            objDetailQA.SQuestion = "Do you suffer from depression?";
                            objDetailQA.SAnswer = ddlQ1.SelectedValue.ToString();
                            objDetailQA.Save();
                            break;
                        case 2:
                            objDetailQA.SQuestion = "Have you previously been treated for any type of immune deficiency?";
                            objDetailQA.SAnswer = ddlQ2.SelectedValue.ToString();
                            objDetailQA.Save();
                            break;
                        case 3:
                            objDetailQA.SQuestion = "Do you have a history of heart problems, fluid retention, or uncontrolled hypertension?";
                            objDetailQA.SAnswer = ddlQ3.SelectedValue.ToString();
                            objDetailQA.Save();
                            break;
                        case 4:
                            objDetailQA.SQuestion = "Have you ever had a seizure?";
                            objDetailQA.SAnswer = ddlQ4.SelectedValue.ToString();
                            objDetailQA.Save();
                            break;
                        case 5:
                            objDetailQA.SQuestion = "Have you ever had an allergic reaction to this medication?";
                            objDetailQA.SAnswer = ddlQ5.SelectedValue.ToString();
                            objDetailQA.Save();
                            break;
                        case 6:
                            objDetailQA.SQuestion = "Do you take or have you taken antidepressants?";
                            objDetailQA.SAnswer = ddlQ6.SelectedValue.ToString();
                            objDetailQA.Save();
                            break;
                        case 7:
                            objDetailQA.SQuestion = "Do you have a history of narcotic or opiate usage?";
                            objDetailQA.SAnswer = ddlQ7.SelectedValue.ToString();
                            objDetailQA.Save();
                            break;
                        case 8:
                            objDetailQA.SQuestion = "Do you have high blood pressure?";
                            objDetailQA.SAnswer = ddlQ8.SelectedValue.ToString();
                            objDetailQA.Save();
                            break;
                        case 9:
                            objDetailQA.SQuestion = "Your level of pain: On a scale of 1 - 10 with 1 being 'mild pain' and 10 being 'severe pain', please indicate how you would rate your level of pain.";
                            objDetailQA.SAnswer = ddlQ9.SelectedValue.ToString();
                            objDetailQA.Save();
                            break;
                        case 10:
                            objDetailQA.SQuestion = "Indicate the location of the pain :";
                            objDetailQA.SAnswer = txtQ10.Text;
                            objDetailQA.Save();
                            break;
                        case 11:
                            objDetailQA.SQuestion = "Indicate the duration of the pain: 0-6 months, 6 months - 1 year, greater than 1";
                            objDetailQA.SAnswer = ddlQ11.SelectedValue.ToString() + "," + ddlQ112.SelectedValue.ToString();
                            objDetailQA.Save();
                            break;

                    }

                }

            }


        }
        catch (Exception)
        {
        }
    }
    protected void lvNotes_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        int iNoteID = Convert.ToInt32(e.CommandArgument);

        if (e.CommandName == "EditNote")
        {
            CaseNotes objCN = new CaseNotes();
            objCN.LoadByPrimaryKey(iNoteID);

            txtDIDocNotes.Text = objCN.s_SDescription;
            Session["iCaseNoteID"] = iNoteID;
        }
        else if (e.CommandName == "DeleteNote")
        {
            CaseNotes objCN = new CaseNotes();
            objCN.LoadByPrimaryKey(iNoteID);

            if (objCN.RowCount > 0)
            {
                objCN.MarkAsDeleted();
                objCN.Save();
            }
        }
    }
}

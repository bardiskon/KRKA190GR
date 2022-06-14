report 59000 "Sales Invoices"
{
    DefaultLayout = RDLC;
    RDLCLayout = './KrKa Objects\Reports\SalesInvoices.rdlc';
    Caption = 'Sales Invoices';
    ApplicationArea = All;
    UsageCategory = ReportsAndAnalysis;
    Permissions = TableData "Sales Header" = rm,
                  TableData "Purchase Header" = rm,
                  TableData "Sales Shipment Header" = rm,
                  TableData "Sales Invoice Header" = rm,
                  TableData "Sales Cr.Memo Header" = rm,
                  TableData "Purch. Rcpt. Header" = rm,
                  TableData "Purch. Inv. Header" = rm,
                  TableData "Purch. Cr. Memo Hdr." = rm,
                  TableData "Transfer Header" = rm,
                  TableData "Transfer Shipment Header" = rm,
                  TableData "Transfer Receipt Header" = rm,
                  TableData "Service Header" = rm,
                  TableData "Service Shipment Header" = rm,
                  TableData "Service Invoice Header" = rm,
                  TableData "Service Cr.Memo Header" = rm,
                  TableData "Return Shipment Header" = rm,
                  TableData "Return Receipt Header" = rm;

    dataset
    {
        dataitem("Sales Header"; "Sales Header")
        {
            DataItemTableView = SORTING("Document Type", "No.") ORDER(Ascending);

            trigger OnAfterGetRecord()
            begin
                DocManagment.CopyFromSalesHeader("Sales Header", TmpDocumentHeader, TmpDocumentLine, ReportNumber);
                // DocManagment.GetBailments(BailmentLines);
                if not CurrReport.Preview then begin
                    "No. Printed" += 1;
                    Modify;
                    Commit;
                end;
            end;

            trigger OnPreDataItem()
            begin
                if DocumentType = DocumentType::"Sales Order" then begin
                    SetRange("Document Type", "Document Type"::Order);
                    SetFilter("No.", DocumentNo);
                end;
                if GetFilters = '' then begin
                    CurrReport.Break;
                end;
            end;
        }
        dataitem("Sales Invoice Header"; "Sales Invoice Header")
        {
            DataItemTableView = SORTING("No.") ORDER(Ascending);

            trigger OnAfterGetRecord()
            begin
                DocManagment.CopyFromSalesInvoice("Sales Invoice Header", TmpDocumentHeader, TmpDocumentLine, ReportNumber);
                //DocManagment.GetBailments(BailmentLines);
                if not CurrReport.Preview then begin
                    "No. Printed" += 1;
                    Modify;
                    Commit;
                end;
            end;

            trigger OnPreDataItem()
            begin
                if DocumentType = DocumentType::"Sales Invoice" then begin
                    SetFilter("No.", DocumentNo);
                end;
                if GetFilters = '' then begin
                    CurrReport.Break;
                end;
            end;
        }
        dataitem("Sales Shipment Header"; "Sales Shipment Header")
        {
            DataItemTableView = SORTING("No.") ORDER(Ascending);

            trigger OnAfterGetRecord()
            begin
                DocManagment.CopyFromSalesShipment("Sales Shipment Header", TmpDocumentHeader, TmpDocumentLine, ReportNumber);
                //DocManagment.GetBailments(BailmentLines);
                if not CurrReport.Preview then begin
                    "No. Printed" += 1;
                    Modify;
                    Commit;
                end;
            end;

            trigger OnPreDataItem()
            begin
                if DocumentType = DocumentType::"Sales Shipment" then begin
                    SetFilter("No.", DocumentNo);
                end;
                if GetFilters = '' then begin
                    CurrReport.Break;
                end;
            end;
        }
        dataitem("Sales Cr.Memo Header"; "Sales Cr.Memo Header")
        {
            DataItemTableView = SORTING("No.") ORDER(Ascending);

            trigger OnAfterGetRecord()
            begin
                DocManagment.CopyFromSalesCreditMemo("Sales Cr.Memo Header", TmpDocumentHeader, TmpDocumentLine, ReportNumber);
                //DocManagment.GetBailments(BailmentLines);
                if not CurrReport.Preview then begin
                    "No. Printed" += 1;
                    Modify;
                    Commit;
                end;
            end;

            trigger OnPreDataItem()
            begin
                if DocumentType = DocumentType::"Sales Credit Memo" then begin
                    SetFilter("No.", DocumentNo);
                end;
                if GetFilters = '' then begin
                    CurrReport.Break;
                end;
            end;
        }
        dataitem("Return Receipt Header"; "Return Receipt Header")
        {
            DataItemTableView = SORTING("No.") ORDER(Ascending);

            trigger OnAfterGetRecord()
            begin
                DocManagment.CopyFromSalesReturnReceipt("Return Receipt Header", TmpDocumentHeader, TmpDocumentLine, ReportNumber);
                //DocManagment.GetBailments(BailmentLines);
                if not CurrReport.Preview then begin
                    "No. Printed" += 1;
                    Modify;
                    Commit;
                end;
            end;

            trigger OnPreDataItem()
            begin
                if DocumentType = DocumentType::"Return Receipt" then begin
                    SetFilter("No.", DocumentNo);
                end;
                if GetFilters = '' then begin
                    CurrReport.Break;
                end;
            end;
        }
        dataitem("Purchase Header"; "Purchase Header")
        {
            DataItemTableView = SORTING("Document Type", "No.") ORDER(Ascending);

            trigger OnAfterGetRecord()
            begin
                DocManagment.CopyFromPurchHeader("Purchase Header", TmpDocumentHeader, TmpDocumentLine, ReportNumber);
                if not CurrReport.Preview then begin
                    "No. Printed" += 1;
                    Modify;
                    Commit;
                end;
            end;

            trigger OnPreDataItem()
            begin
                if DocumentType = DocumentType::"Purchase Order" then begin
                    SetRange("Document Type", "Document Type"::Order);
                    SetFilter("No.", DocumentNo);
                end;
                if GetFilters = '' then begin
                    CurrReport.Break;
                end;
            end;
        }
        dataitem("Purch. Inv. Header"; "Purch. Inv. Header")
        {
            DataItemTableView = SORTING("No.") ORDER(Ascending);

            trigger OnAfterGetRecord()
            begin
                DocManagment.CopyFromPurchInvoice("Purch. Inv. Header", TmpDocumentHeader, TmpDocumentLine, ReportNumber);
                if not CurrReport.Preview then begin
                    "No. Printed" += 1;
                    Modify;
                    Commit;
                end;
            end;

            trigger OnPreDataItem()
            begin
                if DocumentType = DocumentType::"Purchase Invoice" then begin
                    SetFilter("No.", DocumentNo);
                end;
                if GetFilters = '' then begin
                    CurrReport.Break;
                end;
            end;
        }
        dataitem("Purch. Rcpt. Header"; "Purch. Rcpt. Header")
        {
            DataItemTableView = SORTING("No.") ORDER(Ascending);

            trigger OnAfterGetRecord()
            begin
                DocManagment.CopyFromPurchReceipt("Purch. Rcpt. Header", TmpDocumentHeader, TmpDocumentLine, ReportNumber);
                if not CurrReport.Preview then begin
                    "No. Printed" += 1;
                    Modify;
                    Commit;
                end;
            end;

            trigger OnPreDataItem()
            begin
                if DocumentType = DocumentType::"Purchase Receipt" then begin
                    SetFilter("No.", DocumentNo);
                end;
                if GetFilters = '' then begin
                    CurrReport.Break;
                end;
            end;
        }
        dataitem("Purch. Cr. Memo Hdr."; "Purch. Cr. Memo Hdr.")
        {
            DataItemTableView = SORTING("No.") ORDER(Ascending);

            trigger OnAfterGetRecord()
            begin
                DocManagment.CopyFromPurchCreditMemo("Purch. Cr. Memo Hdr.", TmpDocumentHeader, TmpDocumentLine, ReportNumber);
                if not CurrReport.Preview then begin
                    "No. Printed" += 1;
                    Modify;
                    Commit;
                end;
            end;

            trigger OnPreDataItem()
            begin
                if DocumentType = DocumentType::"Purchase Credit Memo" then begin
                    SetFilter("No.", DocumentNo);
                end;
                if GetFilters = '' then begin
                    CurrReport.Break;
                end;
            end;
        }
        dataitem("Return Shipment Header"; "Return Shipment Header")
        {
            DataItemTableView = SORTING("No.") ORDER(Ascending);

            trigger OnAfterGetRecord()
            begin
                DocManagment.CopyFromPurchReturnShipment("Return Shipment Header", TmpDocumentHeader, TmpDocumentLine, ReportNumber);
                if not CurrReport.Preview then begin
                    "No. Printed" += 1;
                    Modify;
                    Commit;
                end;
            end;

            trigger OnPreDataItem()
            begin
                if DocumentType = DocumentType::"Return Shipment" then begin
                    SetFilter("No.", DocumentNo);
                end;
                if GetFilters = '' then begin
                    CurrReport.Break;
                end;
            end;
        }
        dataitem("Service Header"; "Service Header")
        {
            DataItemTableView = SORTING("Document Type", "No.") ORDER(Ascending);

            trigger OnAfterGetRecord()
            begin
                DocManagment.CopyFromServiceHeader("Service Header", TmpDocumentHeader, TmpDocumentLine, ReportNumber);
                if not CurrReport.Preview then begin
                    "No. Printed" += 1;
                    Modify;
                    Commit;
                end;
            end;

            trigger OnPreDataItem()
            begin
                if DocumentType = DocumentType::"Service Order" then begin
                    SetRange("Document Type", "Document Type"::Order);
                    SetFilter("No.", DocumentNo);
                end;
                if GetFilters = '' then begin
                    CurrReport.Break;
                end;
            end;
        }
        /* dataitem("Service Invoice Header"; "Service Invoice Header")
        {
            DataItemTableView = SORTING("No.") ORDER(Ascending);

            trigger OnAfterGetRecord()
            begin
                 DocManagment.CopyFromServiceInvoice("Service Invoice Header", TmpDocumentHeader, TmpDocumentLine, ReportNumber);
                if not CurrReport.Preview then begin
                    "No. Printed" += 1;
                    Modify;
                    Commit;
                end; 
            end;

            trigger OnPreDataItem()
            begin
                if DocumentType = DocumentType::"Service Invoice" then begin
                    SetFilter("No.", DocumentNo);
                end;
                if GetFilters = '' then begin
                    CurrReport.Break;
                end;
            end;
        } */
        /* dataitem("Service Shipment Header"; "Service Shipment Header")
        {
            DataItemTableView = SORTING("No.") ORDER(Ascending);

            trigger OnAfterGetRecord()
            begin
                DocManagment.CopyFromServiceShipment("Service Shipment Header", TmpDocumentHeader, TmpDocumentLine, ReportNumber);
                if not CurrReport.Preview then begin
                    "No. Printed" += 1;
                    Modify;
                    Commit;
                end;
            end;

            trigger OnPreDataItem()
            begin
                if DocumentType = DocumentType::"Service Shipment" then begin
                    SetFilter("No.", DocumentNo);
                end;
                if GetFilters = '' then begin
                    CurrReport.Break;
                end;
            end;
        } */
        /* dataitem("Service Cr.Memo Header"; "Service Cr.Memo Header")
        {
            DataItemTableView = SORTING("No.") ORDER(Ascending);

            trigger OnAfterGetRecord()
            begin
                DocManagment.CopyFromServiceCreditMemo("Service Cr.Memo Header", TmpDocumentHeader, TmpDocumentLine, ReportNumber);
                if not CurrReport.Preview then begin
                    "No. Printed" += 1;
                    Modify;
                    Commit;
                end;
            end;

            trigger OnPreDataItem()
            begin
                if DocumentType = DocumentType::"Service Credit Memo" then begin
                    SetFilter("No.", DocumentNo);
                end;
                if GetFilters = '' then begin
                    CurrReport.Break;
                end;
            end;
        } */
        dataitem("Transfer Header"; "Transfer Header")
        {
            DataItemTableView = SORTING("No.") ORDER(Ascending);

            trigger OnAfterGetRecord()
            begin
                DocManagment.CopyFromTransferOrder("Transfer Header", TmpDocumentHeader, TmpDocumentLine, ReportNumber);
            end;

            trigger OnPreDataItem()
            begin
                if DocumentType = DocumentType::"Transfer Order" then begin
                    SetFilter("No.", DocumentNo);
                end;
                if GetFilters = '' then begin
                    CurrReport.Break;
                end;
            end;
        }
        dataitem("Transfer Shipment Header"; "Transfer Shipment Header")
        {
            DataItemTableView = SORTING("No.") ORDER(Ascending);

            trigger OnAfterGetRecord()
            begin
                DocManagment.CopyFromTransferShipment("Transfer Shipment Header", TmpDocumentHeader, TmpDocumentLine, ReportNumber);
            end;

            trigger OnPreDataItem()
            begin
                if DocumentType = DocumentType::"Transfer Shipment" then begin
                    SetFilter("No.", DocumentNo);
                end;
                if GetFilters = '' then begin
                    CurrReport.Break;
                end;
            end;
        }
        dataitem("Transfer Receipt Header"; "Transfer Receipt Header")
        {
            DataItemTableView = SORTING("No.") ORDER(Ascending);

            trigger OnAfterGetRecord()
            begin
                DocManagment.CopyFromTransferReceipt("Transfer Receipt Header", TmpDocumentHeader, TmpDocumentLine, ReportNumber);
            end;

            trigger OnPreDataItem()
            begin
                if DocumentType = DocumentType::"Transfer Receipt" then begin
                    SetFilter("No.", DocumentNo);
                end;
                if GetFilters = '' then begin
                    CurrReport.Break;
                end;
            end;
        }

        dataitem(HeaderLoop; "Integer")
        {
            DataItemTableView = SORTING(Number) ORDER(Ascending);
            column(IsTransfer; IsTransfer)
            {
            }
            dataitem(CopyLoop; "Integer")
            {
                DataItemTableView = SORTING(Number) ORDER(Ascending);
                dataitem(DocumentLoop; "Integer")
                {
                    DataItemTableView = SORTING(Number) ORDER(Ascending) WHERE(Number = CONST(1));
                    column(TmpDocumentHeader__Document_No__; TmpDocumentHeader."Document No.")
                    {
                    }
                    column(TmpDocumentHeader__No__Series_Description_; TmpDocumentHeader."No. Series Description")
                    {
                    }
                    column(TmpDocumentHeader__No__; TmpDocumentHeader."No.")
                    {
                    }
                    column(TmpDocumentHeader_Name; TmpDocumentHeader.Name)
                    {
                    }
                    column(TmpDocumentHeader__Tax_Office_; TmpDocumentHeader."Tax Office")
                    {
                    }
                    column(TmpDocumentHeader_Address; TmpDocumentHeader.Address)
                    {
                    }
                    column(TmpDocumentHeader_City______TmpDocumentHeader__Post_Code_; TmpDocumentHeader.City + ',' + TmpDocumentHeader."Post Code")
                    {
                    }
                    column(TmpDocumentHeader__Vat_Registration_No__; TmpDocumentHeader."Vat Registration No.")
                    {
                    }
                    column(TmpDocumentHeader__Posting_Date_; TmpDocumentHeader."Posting Date")
                    {
                    }
                    column(TmpDocumentHeader__Posting_Time_; TmpDocumentHeader."Posting Time")
                    {
                    }
                    column(TmpDocumentHeader_Profession; TmpDocumentHeader.Profession)
                    {
                    }
                    column(CompanyAddress_1_; CompanyAddress[1])
                    {
                    }
                    column(CompanyAddress_2_; CompanyAddress[2])
                    {
                    }
                    column(CompanyAddress_3_; CompanyAddress[3])
                    {
                    }
                    column(CompanyAddress_4_; CompanyAddress[4])
                    {
                    }
                    column(CompanyAddress_5_; CompanyAddress[5])
                    {
                    }
                    column(CompanyInfo_Picture; CompanyInfo.Picture)
                    {
                    }
                    column(CompanyAddress_6_; CompanyAddress[6])
                    {
                    }
                    column(TmpDocumentHeader__Location_Address_; TmpDocumentHeader."Location Address")
                    {
                    }
                    column(TmpDocumentHeader__Ship_To_Address_; TmpDocumentHeader."Ship-To Address")
                    {
                    }
                    column(TmpDocumentHeader__Ship_To_City_______TmpDocumentHeader__Ship_To_Post_Code_; TmpDocumentHeader."Ship-To City" + ',' + TmpDocumentHeader."Ship-To Post Code")
                    {
                    }
                    column(TmpDocumentHeader__Ship_To_Name_; TmpDocumentHeader."Ship-To Name")
                    {
                    }
                    column(TmpDocumentHeader__Transfer_Reason_; TmpDocumentHeader."Transfer Reason")
                    {
                    }
                    column(TmpDocumentHeader__Payment_Method_; TmpDocumentHeader."Payment Method")
                    {
                    }
                    column(NumberOfPages; Format(NumberOfPages))
                    {
                    }
                    column(CompanyAddress_10_; CompanyAddress[10])
                    {
                    }
                    column(CompanyAddress_9_; CompanyAddress[9])
                    {
                    }
                    column(CompanyAddress_8_; CompanyAddress[8])
                    {
                    }
                    column(CompanyAddress_7_; CompanyAddress[7])
                    {
                        Description = 'RCGP5620-0 Added';
                    }
                    column(TmpDocumentHeader__Document_No___Control1103201061; TmpDocumentHeader."Document No.")
                    {
                    }
                    column(TmpDocumentHeader__No__Series_Description__Control1103201072; TmpDocumentHeader."No. Series Description")
                    {
                    }
                    column(TmpDocumentHeader__Posting_Date__Control1103201134; TmpDocumentHeader."Posting Date")
                    {
                    }
                    column(TmpDocumentHeader__Posting_Time__Control1103201138; TmpDocumentHeader."Posting Time")
                    {
                    }
                    column(CompanyAddress_1__Control1103201148; CompanyAddress[1])
                    {
                    }
                    column(CompanyAddress_2__Control1103201155; CompanyAddress[2])
                    {
                    }
                    column(CompanyAddress_3__Control1103201156; CompanyAddress[3])
                    {
                    }
                    column(CompanyAddress_4__Control1103201157; CompanyAddress[4])
                    {
                    }
                    column(CompanyAddress_5__Control1103201158; CompanyAddress[5])
                    {
                    }
                    column(CompanyInfo_Picture_Control1103201210; CompanyInfo.Picture)
                    {
                    }
                    column(CompanyAddress_6__Control1103201211; CompanyAddress[6])
                    {
                    }
                    column(PageNo___FORMAT_NumberOfCurrentPage__________FORMAT_NumberOfPages__Control1103201243; PageNo + Format(NumberOfCurrentPage) + '/' + Format(NumberOfPages))
                    {
                    }
                    column(CompanyAddress_10__Control1103201245; CompanyAddress[10])
                    {
                    }
                    column(CompanyAddress_9__Control1103201248; CompanyAddress[9])
                    {
                    }
                    column(CompanyAddress_8__Control1103201249; CompanyAddress[8])
                    {
                    }
                    column(CompanyAddress_7__Control1103201250; CompanyAddress[7])
                    {
                        Description = 'RCGP5620-0 Added';
                    }
                    column(TmpDocumentHeader_Name_Control1103201267; TmpDocumentHeader.Name)
                    {
                    }
                    column(TmpDocumentHeader_Address_Control1103201276; TmpDocumentHeader.Address)
                    {
                    }
                    column(TmpDocumentHeader_City_________TmpDocumentHeader__Post_Code_; TmpDocumentHeader.City + ',' + TmpDocumentHeader."Post Code")
                    {
                    }
                    column(TmpDocumentHeader_Profession_Control1103201286; TmpDocumentHeader.Profession)
                    {
                    }
                    column(TmpDocumentHeader__Vat_Registration_No___Control1103201298; TmpDocumentHeader."Vat Registration No.")
                    {
                    }
                    column(TmpDocumentHeader__Ship_To_Tax_Office_; TmpDocumentHeader."Ship-To Tax Office")
                    {
                    }
                    column(TmpDocumentHeader__Tax_Office__Control1103201305; TmpDocumentHeader."Tax Office")
                    {
                    }
                    column(TmpDocumentHeader__Ship_To_Vat_Registration_No__; TmpDocumentHeader."Ship-To Vat Registration No.")
                    {
                    }
                    column(TmpDocumentHeader__Ship_To_Profession_; TmpDocumentHeader."Ship-To Profession")
                    {
                    }
                    column(TmpDocumentHeader__Ship_To_City__________TmpDocumentHeader__Ship_To_Post_Code_; TmpDocumentHeader."Ship-To City" + ',' + TmpDocumentHeader."Ship-To Post Code")
                    {
                    }
                    column(TmpDocumentHeader__Ship_To_Address__Control1103201313; TmpDocumentHeader."Ship-To Address")
                    {
                    }
                    column(TmpDocumentHeader__Ship_To_Name__Control1103201315; TmpDocumentHeader."Ship-To Name")
                    {
                    }
                    column(TmpDocumentHeader__Ship_To_Code_; TmpDocumentHeader."Ship-To Code")
                    {
                    }
                    column(TmpDocumentHeader__No___Control1103201264; TmpDocumentHeader."No.")
                    {
                    }
                    column(TmpDocumentHeader__Location_Address__Control1103201190; TmpDocumentHeader."Location Address")
                    {
                    }
                    column(TmpDocumentHeader__Transfer_Reason__Control1103201193; TmpDocumentHeader."Transfer Reason")
                    {
                    }
                    column(TempFooterDocumentHeader__Signature_String_1_; TempFooterDocumentHeader."Signature String 1")
                    {
                    }
                    column(TempFooterDocumentHeader__Document_Amount_; TempFooterDocumentHeader."Document Amount")
                    {
                    }
                    column(TempFooterDocumentHeader__Document_Discount_Amount_; TempFooterDocumentHeader."Document Discount Amount")
                    {
                    }
                    column(TempFooterDocumentHeader__Document_Amount_After_Discount_; TempFooterDocumentHeader."Document Amount After Discount")
                    {
                    }
                    column(TempFooterDocumentHeader__Document_VAT_Amount_; TempFooterDocumentHeader."Document VAT Amount")
                    {
                    }
                    column(TempFooterDocumentHeader__Document_Charges_Amount_; TempFooterDocumentHeader."Document Charges Amount")
                    {
                    }
                    column(TempFooterDocumentHeader__Document_Charges_VAT_; TempFooterDocumentHeader."Document Charges VAT")
                    {
                    }
                    column(TempFooterDocumentHeader__Document_Amount_Inc__VAT_; TempFooterDocumentHeader."Document Amount Inc. VAT")
                    {
                    }
                    column(TempFooterDocumentHeader__VAT_Cat__1_; TempFooterDocumentHeader."VAT Cat. 1")
                    {
                    }
                    column(TempFooterDocumentHeader__VAT_Cat__1_net_Amount_; TempFooterDocumentHeader."VAT Cat. 1 net Amount")
                    {
                    }
                    column(TempFooterDocumentHeader__VAT_Cat__1__VAT_Amount_; TempFooterDocumentHeader."VAT Cat. 1  VAT Amount")
                    {
                    }
                    column(TempFooterDocumentHeader__VAT_Cat__2_; TempFooterDocumentHeader."VAT Cat. 2")
                    {
                    }
                    column(TempFooterDocumentHeader__VAT_Cat__2_net_Amount_; TempFooterDocumentHeader."VAT Cat. 2 net Amount")
                    {
                    }
                    column(TempFooterDocumentHeader__VAT_Cat__2__VAT_Amount_; TempFooterDocumentHeader."VAT Cat. 2  VAT Amount")
                    {
                    }
                    column(TempFooterDocumentHeader__VAT_Cat__3_; TempFooterDocumentHeader."VAT Cat. 3")
                    {
                    }
                    column(TempFooterDocumentHeader__VAT_Cat__3_net_Amount_; TempFooterDocumentHeader."VAT Cat. 3 net Amount")
                    {
                    }
                    column(TempFooterDocumentHeader__VAT_Cat__3__VAT_Amount_; TempFooterDocumentHeader."VAT Cat. 3  VAT Amount")
                    {
                    }
                    column(TempFooterDocumentHeader__VAT_Cat__4_; TempFooterDocumentHeader."VAT Cat. 4")
                    {
                    }
                    column(TempFooterDocumentHeader__VAT_Cat__4_net_Amount_; TempFooterDocumentHeader."VAT Cat. 4 net Amount")
                    {
                    }
                    column(TempFooterDocumentHeader__VAT_Cat__4__VAT_Amount_; TempFooterDocumentHeader."VAT Cat. 4  VAT Amount")
                    {
                    }
                    column(TempFooterDocumentHeader__VAT_Cat__5_; TempFooterDocumentHeader."VAT Cat. 5")
                    {
                    }
                    column(TempFooterDocumentHeader__VAT_Cat__5_net_Amount_; TempFooterDocumentHeader."VAT Cat. 5 net Amount")
                    {
                    }
                    column(TempFooterDocumentHeader__VAT_Cat__5__VAT_Amount_; TempFooterDocumentHeader."VAT Cat. 5  VAT Amount")
                    {
                    }
                    column(TempFooterDocumentHeader_Invoice_Discount_Amount_; TempFooterDocumentHeader."Invoice Discount Amount")
                    {
                    }
                    column(TempFooterDocumentHeader__Signature_String_2_; TempFooterDocumentHeader."Signature String 2")
                    {
                    }
                    column(StdComment1; StdComment1)
                    {
                    }
                    column(StdComment2; StdComment2)
                    {
                    }
                    column(StdComment3; StdComment3)
                    {
                    }
                    column(StdComment4; StdComment4)
                    {
                    }
                    column(StdComment5; StdComment5)
                    {
                    }
                    column(StdComment6; StdComment6)
                    {
                    }
                    column(PreparedByText; PreparedByText)
                    {
                    }
                    column(PreparedByCaptionText; PreparedByCaptionText)
                    {
                    }
                    column(DirectorText; DirectorText)
                    {
                    }
                    column(DirectorCaptionText; DirectorCaptionText)
                    {
                    }
                    column(CopyDescription; CopyDescription)
                    {
                    }
                    column(TempFooterDocumentHeader__Old_Balance_; TempFooterDocumentHeader."Old Balance")
                    {
                    }
                    column(TempFooterDocumentHeader__New_Balance_; TempFooterDocumentHeader."New Balance")
                    {
                    }
                    column(TempFooterDocumentHeader__Comments_01_; TempFooterDocumentHeader."Comments 01")
                    {
                    }
                    column(TempFooterDocumentHeader__Comments_02_; TempFooterDocumentHeader."Comments 02")
                    {
                    }
                    column(TempFooterDocumentHeader__Comments_03_; TempFooterDocumentHeader."Comments 03")
                    {
                    }
                    column(TempFooterDocumentHeader__Comments_04_; TempFooterDocumentHeader."Comments 04")
                    {
                    }
                    column(TempFooterDocumentHeader__Comments_05_; TempFooterDocumentHeader."Comments 05")
                    {
                    }
                    column(TempFooterDocumentHeader__Document_Tax_VAT_Amount_; TempFooterDocumentHeader."Document Tax VAT Amount")
                    {
                    }
                    column(TempFooterDocumentHeader__Document_Tax_Amount_; TempFooterDocumentHeader."Document Tax Amount")
                    {
                    }
                    column(InvDiscountAmount; TempFooterDocumentHeader."Invoice Discount Amount")
                    {
                    }
                    column(CompanyInfo__Bank_Name____________CompanyInfo__Bank_Account_No__; CompanyInfo."Bank Name" + '   ' + CompanyInfo."Bank Account No.")
                    {
                    }
                    column(CompanyInfo__Bank_Name_2____________CompanyInfo__Bank_Account_No__2_; CompanyInfo."Bank Name 2 RCGRBASE" + '   ' + CompanyInfo."Bank Account No. 2 RCGRBASE")
                    {
                    }
                    column(CompanyInfo__Bank_Name_3____________CompanyInfo__Bank_Account_No__3_; CompanyInfo."Bank Name 3 RCGRBASE" + '   ' + CompanyInfo."Bank Account No. 3 RCGRBASE")
                    {
                    }
                    column(TempFooterDocumentHeader__Tax_Printer_Text_1____TempFooterDocumentHeader__Tax_Printer_Text_2_; TempFooterDocumentHeader."Tax Printer Text 1" + TempFooterDocumentHeader."Tax Printer Text 2")
                    {
                    }
                    column(CodeCaption; CodeCaptionLbl)
                    {
                    }
                    column(VAT__Caption; VAT__CaptionLbl)
                    {
                    }
                    column(Amount_After_DiscountCaption; Amount_After_DiscountCaptionLbl)
                    {
                    }
                    column(Discount_AmountCaption; Discount_AmountCaptionLbl)
                    {
                    }
                    column(Discount__Caption; Discount__CaptionLbl)
                    {
                    }
                    column(AmountCaption; AmountCaptionLbl)
                    {
                    }
                    column(Unit_PriceCaption; Unit_PriceCaptionLbl)
                    {
                    }
                    column(QuantityCaption; QuantityCaptionLbl)
                    {
                    }
                    column(UOMCaption; UOMCaptionLbl)
                    {
                    }
                    column(DescriptionCaption; DescriptionCaptionLbl)
                    {
                    }
                    column(TmpDocumentHeader__No__Series_Description_Caption; TmpDocumentHeader__No__Series_Description_CaptionLbl)
                    {
                    }
                    column(TmpDocumentHeader__Document_No__Caption; TmpDocumentHeader__Document_No__CaptionLbl)
                    {
                    }
                    column(TmpDocumentHeader__Posting_Date_Caption; TmpDocumentHeader__Posting_Date_CaptionLbl)
                    {
                    }
                    column(TmpDocumentHeader__Posting_Time_Caption; TmpDocumentHeader__Posting_Time_CaptionLbl)
                    {
                    }
                    column(TmpDocumentHeader__No__Caption; TmpDocumentHeader__No__CaptionLbl)
                    {
                    }
                    column(TmpDocumentHeader_NameCaption; TmpDocumentHeader_NameCaptionLbl)
                    {
                    }
                    column(TmpDocumentHeader_ProfessionCaption; TmpDocumentHeader_ProfessionCaptionLbl)
                    {
                    }
                    column(Caption; CaptionLbl)
                    {
                    }
                    column(Caption_Control1103201144; Caption_Control1103201144Lbl)
                    {
                    }
                    column(Caption_Control1103201145; Caption_Control1103201145Lbl)
                    {
                    }
                    column(Caption_Control1103201162; Caption_Control1103201162Lbl)
                    {
                    }
                    column(TmpDocumentHeader__Vat_Registration_No__Caption; TmpDocumentHeader__Vat_Registration_No__CaptionLbl)
                    {
                    }
                    column(Caption_Control1103201167; Caption_Control1103201167Lbl)
                    {
                    }
                    column(TmpDocumentHeader_AddressCaption; TmpDocumentHeader_AddressCaptionLbl)
                    {
                    }
                    column(Caption_Control1103201170; Caption_Control1103201170Lbl)
                    {
                    }
                    column(TmpDocumentHeader__Tax_Office_Caption; TmpDocumentHeader__Tax_Office_CaptionLbl)
                    {
                    }
                    column(Caption_Control1103201109; Caption_Control1103201109Lbl)
                    {
                    }
                    column(Caption_Control1103201112; Caption_Control1103201112Lbl)
                    {
                    }
                    column(TmpDocumentHeader__Location_Address_Caption; TmpDocumentHeader__Location_Address_CaptionLbl)
                    {
                    }
                    column(TmpDocumentHeader__Ship_To_Address_Caption; TmpDocumentHeader__Ship_To_Address_CaptionLbl)
                    {
                    }
                    column(Caption_Control1103201038; Caption_Control1103201038Lbl)
                    {
                    }
                    column(TmpDocumentHeader__Ship_To_Name_Caption; TmpDocumentHeader__Ship_To_Name_CaptionLbl)
                    {
                    }
                    column(Caption_Control1103201044; Caption_Control1103201044Lbl)
                    {
                    }
                    column(TmpDocumentHeader__Transfer_Reason_Caption; TmpDocumentHeader__Transfer_Reason_CaptionLbl)
                    {
                    }
                    column(Caption_Control1103201055; Caption_Control1103201055Lbl)
                    {
                    }
                    column(TmpDocumentHeader__Payment_Method_Caption; TmpDocumentHeader__Payment_Method_CaptionLbl)
                    {
                    }
                    column(CodeCaption_Control1103201174; CodeCaption_Control1103201174Lbl)
                    {
                    }
                    column(VAT__Caption_Control1103201175; VAT__Caption_Control1103201175Lbl)
                    {
                    }
                    column(Amount_After_DiscountCaption_Control1103201176; Amount_After_DiscountCaption_Control1103201176Lbl)
                    {
                    }
                    column(Discount_AmountCaption_Control1103201177; Discount_AmountCaption_Control1103201177Lbl)
                    {
                    }
                    column(Discount__Caption_Control1103201178; Discount__Caption_Control1103201178Lbl)
                    {
                    }
                    column(AmountCaption_Control1103201179; AmountCaption_Control1103201179Lbl)
                    {
                    }
                    column(Unit_PriceCaption_Control1103201180; Unit_PriceCaption_Control1103201180Lbl)
                    {
                    }
                    column(QuantityCaption_Control1103201181; QuantityCaption_Control1103201181Lbl)
                    {
                    }
                    column(UOMCaption_Control1103201182; UOMCaption_Control1103201182Lbl)
                    {
                    }
                    column(DescriptionCaption_Control1103201183; DescriptionCaption_Control1103201183Lbl)
                    {
                    }
                    column(TmpDocumentHeader__No__Series_Description__Control1103201072Caption; TmpDocumentHeader__No__Series_Description__Control1103201072CaptionLbl)
                    {
                    }
                    column(TmpDocumentHeader__Document_No___Control1103201061Caption; TmpDocumentHeader__Document_No___Control1103201061CaptionLbl)
                    {
                    }
                    column(TmpDocumentHeader__Posting_Date__Control1103201134Caption; TmpDocumentHeader__Posting_Date__Control1103201134CaptionLbl)
                    {
                    }
                    column(TmpDocumentHeader__Posting_Time__Control1103201138Caption; TmpDocumentHeader__Posting_Time__Control1103201138CaptionLbl)
                    {
                    }
                    column(Ship_FromCaption; Ship_FromCaptionLbl)
                    {
                    }
                    column(Receive_ToCaption; Receive_ToCaptionLbl)
                    {
                    }
                    column(Caption_Control1103201274; Caption_Control1103201274Lbl)
                    {
                    }
                    column(DescriptionCaption_Control1103201275; DescriptionCaption_Control1103201275Lbl)
                    {
                    }
                    column(Caption_Control1103201278; Caption_Control1103201278Lbl)
                    {
                    }
                    column(TmpDocumentHeader_Address_Control1103201276Caption; TmpDocumentHeader_Address_Control1103201276CaptionLbl)
                    {
                    }
                    column(TmpDocumentHeader_Profession_Control1103201286Caption; TmpDocumentHeader_Profession_Control1103201286CaptionLbl)
                    {
                    }
                    column(Caption_Control1103201291; Caption_Control1103201291Lbl)
                    {
                    }
                    column(TmpDocumentHeader__Ship_To_Profession_Caption; TmpDocumentHeader__Ship_To_Profession_CaptionLbl)
                    {
                    }
                    column(Business_Partner_DetailsCaption; Business_Partner_DetailsCaptionLbl)
                    {
                    }
                    column(TmpDocumentHeader__Ship_To_Address__Control1103201313Caption; TmpDocumentHeader__Ship_To_Address__Control1103201313CaptionLbl)
                    {
                    }
                    column(TmpDocumentHeader__Ship_To_Name__Control1103201315Caption; TmpDocumentHeader__Ship_To_Name__Control1103201315CaptionLbl)
                    {
                    }
                    column(TmpDocumentHeader__Ship_To_Code_Caption; TmpDocumentHeader__Ship_To_Code_CaptionLbl)
                    {
                    }
                    column(TmpDocumentHeader__Ship_To_Vat_Registration_No__Caption; TmpDocumentHeader__Ship_To_Vat_Registration_No__CaptionLbl)
                    {
                    }
                    column(Caption_Control1103201300; Caption_Control1103201300Lbl)
                    {
                    }
                    column(TmpDocumentHeader__Vat_Registration_No___Control1103201298Caption; TmpDocumentHeader__Vat_Registration_No___Control1103201298CaptionLbl)
                    {
                    }
                    column(Caption_Control1103201303; Caption_Control1103201303Lbl)
                    {
                    }
                    column(TmpDocumentHeader__Ship_To_Tax_Office_Caption; TmpDocumentHeader__Ship_To_Tax_Office_CaptionLbl)
                    {
                    }
                    column(Caption_Control1103201307; Caption_Control1103201307Lbl)
                    {
                    }
                    column(Caption_Control1103201308; Caption_Control1103201308Lbl)
                    {
                    }
                    column(TmpDocumentHeader__Tax_Office__Control1103201305Caption; TmpDocumentHeader__Tax_Office__Control1103201305CaptionLbl)
                    {
                    }
                    column(Caption_Control1103201311; Caption_Control1103201311Lbl)
                    {
                    }
                    column(Caption_Control1103201314; Caption_Control1103201314Lbl)
                    {
                    }
                    column(Caption_Control1103201316; Caption_Control1103201316Lbl)
                    {
                    }
                    column(Caption_Control1103201318; Caption_Control1103201318Lbl)
                    {
                    }
                    column(TmpDocumentHeader__No___Control1103201264Caption; TmpDocumentHeader__No___Control1103201264CaptionLbl)
                    {
                    }
                    column(Caption_Control1103201266; Caption_Control1103201266Lbl)
                    {
                    }
                    column(Business_Partner_DetailsCaption_Control1103201142; Business_Partner_DetailsCaption_Control1103201142Lbl)
                    {
                    }
                    column(Caption_Control1103201191; Caption_Control1103201191Lbl)
                    {
                    }
                    column(TmpDocumentHeader__Location_Address__Control1103201190Caption; TmpDocumentHeader__Location_Address__Control1103201190CaptionLbl)
                    {
                    }
                    column(Caption_Control1103201194; Caption_Control1103201194Lbl)
                    {
                    }
                    column(TmpDocumentHeader__Transfer_Reason__Control1103201193Caption; TmpDocumentHeader__Transfer_Reason__Control1103201193CaptionLbl)
                    {
                    }
                    column(ISSUEDCaption; ISSUEDCaptionLbl)
                    {
                    }
                    column(RECEIPTCaption; RECEIPTCaptionLbl)
                    {
                    }
                    column(TempFooterDocumentHeader__Old_Balance_Caption; TempFooterDocumentHeader__Old_Balance_CaptionLbl)
                    {
                    }
                    column(TempFooterDocumentHeader__New_Balance_Caption; TempFooterDocumentHeader__New_Balance_CaptionLbl)
                    {
                    }
                    column(TempFooterDocumentHeader__VAT_Cat__1_Caption; TempFooterDocumentHeader__VAT_Cat__1_CaptionLbl)
                    {
                    }
                    column(TempFooterDocumentHeader__VAT_Cat__1_net_Amount_Caption; TempFooterDocumentHeader__VAT_Cat__1_net_Amount_CaptionLbl)
                    {
                    }
                    column(TempFooterDocumentHeader__VAT_Cat__1__VAT_Amount_Caption; TempFooterDocumentHeader__VAT_Cat__1__VAT_Amount_CaptionLbl)
                    {
                    }
                    column(TempFooterDocumentHeader__Document_Amount_Caption; TempFooterDocumentHeader__Document_Amount_CaptionLbl)
                    {
                    }
                    column(TempFooterDocumentHeader__Document_Discount_Amount_Caption; TempFooterDocumentHeader__Document_Discount_Amount_CaptionLbl)
                    {
                    }
                    column(TempFooterDocumentHeader__Document_Amount_After_Discount_Caption; TempFooterDocumentHeader__Document_Amount_After_Discount_CaptionLbl)
                    {
                    }
                    column(TempFooterDocumentHeader__Document_VAT_Amount_Caption; TempFooterDocumentHeader__Document_VAT_Amount_CaptionLbl)
                    {
                    }
                    column(TempFooterDocumentHeader__Document_Charges_Amount_Caption; TempFooterDocumentHeader__Document_Charges_Amount_CaptionLbl)
                    {
                    }
                    column(TempFooterDocumentHeader__Document_Charges_VAT_Caption; TempFooterDocumentHeader__Document_Charges_VAT_CaptionLbl)
                    {
                    }
                    column(TempFooterDocumentHeader__Document_Amount_Inc__VAT_Caption; TempFooterDocumentHeader__Document_Amount_Inc__VAT_CaptionLbl)
                    {
                    }
                    column(TempFooterDocumentHeader_Invoice_Caption; TempFooterDocumentHeader_Invoicelbl)
                    {
                    }
                    column(TempFooterDocument_Line_Captionl; TempFooterDocument_Linelbl)
                    {
                    }
                    column(TempFooterDocument_SumLine_Caption; TempFooterDocument_SumLinelbl)
                    {
                    }
                    column(CommentsCaption; CommentsCaptionLbl)
                    {
                    }
                    column(TempFooterDocumentHeader__Document_Tax_VAT_Amount_Caption; TempFooterDocumentHeader__Document_Tax_VAT_Amount_CaptionLbl)
                    {
                    }
                    column(TempFooterDocumentHeader__Document_Tax_Amount_Caption; TempFooterDocumentHeader__Document_Tax_Amount_CaptionLbl)
                    {
                    }
                    column(InvDiscountAmountCaption; InvDiscountAmountCaptionLbl)
                    {
                    }
                    column(CompanyInfo__Bank_Name____________CompanyInfo__Bank_Account_No__Caption; CompanyInfo__Bank_Name____________CompanyInfo__Bank_Account_No__CaptionLbl)
                    {
                    }
                    column(DocumentLoop_Number; Number)
                    {
                    }
                    column(NumberOfCurrentPage; NumberOfCurrentPage - 1)
                    {
                    }
                    column(NumberOfCopies; NumberOfCopies)
                    {
                    }
                    column(DueDateTxt; DueDateTxt)
                    {
                    }
                    column(DueDateLbl; DueDateLbl)
                    {
                    }
                    column(PaymentTermsCaptionLbl; PaymentTermsCaptionLbl)
                    { }
                    column(PaymentTermsTxt; PaymentTermsTxt)
                    { }
                    dataitem(PagesLoop; "Integer")
                    {
                        DataItemTableView = SORTING(Number) ORDER(Ascending);
                        column(ShowEmptyLine; ShowEmptyLine)
                        {
                        }
                        column(DocLineType; LineType)
                        {
                        }
                        dataitem(LinesLoop; "Integer")
                        {
                            DataItemTableView = SORTING(Number) ORDER(Ascending);
                            column(LineType; Format(TmpDocumentLine.Type, 0, '<Number>'))
                            {
                            }
                            column(TmpDocumentLine__VAT___; TmpDocumentLine."VAT %")
                            {
                            }
                            column(TmpDocumentLine__Line_Amount_; TmpDocumentLine."Line Amount")
                            {
                            }
                            column(TmpDocumentLine__AmountAfterDiscount; TmpDocumentLine."Amount After Discount")
                            {
                            }
                            column(TmpDocumentLine__Line_Discount_Amount_; TmpDocumentLine."Line Discount Amount")
                            {
                            }
                            column(TmpDocumentLine__Line_Discount___; TmpDocumentLine."Line Discount %")
                            {
                            }
                            column(TmpDocumentLine_Amount; TmpDocumentLine.Amount)
                            {
                            }
                            column(TmpDocumentLine__Unit_Price_; TmpDocumentLine."Unit Price")
                            {
                            }
                            column(TmpDocumentLine_Quantity; TmpDocumentLine.Quantity)
                            {
                            }
                            column(TmpDocumentLine_Description; TmpDocumentLine.Description)
                            {
                            }
                            column(TmpDocumentLine__No__; TmpDocumentLine."No.")
                            {
                            }
                            column(TmpDocumentLine__Unit_Of_Measure_; TmpDocumentLine."Unit Of Measure")
                            {
                            }
                            column(TmpDocumentLine_Description_Control1103201092; TmpDocumentLine.Description)
                            {
                            }
                            column(Temp_Disc_Line_Amount; TmpDiscSum)
                            {
                            }
                            column(LinesLoop_Number; Number)
                            {
                            }

                            trigger OnAfterGetRecord()
                            begin
                                if GetFirstDocumentLine then begin
                                    TmpDocumentLine.SetRange(TmpDocumentLine."Document No.", TmpDocumentHeader."Document No.");
                                    TmpDocumentLine.FindSet;
                                    GetFirstDocumentLine := false;
                                end else begin
                                    if TotalNumberOfLinesDone < NumberOfLines then begin
                                        TmpDocumentLine.Next;
                                    end;
                                end;
                                NumberOfLinesDone += 1;
                                TotalNumberOfLinesDone += 1;
                                if TotalNumberOfLinesDone > NumberOfLines then begin
                                    ShowEmptyLine := true;
                                end;
                                if ShowEmptyLine then
                                    Clear(TmpDocumentLine);
                                LineType := 1;
                            end;

                            trigger OnPreDataItem()
                            begin
                                SetRange(Number, 1, MaxLinesPerPage);
                            end;
                        }
                        dataitem(BailmentsLoop; "Integer")
                        {
                            DataItemTableView = SORTING(Number) ORDER(Ascending);
                            column(Text001; Text001)
                            {
                                Description = 'RCGPR008884-03 Added';
                            }
                            column(BailmentLines__VAT___; BailmentLines."VAT %")
                            {
                                Description = 'RCGPR008884-03 Added';
                            }
                            column(BailmentLines__Amount_After_Discount_; BailmentLines."Amount After Discount")
                            {
                                Description = 'RCGPR008884-03 Added';
                            }
                            column(BailmentLines_Amount; BailmentLines.Amount)
                            {
                                Description = 'RCGPR008884-03 Added';
                            }
                            column(BailmentLines__Unit_Price_; BailmentLines."Unit Price")
                            {
                                Description = 'RCGPR008884-03 Added';
                            }
                            column(BailmentLines_Quantity; BailmentLines.Quantity)
                            {
                                Description = 'RCGPR008884-03 Added';
                            }
                            column(BailmentLines__Unit_Of_Measure_; BailmentLines."Unit Of Measure")
                            {
                                Description = 'RCGPR008884-03 Added';
                            }
                            column(BailmentLines_Description; BailmentLines.Description)
                            {
                                Description = 'RCGPR008884-03 Added';
                            }
                            column(BailmentLines__No__; BailmentLines."No.")
                            {
                                Description = 'RCGPR008884-03 Added';
                            }
                            column(BailmentsLoop_Number; Number)
                            {
                            }

                            trigger OnAfterGetRecord()
                            begin
                                if (NumberOfCurrentPage - 1) = NumberOfPages then begin
                                    NumberOfLinesDone += 1;
                                    NumberOfBailmentLinesDone += 1;
                                    if GetFirstBailmentLine then begin
                                        BailmentLines.FindSet;
                                        GetFirstBailmentLine := false;
                                    end else begin
                                        if NumberOfBailmentLinesDone > NumberOfBailments then begin
                                            Clear(BailmentLines);
                                        end else begin
                                            BailmentLines.Next;
                                        end;
                                    end;
                                end else
                                    CurrReport.Break;
                            end;

                            trigger OnPreDataItem()
                            begin
                                if (NumberOfCurrentPage - 1) = NumberOfPages then begin
                                    if MaxBailmentLinesPerPage = 0 then begin
                                        CurrReport.Break;
                                    end;
                                    SetRange(Number, 1, MaxBailmentLinesPerPage);
                                    NumberOfLinesDone := 0;
                                    NumberOfBailments := BailmentLines.Count;
                                    if NumberOfBailments = 0 then
                                        CurrReport.Break;
                                    ShowEmptyLine := false;
                                    LineType := 2;
                                end else
                                    CurrReport.Break;
                            end;
                        }
                        dataitem(VatClauseLines; "VAT Clause")
                        {
                            column(Code_VATClauseLine; VatClauseLines.Code)
                            {

                            }
                            column(Description_VATClauseLine; VatClauseLines.Description)
                            {

                            }
                            trigger OnPreDataItem()
                            begin
                                if VatClauseCode <> '' then
                                    SetFilter(Code, VatClauseCode)
                                else
                                    CurrReport.Break();

                            end;

                            trigger OnAfterGetRecord()
                            begin
                            end;
                        }


                        trigger OnAfterGetRecord()
                        begin
                            NumberOfCurrentPage += 1;
                            NumberOfLinesDone := 0;

                            if NumberOfCurrentPage > NumberOfPages then begin
                                TempFooterDocumentHeader.Reset;
                                TempFooterDocumentHeader.DeleteAll;
                                TempFooterDocumentHeader.Init;
                                TempFooterDocumentHeader := TmpDocumentHeader;
                                TempFooterDocumentHeader.Insert;
                                TempFooterDocumentHeader.FindSet;
                            end;
                        end;

                        trigger OnPreDataItem()
                        begin
                            SetRange(Number, 1, NumberOfPages);
                        end;
                    }
                }

                trigger OnAfterGetRecord()
                begin
                    GetFirstDocumentLine := not TmpDocumentLine.IsEmpty;
                    GetFirstBailmentLine := not BailmentLines.IsEmpty;
                    ShowEmptyLine := false;
                    NumberOfCopies += 1;
                    NumberOfCurrentPage := 1;
                    NumberOfLinesDone := 0;
                    TotalNumberOfLinesDone := 0;
                    NumberOfBailmentLinesDone := 0;
                    if TmpDocumentHeader."Number Of Copies" <> 0 then begin
                        case Number of
                            1:
                                CopyDescription := TmpDocumentHeader."Document Copy 1 Descr.";
                            2:
                                CopyDescription := TmpDocumentHeader."Document Copy 2 Descr.";
                            3:
                                CopyDescription := TmpDocumentHeader."Document Copy 3 Descr.";
                            4:
                                CopyDescription := TmpDocumentHeader."Document Copy 4 Descr.";
                            5:
                                CopyDescription := TmpDocumentHeader."Document Copy 5 Descr.";
                        end;
                    end;
                end;

                trigger OnPreDataItem()
                begin
                    if TmpDocumentHeader."Number Of Copies" <> 0 then begin
                        SetRange(Number, 1, TmpDocumentHeader."Number Of Copies")
                    end else begin
                        SetRange(Number, 1, 1);
                    end;
                    NumberOfCopies := 0;
                end;
            }

            trigger OnAfterGetRecord()
            begin
                GetRerportingSetupTexts;
                GetVatClauses();
                IsTransfer := ((TmpDocumentHeader."Document Type" in [TmpDocumentHeader."Document Type"::"Transfer Order",
                TmpDocumentHeader."Document Type"::"Transfer Shipment", TmpDocumentHeader."Document Type"::"Transfer Receipt"]));

                if Number = 1 then begin
                    TmpDocumentHeader.FindSet;
                end else begin
                    TmpDocumentHeader.Next;
                end;
                if TmpDocumentHeader."Language ID" <> 0 then begin
                    CurrReport.Language := TmpDocumentHeader."Language ID";
                end;
                GetCompanyInformation();
                GetPaymentTermsAndDueDate();

                TmpDocumentLine.SetRange("Document No.", TmpDocumentHeader."Document No.");
                if (DocumentType = DocumentType::"Sales Invoice") or (DocumentType = DocumentType::" ") then begin
                    if TmpDocumentLine.FindSet then begin
                        repeat
                            TmpDocumentLine."Amount After Discount" := TmpDocumentLine.Amount - TmpDocumentLine."Line Discount Amount";
                            TmpDiscSum += TmpDocumentLine."Line Discount Amount";
                            TmpDocumentLine.Modify;
                        until TmpDocumentLine.Next = 0;
                    end;
                end;
                BailmentLines.SetRange("Document No.", TmpDocumentHeader."Document No.");
                MaxLinesPerPage := TmpDocumentHeader."Maximum Line Per Page";
                MaxBailmentLinesPerPage := TmpDocumentHeader."Maximum Bailments Per Page";
                HasBailment := not BailmentLines.IsEmpty;
                NumberOfLines := TmpDocumentLine.Count;
                NumberOfLoops := (NumberOfLines div MaxLinesPerPage) * MaxLinesPerPage + (NumberOfLines mod MaxLinesPerPage);
                if (NumberOfLines mod MaxLinesPerPage) <> 0 then begin
                    NumberOfLoops += (MaxLinesPerPage - NumberOfLines mod MaxLinesPerPage);
                end;
                NumberOfPages := NumberOfLoops div MaxLinesPerPage;
                if HasBailment then begin
                    if MaxBailmentLinesPerPage = 0 then begin
                        Error(Text002);
                    end;
                    NumberOfBailments := BailmentLines.Count;
                    NumberOfBailmentsLoops := (NumberOfBailments div MaxBailmentLinesPerPage) * MaxBailmentLinesPerPage +
                                              (NumberOfBailments mod MaxBailmentLinesPerPage);
                    if (NumberOfBailments mod MaxBailmentLinesPerPage) <> 0 then begin
                        NumberOfBailmentsLoops += (MaxBailmentLinesPerPage - NumberOfBailments mod MaxBailmentLinesPerPage);
                    end;
                    NumberOfBailmentsPages := NumberOfBailmentsLoops div MaxBailmentLinesPerPage;
                    if NumberOfBailmentsPages > NumberOfPages then begin
                        NumberOfPages := NumberOfBailmentsPages;
                    end;
                end;
            end;

            trigger OnPreDataItem()
            begin
                SetRange(Number, 1, TmpDocumentHeader.Count);
            end;
        }

    }

    requestpage
    {

        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field(DocumentType; DocumentType)
                    {
                        Caption = 'Document Type';
                        OptionCaption = ' ,Sales Order,Sales Invoice,Sales Shipment,Sales Credit Memo,Sales Return Receipt,Purchase Order,Purchase Invoice,Purchase Receipt,Purchase Credit Memo,Purchase Return Shipment,Service Order,Service Invoice,Service Shipment,Service Credit Memo,Service Return Receipt,Transfer Order,Transfer Shipment,Transfer Receipt';
                        ApplicationArea = All;

                        trigger OnValidate()
                        begin
                            DocumentNo := '';
                        end;
                    }
                    field(DocumentNo; DocumentNo)
                    {
                        Caption = 'Document No.';
                        ApplicationArea = All;

                        trigger OnLookup(var Text: Text): Boolean
                        var
                            SalesHeader: Record "Sales Header";
                            SalesInvHeader: Record "Sales Invoice Header";
                            SalesShipmentHeader: Record "Sales Shipment Header";
                            SalesCrMemoHeader: Record "Sales Cr.Memo Header";
                            ReturnReceiptHeader: Record "Return Receipt Header";
                            PurchaseHeader: Record "Purchase Header";
                            PurchInvHeader: Record "Purch. Inv. Header";
                            PurchReceiptHeader: Record "Purch. Rcpt. Header";
                            PurchCrmemoHeader: Record "Purch. Cr. Memo Hdr.";
                            ReturnShipmentHeader: Record "Return Shipment Header";
                            "__RCGPR008993-01__": Integer;
                            ServiceHeader: Record "Service Header";
                            ServiceInvoiceHeader: Record "Service Invoice Header";
                            ServiceShipmentHeader: Record "Service Shipment Header";
                            ServiceCrMemoHeader: Record "Service Cr.Memo Header";
                            "__RCGPR010424-01__": Integer;
                            TransferHeader: Record "Transfer Header";
                            TransferShipmentHeader: Record "Transfer Shipment Header";
                            TransferReceiptHeader: Record "Transfer Receipt Header";
                        begin
                            case DocumentType of
                                DocumentType::" ":
                                    begin
                                    end;
                                DocumentType::"Sales Order":
                                    begin
                                        SalesHeader.SetRange("Document Type", SalesHeader."Document Type"::Order);
                                        if PAGE.RunModal(0, SalesHeader) = ACTION::LookupOK then
                                            DocumentNo := SalesHeader."No.";
                                    end;
                                DocumentType::"Sales Invoice":
                                    begin
                                        if PAGE.RunModal(0, SalesInvHeader) = ACTION::LookupOK then
                                            DocumentNo := SalesInvHeader."No.";
                                    end;
                                DocumentType::"Sales Shipment":
                                    begin
                                        if PAGE.RunModal(0, SalesShipmentHeader) = ACTION::LookupOK then
                                            DocumentNo := SalesShipmentHeader."No.";
                                    end;
                                DocumentType::"Sales Credit Memo":
                                    begin
                                        if PAGE.RunModal(0, SalesCrMemoHeader) = ACTION::LookupOK then
                                            DocumentNo := SalesCrMemoHeader."No.";
                                    end;
                                DocumentType::"Return Receipt":
                                    begin
                                        if PAGE.RunModal(0, ReturnReceiptHeader) = ACTION::LookupOK then
                                            DocumentNo := ReturnReceiptHeader."No.";
                                    end;
                                DocumentType::"Purchase Order":
                                    begin
                                        PurchaseHeader.SetRange("Document Type", PurchaseHeader."Document Type"::Order);
                                        if PAGE.RunModal(0, PurchaseHeader) = ACTION::LookupOK then
                                            DocumentNo := PurchaseHeader."No.";
                                    end;
                                DocumentType::"Purchase Invoice":
                                    begin
                                        if PAGE.RunModal(0, PurchInvHeader) = ACTION::LookupOK then
                                            DocumentNo := PurchInvHeader."No.";
                                    end;
                                DocumentType::"Purchase Receipt":
                                    begin
                                        if PAGE.RunModal(0, PurchReceiptHeader) = ACTION::LookupOK then
                                            DocumentNo := PurchReceiptHeader."No.";
                                    end;
                                DocumentType::"Purchase Credit Memo":
                                    begin
                                        if PAGE.RunModal(0, PurchCrmemoHeader) = ACTION::LookupOK then
                                            DocumentNo := PurchCrmemoHeader."No.";
                                    end;
                                DocumentType::"Return Shipment":
                                    begin
                                        if PAGE.RunModal(0, ReturnShipmentHeader) = ACTION::LookupOK then
                                            DocumentNo := ReturnShipmentHeader."No.";
                                    end;
                                DocumentType::"Service Order":
                                    begin
                                        ServiceHeader.SetRange("Document Type", ServiceHeader."Document Type"::Order);
                                        if PAGE.RunModal(0, ServiceHeader) = ACTION::LookupOK then
                                            DocumentNo := ServiceHeader."No.";
                                    end;
                                DocumentType::"Service Invoice":
                                    begin
                                        if PAGE.RunModal(0, ServiceInvoiceHeader) = ACTION::LookupOK then
                                            DocumentNo := ServiceInvoiceHeader."No.";
                                    end;
                                DocumentType::"Service Shipment":
                                    begin
                                        if PAGE.RunModal(0, ServiceShipmentHeader) = ACTION::LookupOK then
                                            DocumentNo := ServiceShipmentHeader."No.";
                                    end;
                                DocumentType::"Service Credit Memo":
                                    begin
                                        if PAGE.RunModal(0, ServiceCrMemoHeader) = ACTION::LookupOK then
                                            DocumentNo := ServiceCrMemoHeader."No.";
                                    end;

                                DocumentType::"Transfer Order":
                                    begin
                                        if PAGE.RunModal(0, TransferHeader) = ACTION::LookupOK then begin
                                            DocumentNo := TransferHeader."No.";
                                        end;
                                    end;
                                DocumentType::"Transfer Shipment":
                                    begin
                                        if PAGE.RunModal(0, TransferShipmentHeader) = ACTION::LookupOK then begin
                                            DocumentNo := TransferShipmentHeader."No.";
                                        end;
                                    end;
                                DocumentType::"Transfer Receipt":
                                    begin
                                        if PAGE.RunModal(0, TransferReceiptHeader) = ACTION::LookupOK then begin
                                            DocumentNo := TransferReceiptHeader."No.";
                                        end;
                                    end;
                            end;
                        end;
                    }
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnPreReport()
    begin
        Evaluate(ReportNumber, DelStr(CurrReport.ObjectId(false), 1, 7));
    end;

    var
        SessionSett: SessionSettings;
        SalesInvoiceReportingSetup: Record "Report Standard Texts";
        TmpDocumentHeader: Record "Document Header RCGRBASE" temporary;
        TmpDocumentLine: Record "Document Line RCGRBASE" temporary;
        CompanyInfo: Record "Company Information";
        TempFooterDocumentHeader: Record "Document Header RCGRBASE" temporary;
        BailmentLines: Record "Document Line RCGRBASE" temporary;
        VatClause: Record "VAT Clause";
        DocManagment: Codeunit "Document Mgt. RCGRBASE";
        DocumentNo: Code[20];
        CopyDescription: Text[50];
        CompanyAddress: array[20] of Text[250];
        TmpDiscSum: Decimal;
        MaxLinesPerPage: Integer;
        NumberOfCurrentPage: Integer;
        NumberOfPages: Integer;
        NumberOfLines: Integer;
        NumberOfLoops: Integer;
        NumberOfCopies: Integer;
        NumberOfLinesDone: Integer;
        TotalNumberOfLinesDone: Integer;
        NumberOfBailments: Integer;
        NumberOfBailmentsLoops: Integer;
        NumberOfBailmentsPages: Integer;
        NumberOfBailmentLinesDone: Integer;
        MaxBailmentLinesPerPage: Integer;
        ReportNumber: Integer;
        PageNo: Label 'Page : ';
        RegNo: Label 'Reg. No.';
        StdComment1: text;
        StdComment2: text;
        StdComment3: text;
        StdComment4: text;
        StdComment5: text;
        StdComment6: text;
        DueDateTxt: Text;
        VatClauses: Text;
        PaymentTermsTxt: Text;
        VATClausesText: Text;
        VatClauseCode: Text;
        PreparedByText: Text;
        PreparedByCaptionText: Text;
        DirectorText: Text;
        DirectorCaptionText: Text;
        PaymentTermsCaptionLbl: Label 'Payment Terms';
        PaymentTermsLbl: Label 'By remittance within %1 after the receipt of invoice.';
        DueDateLbl: Label 'Due Date';
        BranchAddress1: Label 'Branch 1 Address';
        BranchAddress2: Label 'Branch 2 Address';
        BranchAddress3: Label 'Branch 3 Address';
        Text001: Label 'Bailments';
        VATClausesLbl: Label 'VAT Clause';
        LineType: Integer;
        ShowEmptyLine: Boolean;
        GetFirstDocumentLine: Boolean;
        GetFirstBailmentLine: Boolean;
        IsTransfer: Boolean;
        HasBailment: Boolean;
        IsGR: Boolean;
        Text002: Label 'You must set field Bailments Per Page at table Report Selections';
        CodeCaptionLbl: Label 'Code';
        VAT__CaptionLbl: Label 'VAT %';
        Amount_After_DiscountCaptionLbl: Label 'Amount After Discount';
        Discount_AmountCaptionLbl: Label 'Discount Amount';
        Discount__CaptionLbl: Label 'Discount %';
        AmountCaptionLbl: Label 'Amount';
        Unit_PriceCaptionLbl: Label 'Unit Price';
        QuantityCaptionLbl: Label 'Quantity';
        UOMCaptionLbl: Label 'UOM';
        DescriptionCaptionLbl: Label 'Description';
        TmpDocumentHeader__No__Series_Description_CaptionLbl: Label 'Document Type';
        TmpDocumentHeader__Document_No__CaptionLbl: Label 'Document No.';
        TmpDocumentHeader__Posting_Date_CaptionLbl: Label 'Date';
        TmpDocumentHeader__Posting_Time_CaptionLbl: Label 'Time';
        TmpDocumentHeader__No__CaptionLbl: Label 'Code';
        TmpDocumentHeader_NameCaptionLbl: Label 'Name';
        TmpDocumentHeader_ProfessionCaptionLbl: Label 'Profession';
        CaptionLbl: Label ':';
        Caption_Control1103201144Lbl: Label ':';
        Caption_Control1103201145Lbl: Label ':';
        Caption_Control1103201162Lbl: Label ':';
        TmpDocumentHeader__Vat_Registration_No__CaptionLbl: Label 'VAT Reg. No.';
        Caption_Control1103201167Lbl: Label ':';
        TmpDocumentHeader_AddressCaptionLbl: Label 'Address';
        Caption_Control1103201170Lbl: Label ':';
        TmpDocumentHeader__Tax_Office_CaptionLbl: Label 'Tax Office';
        Caption_Control1103201109Lbl: Label ':';
        Caption_Control1103201112Lbl: Label ':';
        TmpDocumentHeader__Location_Address_CaptionLbl: Label 'Location Address';
        TmpDocumentHeader__Ship_To_Address_CaptionLbl: Label 'Ship-to Address';
        Caption_Control1103201038Lbl: Label ':';
        TmpDocumentHeader__Ship_To_Name_CaptionLbl: Label 'Ship-to Name';
        Caption_Control1103201044Lbl: Label ':';
        TmpDocumentHeader__Transfer_Reason_CaptionLbl: Label 'Transfer Reason';
        Caption_Control1103201055Lbl: Label ':';
        TmpDocumentHeader__Payment_Method_CaptionLbl: Label 'Payment Method';
        CodeCaption_Control1103201174Lbl: Label 'Code';
        VAT__Caption_Control1103201175Lbl: Label 'VAT %';
        Amount_After_DiscountCaption_Control1103201176Lbl: Label 'Amount After Discount';
        Discount_AmountCaption_Control1103201177Lbl: Label 'Discount Amount';
        Discount__Caption_Control1103201178Lbl: Label 'Discount %';
        AmountCaption_Control1103201179Lbl: Label 'Amount';
        Unit_PriceCaption_Control1103201180Lbl: Label 'Unit Price';
        QuantityCaption_Control1103201181Lbl: Label 'Quantity';
        UOMCaption_Control1103201182Lbl: Label 'UOM';
        DescriptionCaption_Control1103201183Lbl: Label 'Description';
        TmpDocumentHeader__No__Series_Description__Control1103201072CaptionLbl: Label 'Document Type';
        TmpDocumentHeader__Document_No___Control1103201061CaptionLbl: Label 'Document No.';
        TmpDocumentHeader__Posting_Date__Control1103201134CaptionLbl: Label 'Date';
        TmpDocumentHeader__Posting_Time__Control1103201138CaptionLbl: Label 'Time';
        Ship_FromCaptionLbl: Label 'Ship From';
        Receive_ToCaptionLbl: Label 'Receive To';
        Caption_Control1103201274Lbl: Label ':';
        DescriptionCaption_Control1103201275Lbl: Label 'Description';
        Caption_Control1103201278Lbl: Label ':';
        TmpDocumentHeader_Address_Control1103201276CaptionLbl: Label 'Address';
        TmpDocumentHeader_Profession_Control1103201286CaptionLbl: Label 'Profession';
        Caption_Control1103201291Lbl: Label ':';
        TmpDocumentHeader__Ship_To_Profession_CaptionLbl: Label 'Profession';
        Business_Partner_DetailsCaptionLbl: Label 'Business Partner Details';
        TmpDocumentHeader__Ship_To_Address__Control1103201313CaptionLbl: Label 'Address';
        TmpDocumentHeader__Ship_To_Name__Control1103201315CaptionLbl: Label 'Name';
        TmpDocumentHeader__Ship_To_Code_CaptionLbl: Label 'Code';
        TmpDocumentHeader__Ship_To_Vat_Registration_No__CaptionLbl: Label 'VAT Reg. No.';
        Caption_Control1103201300Lbl: Label ':';
        TmpDocumentHeader__Vat_Registration_No___Control1103201298CaptionLbl: Label 'VAT Reg. No.';
        Caption_Control1103201303Lbl: Label ':';
        TmpDocumentHeader__Ship_To_Tax_Office_CaptionLbl: Label 'Tax Office';
        Caption_Control1103201307Lbl: Label ':';
        Caption_Control1103201308Lbl: Label ':';
        TmpDocumentHeader__Tax_Office__Control1103201305CaptionLbl: Label 'Tax Office';
        Caption_Control1103201311Lbl: Label ':';
        Caption_Control1103201314Lbl: Label ':';
        Caption_Control1103201316Lbl: Label ':';
        Caption_Control1103201318Lbl: Label ':';
        TmpDocumentHeader__No___Control1103201264CaptionLbl: Label 'Code';
        Caption_Control1103201266Lbl: Label ':';
        Business_Partner_DetailsCaption_Control1103201142Lbl: Label 'Business Partner Details';
        Caption_Control1103201191Lbl: Label ':';
        TmpDocumentHeader__Location_Address__Control1103201190CaptionLbl: Label 'In Transit Location';
        Caption_Control1103201194Lbl: Label ':';
        TmpDocumentHeader__Transfer_Reason__Control1103201193CaptionLbl: Label 'Transfer Reason';
        ISSUEDCaptionLbl: Label 'ISSUED';
        RECEIPTCaptionLbl: Label 'RECEIPT';
        TempFooterDocumentHeader__Old_Balance_CaptionLbl: Label 'Prev. Balance';
        TempFooterDocumentHeader__New_Balance_CaptionLbl: Label 'New Balance';
        TempFooterDocumentHeader__VAT_Cat__1_CaptionLbl: Label 'VAT %';
        TempFooterDocumentHeader__VAT_Cat__1_net_Amount_CaptionLbl: Label 'Net Amount';
        TempFooterDocumentHeader__VAT_Cat__1__VAT_Amount_CaptionLbl: Label 'VAT Amount';
        TempFooterDocumentHeader__Document_Amount_CaptionLbl: Label 'Sum Amount';
        TempFooterDocumentHeader__Document_Discount_Amount_CaptionLbl: Label 'Sum Discount';
        TempFooterDocumentHeader__Document_Amount_After_Discount_CaptionLbl: Label 'Sum After Disc.';
        TempFooterDocumentHeader__Document_VAT_Amount_CaptionLbl: Label 'Sum VAT';
        TempFooterDocumentHeader__Document_Charges_Amount_CaptionLbl: Label 'Sum Other Amount';
        TempFooterDocumentHeader__Document_Charges_VAT_CaptionLbl: Label 'Sum Other VAT';
        TempFooterDocumentHeader__Document_Amount_Inc__VAT_CaptionLbl: Label 'Final Amount';
        CommentsCaptionLbl: Label 'Comments';
        TempFooterDocumentHeader__Document_Tax_VAT_Amount_CaptionLbl: Label 'Sum Tax VAT';
        TempFooterDocumentHeader__Document_Tax_Amount_CaptionLbl: Label 'Sum Tax Amount';
        InvDiscountAmountCaptionLbl: Label 'Invoice Discount Amount';
        CompanyInfo__Bank_Name____________CompanyInfo__Bank_Account_No__CaptionLbl: Label 'Bank Account';
        TempFooterDocumentHeader_Invoicelbl: Label 'Discount Invoice';
        TempFooterDocument_Linelbl: Label 'Discount Line';
        TempFooterDocument_SumLinelbl: Label 'Sum After Disc. Line';

        DocumentType: Option " ","Sales Order","Sales Invoice","Sales Shipment","Sales Credit Memo","Return Receipt","Purchase Order","Purchase Invoice","Purchase Receipt","Purchase Credit Memo","Return Shipment","Service Order","Service Invoice","Service Shipment","Service Credit Memo","Service Return Receipt","Transfer Order","Transfer Shipment","Transfer Receipt";

    local procedure GetCompanyInformation()
    var
        Country: Record "Country/Region";
        SalesInvoiceHeader2: Record "Sales Invoice Header";
    begin
        SessionSett.Init();
        if SessionSett.LanguageId = 2057 then
            IsGR := true;
        if TmpDocumentHeader."Document Type" = TmpDocumentHeader."Document Type"::"Sales Invoice" then
            if SalesInvoiceHeader2.get(TmpDocumentHeader."Document No.") then
                if SalesInvoiceHeader2."Language Code" = 'ENG' then
                    IsGR := true;
        Evaluate(ReportNumber, DelStr(CurrReport.ObjectId(false), 1, 7));
        CompanyInfo.Get;
        if IsGR then
            CompanyAddress[1] := CompanyInfo.Name + ', ' + CompanyInfo."Profession RCGRBASE"
        else
            CompanyAddress[1] := CompanyInfo."Name EN" + ', ' + CompanyInfo."Profession EN";
        CheckAndAddText(CompanyAddress[2], CompanyInfo.FieldCaption("VAT Registration No."), CompanyInfo."VAT Registration No.", ',');
        if IsGR then
            CheckAndAddText(CompanyAddress[2], CompanyInfo.FieldCaption("Tax Office RCGRBASE"), CompanyInfo."Tax Office RCGRBASE", ',')
        else
            CheckAndAddText(CompanyAddress[2], CompanyInfo.FieldCaption("Tax Office RCGRBASE"), CompanyInfo."Tax Office EN", ',');
        CheckAndAddText(CompanyAddress[3], CompanyInfo.FieldCaption("E-Mail"), CompanyInfo."E-Mail", ',');
        CheckAndAddText(CompanyAddress[4], CompanyInfo.FieldCaption("Phone No."), CompanyInfo."Phone No.", ',');
        if IsGR then
            CheckAndAddText(CompanyAddress[5], CompanyInfo.FieldCaption(Address), CompanyInfo.Address, ',')
        else
            CheckAndAddText(CompanyAddress[5], CompanyInfo.FieldCaption(Address), CompanyInfo."Address EN", ',');
        CheckAndAddText(CompanyAddress[5], CompanyInfo.FieldCaption("Address 2"), CompanyInfo."Address 2", ',');
        if IsGR then
            CompanyAddress[6] := CompanyInfo.City + ', ' + CompanyInfo."Post Code"
        else
            CompanyAddress[6] := CompanyInfo."City EN" + ', ' + CompanyInfo."Post Code";
        if Country.Get(CompanyInfo."Country/Region Code") then
            if IsGR then
                CompanyAddress[6] := CompanyAddress[6] + ' ' + Country.Name
            else
                CompanyAddress[6] := CompanyAddress[6] + ' ' + CompanyInfo."Country EN";
        CheckAndAddText(CompanyAddress[7], CompanyInfo.FieldCaption("Registration No."), CompanyInfo."Registration No.", ',');
        if CompanyInfo."Branch 1 Address RCGRBASE" <> '' then begin
            CompanyAddress[8] := BranchAddress1 + ': ' + CompanyInfo."Branch 1 Address RCGRBASE";
        end;
        if CompanyInfo."Branch 2 Address RCGRBASE" <> '' then begin
            CompanyAddress[9] := BranchAddress2 + ': ' + CompanyInfo."Branch 2 Address RCGRBASE";
        end;
        if CompanyInfo."Branch 3 Address RCGRBASE" <> '' then begin
            CompanyAddress[10] := BranchAddress3 + ': ' + CompanyInfo."Branch 3 Address RCGRBASE";
        end;
        CompanyInfo.CalcFields(Picture);
    end;

    local procedure CheckAndAddText(var InitialText: Text; SecondaryTextCaption: Text; SecondaryText: Text; Separator: Text)
    begin
        if SecondaryText = '' then
            exit;
        if InitialText = '' then
            InitialText := SecondaryTextCaption + ': ' + SecondaryText
        else
            InitialText := InitialText + Separator + ' ' + SecondaryTextCaption + ': ' + SecondaryText;
    end;

    local procedure GetVatClauses()
    var
        SalesInvoiceLine: Record "Sales Invoice Line";
        VatPostingSetup: Record "VAT Posting Setup";
        VatClauses: Record "VAT Clause";
    begin
        if TmpDocumentHeader."Document Type" = TmpDocumentHeader."Document Type"::"Sales Invoice" then begin
            SalesInvoiceLine.Reset();
            SalesInvoiceLine.SetRange("Document No.", TmpDocumentHeader."Document No.");
            if SalesInvoiceLine.FindSet() then begin
                repeat
                    if VatPostingSetup.Get(SalesInvoiceLine."VAT Bus. Posting Group", SalesInvoiceLine."VAT Prod. Posting Group") then begin
                        if VatClauseCode = '' then
                            VatClauseCode := VatPostingSetup."VAT Clause Code"
                        else
                            VatClauseCode += '|' + VatPostingSetup."VAT Clause Code";
                    end;
                until SalesInvoiceLine.Next() = 0;
            end;
        end;
    end;

    local procedure GetPaymentTermsAndDueDate()
    var
        SalesInvoiceHeader: Record "Sales Invoice Header";
        PaymentTerms: Record "Payment Terms";
    begin
        if TmpDocumentHeader."Document Type" = TmpDocumentHeader."Document Type"::"Sales Invoice" then begin
            SalesInvoiceHeader.get(TmpDocumentHeader."Document No.");
            DueDateTxt := format(SalesInvoiceHeader."Due Date");
            PaymentTerms.Get(SalesInvoiceHeader."Payment Terms Code");
            PaymentTermsTxt := StrSubstNo(PaymentTermsLbl, PaymentTerms.Description);
        end;
    end;

    local procedure GetRerportingSetupTexts()
    begin
        if SalesInvoiceReportingSetup.Get() then begin
            StdComment1 := SalesInvoiceReportingSetup."Sales Invoice Report Text 1";
            StdComment2 := SalesInvoiceReportingSetup."Sales Invoice Report Text 2";
            StdComment3 := SalesInvoiceReportingSetup."Sales Invoice Report Text 3";
            StdComment4 := SalesInvoiceReportingSetup."Sales Invoice Report Text 4";
            StdComment5 := SalesInvoiceReportingSetup."Sales Invoice Report Text 5";
            StdComment6 := SalesInvoiceReportingSetup."Sales Invoice Report Text 6";
            PreparedByText := SalesInvoiceReportingSetup."Prepared By";
            PreparedByCaptionText := SalesInvoiceReportingSetup.FieldCaption("Prepared By");
            DirectorText := SalesInvoiceReportingSetup.Director;
            DirectorCaptionText := SalesInvoiceReportingSetup.FieldCaption(Director);
        end;
    end;
}


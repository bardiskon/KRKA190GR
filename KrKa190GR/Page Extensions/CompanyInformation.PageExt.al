pageextension 59000 CompanyInformationPageExt extends "Company Information"
{
    layout
    {
        addafter("VAT Registration No.")
        {
            field("Registration No."; Rec."Registration No.")
            {
                ApplicationArea = all;
            }
        }
        addafter(Picture)
        {
            field("Name EN"; Rec."Name EN")
            {
                ApplicationArea = all;
            }
            field("Address EN"; Rec."Address EN")
            {
                ApplicationArea = all;
            }
            field("Country EN"; Rec."Country EN")
            {
                ApplicationArea = all;
            }
            field("Tax Office EN"; Rec."Tax Office EN")
            {
                ApplicationArea = all;
            }
            field("Profession EN"; Rec."Profession EN")
            {
                ApplicationArea = all;
            }
            field("City EN"; Rec."City EN")
            {
                ApplicationArea = all;
            }
        }
    }
}

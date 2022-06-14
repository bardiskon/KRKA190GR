pageextension 59001 "NoSeries.PageExt" extends "No. Series"
{
    layout
    {
        addafter(Description)
        {
            field("Printing Description RCGRBASE"; Rec."Printing Description RCGRBASE")
            {
                ApplicationArea = all;
            }
        }
    }
}

pageextension 59002 "SalesPostingPromptRCGRBASEExt" extends "Sales Posting Prompt RCGRBASE"
{
    layout
    {
        addafter("External Document No.")
        {
            field("Reason Code"; Rec."Reason Code")
            {
                ApplicationArea = all;
            }
        }

    }

    actions
    {
    }
}

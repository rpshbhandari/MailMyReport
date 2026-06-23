pageextension 70100 ReportInboxExtension extends "Report Inbox"
{
    PromotedActionCategories = 'New,Process,Report,Navigate';
    actions
    {
        addlast(Processing)
        {
            action(SendEmail)
            {
                Caption = 'Send Email';
                Image = Email;
                ApplicationArea = All;
                PromotedCategory = Category4;
                Promoted = true;

                trigger OnAction()
                var
                    EmailReport: Codeunit "MMR Email Management";
                begin
                    EmailReport.SendReportEmail(Rec."Entry No.");
                end;
            }

            action(OpenEmailSetup)
            {
                Caption = 'Email Setup';
                Image = Setup;
                ApplicationArea = All;
                PromotedCategory = Category4;
                Promoted = true;

                trigger OnAction()
                begin
                    Page.Run(Page::"MMR Email Setup");
                end;
            }
        }
    }
}
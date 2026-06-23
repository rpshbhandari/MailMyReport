permissionset 70100 GeneratedPermission
{
    Assignable = true;
    Permissions = tabledata "MMR Email Setup"=RIMD,
        tabledata "MMR Report Recipient"=RIMD,
        table "MMR Email Setup"=X,
        table "MMR Report Recipient"=X,
        codeunit "MMR Email Management"=X,
        codeunit Triggers=X,
        page "MMR Email Recipients"=X,
        page "MMR Email Setup"=X;
}
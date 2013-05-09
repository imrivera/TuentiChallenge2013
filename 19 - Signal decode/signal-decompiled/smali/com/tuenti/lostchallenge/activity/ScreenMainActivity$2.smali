.class Lcom/tuenti/lostchallenge/activity/ScreenMainActivity$2;
.super Ljava/lang/Object;
.source "ScreenMainActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tuenti/lostchallenge/activity/ScreenMainActivity;->hookListeners()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/tuenti/lostchallenge/activity/ScreenMainActivity;


# direct methods
.method constructor <init>(Lcom/tuenti/lostchallenge/activity/ScreenMainActivity;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/tuenti/lostchallenge/activity/ScreenMainActivity$2;->this$0:Lcom/tuenti/lostchallenge/activity/ScreenMainActivity;

    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0(Lcom/tuenti/lostchallenge/activity/ScreenMainActivity$2;)Lcom/tuenti/lostchallenge/activity/ScreenMainActivity;
    .locals 1
    .parameter

    .prologue
    .line 43
    iget-object v0, p0, Lcom/tuenti/lostchallenge/activity/ScreenMainActivity$2;->this$0:Lcom/tuenti/lostchallenge/activity/ScreenMainActivity;

    return-object v0
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 8
    .parameter "v"

    .prologue
    const/4 v7, 0x1

    .line 48
    :try_start_0
    sget-boolean v4, Lcom/tuenti/lostchallenge/service/SignalService;->isConected:Z

    if-eqz v4, :cond_0

    .line 50
    const/4 v4, 0x0

    sput-boolean v4, Lcom/tuenti/lostchallenge/service/SignalService;->isConected:Z

    .line 51
    iget-object v4, p0, Lcom/tuenti/lostchallenge/activity/ScreenMainActivity$2;->this$0:Lcom/tuenti/lostchallenge/activity/ScreenMainActivity;

    new-instance v5, Lcom/tuenti/lostchallenge/activity/ScreenMainActivity$2$1;

    invoke-direct {v5, p0}, Lcom/tuenti/lostchallenge/activity/ScreenMainActivity$2$1;-><init>(Lcom/tuenti/lostchallenge/activity/ScreenMainActivity$2;)V

    invoke-virtual {v4, v5}, Lcom/tuenti/lostchallenge/activity/ScreenMainActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 88
    :goto_0
    return-void

    .line 59
    :cond_0
    iget-object v4, p0, Lcom/tuenti/lostchallenge/activity/ScreenMainActivity$2;->this$0:Lcom/tuenti/lostchallenge/activity/ScreenMainActivity;

    #getter for: Lcom/tuenti/lostchallenge/activity/ScreenMainActivity;->et_channel:Landroid/widget/EditText;
    invoke-static {v4}, Lcom/tuenti/lostchallenge/activity/ScreenMainActivity;->access$1(Lcom/tuenti/lostchallenge/activity/ScreenMainActivity;)Landroid/widget/EditText;

    move-result-object v4

    invoke-virtual {v4}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v4

    invoke-interface {v4}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v0

    .line 60
    .local v0, channel:Ljava/lang/String;
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    .line 62
    .local v2, iChannel:I
    const/4 v4, 0x5

    if-ge v2, v4, :cond_1

    .line 64
    iget-object v4, p0, Lcom/tuenti/lostchallenge/activity/ScreenMainActivity$2;->this$0:Lcom/tuenti/lostchallenge/activity/ScreenMainActivity;

    new-instance v5, Lcom/tuenti/lostchallenge/activity/ScreenMainActivity$2$2;

    invoke-direct {v5, p0}, Lcom/tuenti/lostchallenge/activity/ScreenMainActivity$2$2;-><init>(Lcom/tuenti/lostchallenge/activity/ScreenMainActivity$2;)V

    invoke-virtual {v4, v5}, Lcom/tuenti/lostchallenge/activity/ScreenMainActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 72
    new-instance v3, Landroid/content/Intent;

    iget-object v4, p0, Lcom/tuenti/lostchallenge/activity/ScreenMainActivity$2;->this$0:Lcom/tuenti/lostchallenge/activity/ScreenMainActivity;

    .line 73
    const-class v5, Lcom/tuenti/lostchallenge/service/SignalService;

    .line 72
    invoke-direct {v3, v4, v5}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 74
    .local v3, intent:Landroid/content/Intent;
    const-string v4, "channel"

    invoke-virtual {v3, v4, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 75
    iget-object v4, p0, Lcom/tuenti/lostchallenge/activity/ScreenMainActivity$2;->this$0:Lcom/tuenti/lostchallenge/activity/ScreenMainActivity;

    invoke-virtual {v4, v3}, Lcom/tuenti/lostchallenge/activity/ScreenMainActivity;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 83
    .end local v0           #channel:Ljava/lang/String;
    .end local v2           #iChannel:I
    .end local v3           #intent:Landroid/content/Intent;
    :catch_0
    move-exception v1

    .line 84
    .local v1, e:Ljava/lang/Exception;
    iget-object v4, p0, Lcom/tuenti/lostchallenge/activity/ScreenMainActivity$2;->this$0:Lcom/tuenti/lostchallenge/activity/ScreenMainActivity;

    invoke-virtual {v4}, Lcom/tuenti/lostchallenge/activity/ScreenMainActivity;->getBaseContext()Landroid/content/Context;

    move-result-object v4

    .line 85
    const-string v5, "This is your channel, really?"

    .line 84
    invoke-static {v4, v5, v7}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v4

    .line 86
    invoke-virtual {v4}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 77
    .end local v1           #e:Ljava/lang/Exception;
    .restart local v0       #channel:Ljava/lang/String;
    .restart local v2       #iChannel:I
    :cond_1
    :try_start_1
    iget-object v4, p0, Lcom/tuenti/lostchallenge/activity/ScreenMainActivity$2;->this$0:Lcom/tuenti/lostchallenge/activity/ScreenMainActivity;

    invoke-virtual {v4}, Lcom/tuenti/lostchallenge/activity/ScreenMainActivity;->getBaseContext()Landroid/content/Context;

    move-result-object v4

    .line 78
    const-string v5, "This is your channel, really?"

    .line 79
    const/4 v6, 0x1

    .line 77
    invoke-static {v4, v5, v6}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v4

    .line 79
    invoke-virtual {v4}, Landroid/widget/Toast;->show()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0
.end method

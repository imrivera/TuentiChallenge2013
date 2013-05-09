.class Lcom/tuenti/lostchallenge/activity/ScreenMainActivity$1;
.super Landroid/content/BroadcastReceiver;
.source "ScreenMainActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tuenti/lostchallenge/activity/ScreenMainActivity;
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
    iput-object p1, p0, Lcom/tuenti/lostchallenge/activity/ScreenMainActivity$1;->this$0:Lcom/tuenti/lostchallenge/activity/ScreenMainActivity;

    .line 116
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 3
    .parameter "context"
    .parameter "intent"

    .prologue
    .line 120
    const-string v0, "service"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "receiving :"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 121
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string v1, "com.tuenti.signal"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 122
    iget-object v0, p0, Lcom/tuenti/lostchallenge/activity/ScreenMainActivity$1;->this$0:Lcom/tuenti/lostchallenge/activity/ScreenMainActivity;

    const-string v1, "THIS IS A SIGNAL"

    .line 123
    const/4 v2, 0x1

    .line 122
    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    .line 123
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 125
    :cond_0
    return-void
.end method

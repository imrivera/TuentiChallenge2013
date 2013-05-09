.class Lcom/tuenti/lostchallenge/activity/ScreenMainActivity$2$1;
.super Ljava/lang/Object;
.source "ScreenMainActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tuenti/lostchallenge/activity/ScreenMainActivity$2;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/tuenti/lostchallenge/activity/ScreenMainActivity$2;


# direct methods
.method constructor <init>(Lcom/tuenti/lostchallenge/activity/ScreenMainActivity$2;)V
    .locals 0
    .parameter

    .prologue
    .line 1
    iput-object p1, p0, Lcom/tuenti/lostchallenge/activity/ScreenMainActivity$2$1;->this$1:Lcom/tuenti/lostchallenge/activity/ScreenMainActivity$2;

    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 55
    iget-object v0, p0, Lcom/tuenti/lostchallenge/activity/ScreenMainActivity$2$1;->this$1:Lcom/tuenti/lostchallenge/activity/ScreenMainActivity$2;

    #getter for: Lcom/tuenti/lostchallenge/activity/ScreenMainActivity$2;->this$0:Lcom/tuenti/lostchallenge/activity/ScreenMainActivity;
    invoke-static {v0}, Lcom/tuenti/lostchallenge/activity/ScreenMainActivity$2;->access$0(Lcom/tuenti/lostchallenge/activity/ScreenMainActivity$2;)Lcom/tuenti/lostchallenge/activity/ScreenMainActivity;

    move-result-object v0

    #getter for: Lcom/tuenti/lostchallenge/activity/ScreenMainActivity;->bt_start:Landroid/widget/Button;
    invoke-static {v0}, Lcom/tuenti/lostchallenge/activity/ScreenMainActivity;->access$0(Lcom/tuenti/lostchallenge/activity/ScreenMainActivity;)Landroid/widget/Button;

    move-result-object v0

    const v1, 0x7f040005

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(I)V

    .line 56
    return-void
.end method

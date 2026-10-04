.class Lcom/keyestudio/IOTfarm/MainActivity$connectthread$3;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/keyestudio/IOTfarm/MainActivity$connectthread;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/keyestudio/IOTfarm/MainActivity$connectthread;


# direct methods
.method constructor <init>(Lcom/keyestudio/IOTfarm/MainActivity$connectthread;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 481
    iput-object p1, p0, Lcom/keyestudio/IOTfarm/MainActivity$connectthread$3;->this$1:Lcom/keyestudio/IOTfarm/MainActivity$connectthread;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 485
    iget-object v0, p0, Lcom/keyestudio/IOTfarm/MainActivity$connectthread$3;->this$1:Lcom/keyestudio/IOTfarm/MainActivity$connectthread;

    iget-object v0, v0, Lcom/keyestudio/IOTfarm/MainActivity$connectthread;->this$0:Lcom/keyestudio/IOTfarm/MainActivity;

    const/4 v1, 0x0

    const-string v2, "Connect Failed"

    invoke-static {v0, v2, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 486
    iget-object v0, p0, Lcom/keyestudio/IOTfarm/MainActivity$connectthread$3;->this$1:Lcom/keyestudio/IOTfarm/MainActivity$connectthread;

    iget-object v0, v0, Lcom/keyestudio/IOTfarm/MainActivity$connectthread;->this$0:Lcom/keyestudio/IOTfarm/MainActivity;

    iget-object v0, v0, Lcom/keyestudio/IOTfarm/MainActivity;->receive:Landroid/widget/TextView;

    const-string v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 487
    iget-object v0, p0, Lcom/keyestudio/IOTfarm/MainActivity$connectthread$3;->this$1:Lcom/keyestudio/IOTfarm/MainActivity$connectthread;

    iget-object v0, v0, Lcom/keyestudio/IOTfarm/MainActivity$connectthread;->this$0:Lcom/keyestudio/IOTfarm/MainActivity;

    iget-object v0, v0, Lcom/keyestudio/IOTfarm/MainActivity;->receive:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->append(Ljava/lang/CharSequence;)V

    return-void
.end method

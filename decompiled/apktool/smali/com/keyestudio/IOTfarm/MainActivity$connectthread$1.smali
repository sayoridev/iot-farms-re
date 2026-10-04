.class Lcom/keyestudio/IOTfarm/MainActivity$connectthread$1;
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

    .line 454
    iput-object p1, p0, Lcom/keyestudio/IOTfarm/MainActivity$connectthread$1;->this$1:Lcom/keyestudio/IOTfarm/MainActivity$connectthread;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 458
    iget-object v0, p0, Lcom/keyestudio/IOTfarm/MainActivity$connectthread$1;->this$1:Lcom/keyestudio/IOTfarm/MainActivity$connectthread;

    iget-object v0, v0, Lcom/keyestudio/IOTfarm/MainActivity$connectthread;->this$0:Lcom/keyestudio/IOTfarm/MainActivity;

    const-string v1, "Successfully Connected"

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 459
    iget-object v0, p0, Lcom/keyestudio/IOTfarm/MainActivity$connectthread$1;->this$1:Lcom/keyestudio/IOTfarm/MainActivity$connectthread;

    iget-object v0, v0, Lcom/keyestudio/IOTfarm/MainActivity$connectthread;->this$0:Lcom/keyestudio/IOTfarm/MainActivity;

    iget-object v0, v0, Lcom/keyestudio/IOTfarm/MainActivity;->receive:Landroid/widget/TextView;

    const-string v1, ""

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 460
    iget-object v0, p0, Lcom/keyestudio/IOTfarm/MainActivity$connectthread$1;->this$1:Lcom/keyestudio/IOTfarm/MainActivity$connectthread;

    iget-object v0, v0, Lcom/keyestudio/IOTfarm/MainActivity$connectthread;->this$0:Lcom/keyestudio/IOTfarm/MainActivity;

    iget-object v0, v0, Lcom/keyestudio/IOTfarm/MainActivity;->receive:Landroid/widget/TextView;

    const-string v1, "Connection ready"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->append(Ljava/lang/CharSequence;)V

    .line 461
    iget-object v0, p0, Lcom/keyestudio/IOTfarm/MainActivity$connectthread$1;->this$1:Lcom/keyestudio/IOTfarm/MainActivity$connectthread;

    iget-object v0, v0, Lcom/keyestudio/IOTfarm/MainActivity$connectthread;->this$0:Lcom/keyestudio/IOTfarm/MainActivity;

    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    iput-object v1, v0, Lcom/keyestudio/IOTfarm/MainActivity;->disconnectVal:Ljava/lang/Boolean;

    return-void
.end method

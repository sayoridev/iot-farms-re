.class Lcom/keyestudio/IOTfarm/MainActivity$1$1;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/keyestudio/IOTfarm/MainActivity$1;->onCheckedChanged(Landroid/widget/CompoundButton;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/keyestudio/IOTfarm/MainActivity$1;


# direct methods
.method constructor <init>(Lcom/keyestudio/IOTfarm/MainActivity$1;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 119
    iput-object p1, p0, Lcom/keyestudio/IOTfarm/MainActivity$1$1;->this$1:Lcom/keyestudio/IOTfarm/MainActivity$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 125
    :try_start_0
    iget-object v0, p0, Lcom/keyestudio/IOTfarm/MainActivity$1$1;->this$1:Lcom/keyestudio/IOTfarm/MainActivity$1;

    iget-object v0, v0, Lcom/keyestudio/IOTfarm/MainActivity$1;->this$0:Lcom/keyestudio/IOTfarm/MainActivity;

    iget-object v0, v0, Lcom/keyestudio/IOTfarm/MainActivity;->disconnectVal:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 126
    iget-object v0, p0, Lcom/keyestudio/IOTfarm/MainActivity$1$1;->this$1:Lcom/keyestudio/IOTfarm/MainActivity$1;

    iget-object v0, v0, Lcom/keyestudio/IOTfarm/MainActivity$1;->this$0:Lcom/keyestudio/IOTfarm/MainActivity;

    iget-object v0, v0, Lcom/keyestudio/IOTfarm/MainActivity;->socket:Ljava/net/Socket;

    invoke-virtual {v0}, Ljava/net/Socket;->close()V

    .line 127
    iget-object v0, p0, Lcom/keyestudio/IOTfarm/MainActivity$1$1;->this$1:Lcom/keyestudio/IOTfarm/MainActivity$1;

    iget-object v0, v0, Lcom/keyestudio/IOTfarm/MainActivity$1;->this$0:Lcom/keyestudio/IOTfarm/MainActivity;

    const/4 v1, 0x0

    iput-object v1, v0, Lcom/keyestudio/IOTfarm/MainActivity;->socket:Ljava/net/Socket;

    .line 128
    iget-object v0, p0, Lcom/keyestudio/IOTfarm/MainActivity$1$1;->this$1:Lcom/keyestudio/IOTfarm/MainActivity$1;

    iget-object v0, v0, Lcom/keyestudio/IOTfarm/MainActivity$1;->this$0:Lcom/keyestudio/IOTfarm/MainActivity;

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    iput-object v1, v0, Lcom/keyestudio/IOTfarm/MainActivity;->disconnectVal:Ljava/lang/Boolean;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    return-void

    :catch_0
    move-exception v0

    .line 131
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

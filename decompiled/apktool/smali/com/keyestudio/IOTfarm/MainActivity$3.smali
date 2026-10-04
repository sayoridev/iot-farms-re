.class Lcom/keyestudio/IOTfarm/MainActivity$3;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/keyestudio/IOTfarm/MainActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/keyestudio/IOTfarm/MainActivity;


# direct methods
.method constructor <init>(Lcom/keyestudio/IOTfarm/MainActivity;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 190
    iput-object p1, p0, Lcom/keyestudio/IOTfarm/MainActivity$3;->this$0:Lcom/keyestudio/IOTfarm/MainActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 1

    .line 193
    new-instance p1, Ljava/lang/Thread;

    new-instance v0, Lcom/keyestudio/IOTfarm/MainActivity$3$1;

    invoke-direct {v0, p0, p2}, Lcom/keyestudio/IOTfarm/MainActivity$3$1;-><init>(Lcom/keyestudio/IOTfarm/MainActivity$3;Landroid/view/MotionEvent;)V

    invoke-direct {p1, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 229
    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    const/4 p1, 0x0

    return p1
.end method

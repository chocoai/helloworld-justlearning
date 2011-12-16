==========================
Emacs指南
==========================


.. contents:: 索引


基础知识
==================
    Emacs是一个架构在编辑器上的集成环境，除了最基本的编辑功能，还可以完成文件管理、终端模拟、浏览网页、收发邮件、编译程序等工作。

    Emacs使用Elisp语言进行配置和扩展，它本身也可以作为Elisp解释器使用。

|

    Emacs的界面主要由三部分构成：\ *信息栏*\ 、\ *回显区*\ (echo)、\ *缓冲区*\ (buffer)

缓冲区
--------------
    缓冲区(buffer) 类似于常规编辑器的文字编辑区。Emacs并不直接对文件进行修改，而是读取文件的内容并显示在缓冲区中，在收到保存的指令后才将修改写入文件。

    缓冲区名称通常为它所读取文件的文件名。

信息栏
--------------
    在缓冲区之下为状态栏，类似于这种形式 ::

        -U:**  emacs_tutor.rst   (24,0)   (reST)----7:55下午---------------

    显示当前缓冲区的状态，例如是否已保存、缓冲区名称、光标位置、主模式名称……

|

    标题栏也可以显示一部分信息，并且可以自由定义。


按键描述
---------------
    Emacs的功能键，通常为组合键。例如  

        =========== ========== =====
        Emacs       实际按键      功能
        ----------- ---------- -----
        C-f         Ctrl+f      光标前进一格
	C-b         Ctrl+b      光标后退一格
        C-d         Ctrl+d      删除一个字符
	C-a         Ctrl+a      回到行首
        =========== ========== =====

    Emacs对按键的描述方式中， **-** 之前的一个字符为修饰键，表示按住该键，再按 **-** 后面的键。

    例如： ``C-a`` 表示按住 *Ctrl* 再按 *a* 键。 Emacs对其它一些特殊按键的描述

    - **C-** 
        按住Ctrl键
    - **M-** 
        按住Meta键。在PC上，Meta键通常对应 *Alt* 键。也可以按一次 *ESC* 键(Windows下对应 *WIN* 键)
    - **C-M-** 
        同时按住Ctrl键和Meta键
    - **S-**
        Shift键
    - **s-**
        Linux下对应 *WIN** 键
    - **RET** 
        回车键
    - **TAB** 
        Tab键
    - **ESC** 
        Esc键
    - **SPC** 
        空格键
    - **DEL** *Backspace* 
        退格键
    - **Delete** 
        删除键

    在后面的部分中，将统一使用Emacs对按键的描述方式。

|
|

    Emacs十分强大，上面的组合键，远不能涵盖Emacs的功能于万一。除基本的编辑功能键外，其它功能多使用 **按键序列**\ ： 连续的按下多组快捷键

    例如： ``C-x C-c`` 表示先按下 *C-x* ，再按下 *C-c* 。也就是 *Ctrl+x* 后，再 *Ctrl+c* (退出Emacs)

    接下来 **C-h t** ，进入 《Emacs 快捷指南》
    

回显区
--------------------
    **C-x h** （先按\ *Ctrl+x* 再按\ *h*\ )后，您会发现状态栏和编辑器底部之间的区域出现 ``Mark set`` 字样。同时，整个缓冲区的内容都被选中。

    它是一个迷你缓冲区(minibuffer)，叫作回显区(echo area)，提示您正在进行的操作，比如 ``Mark set``\ (设定标记)

    如果一个按键序列没有完成，却停止了输入。大约两秒后，回显区会显示已输入部分，以免您忘记。千万不要以为是Emacs反应迟钝：）


内部命令
------------------
    **C-h k** 后，回显区提示 ::

           Describe key (or click or menu item):                                

    接着 *C-x h* ，您会发现，缓冲区被水平分割为两个。另一个名为 ***help*** 缓冲区中显示的内容为 
    ::

           C-x h runs the command mark-whole-buffer
	      which is an interactive compiled Lisp function in `simple.el'.
	   It is bound to C-x h, <menu-bar> <edit> <mark-whole-buffer>.
	   (mark-whole-buffer)

	   Put point at beginning and mark at end of buffer.
	   You probably should not use this function in Lisp programs;
	   it is usually a mistake for a Lisp function to use any subroutine
	   that uses or sets the mark.

	   [back] 


    | 第一行说明了 **C-x h** 运行的命令为 *mark-whole-buffer* 
    | 第二行说明了该命令由 *simple.el* 这个扩展提供，绑定到 *C-x h* 、 *菜单栏-编辑-标记全部缓冲区* 、 和命令 *mark-whole-buffer*
    | 第三行介绍了这个命令的行为： 在文档末尾设置一个标记，并把光标点移动到文档起始。

    .. _光标点: 

    .. note::
             光标点假定光标为插入式（竖线），位置在覆盖式光标(方块)的左侧。

             事实上，Emacs中的相关判定以光标点为准！方块形光标只是为了减少视觉疲劳：）

|

    **Emacs使用命令进行处理，快捷键只是一种发送命令的方法！**

|

    一般情况下，我们用不到这么详细的说明，而且英文看起来也比较吃力。您可以使用 **C-h c** 以简洁模式查看说明。 只在回显区显示键位和它执行的命令： ::

        C-x h runs the command mark-whole-buffer

    通常这就足够了。

|

    如果您知道一个命令，而不知道它绑定到什么键上，您可以使用 **C-h w** ，也就是命令 *Where-is*



Emacs命令行
--------------------
    由于Emacs太过强大，内部命令恒河沙数，根本不可能有同样数量的快捷键位来绑定它们！

    对于没有绑定的命令，可以使用 *命令行* 执行！

|

    **M-x** (Alt+x) 开启命令行，回显区显示为 ``M-x`` ，然后输入
      ``newli ne`` 

    这个命令默认绑定在回车键，所以它和回车键的作用一样为 *换行*
    
    ``C-h w newline`` 结果是： ``newline is on RET``


    .. tip:: 命令行中，可以使用 **TAB** 补全，使用 **M-p** 上翻， **M-n** 下翻

|

    在后面的部分中，统一使用 **M-x command** 来表示 **内部命令 command** ；内部命令以 *(command)* 的形式写到配置文件中，当然配置文件稍稍复杂一点，很少直接这么写：）

Emacs终端
-------------------------
    **M-x shell** 激活Emacs终端。可以在Emacs终端中使用外部命令。

    需要注意的是，Emacs终端是哑终端，一些类型的输出不能够正确显示。

    在Emacs终端中使用 **exit** 命令退出。

|

    
    **M-!** (Alt+Shift+1)临时执行一条外部命令，并输出在名为 ***Shell Command Output*** 的缓冲区中  (M-x shell-command) 


    
    **C-u M-!** (Ctrl+u Alt+Shift+1)临时执行一条外部命令，并输出到光标位置。

Emacs文件管理器
--------------------------
    **C-x d**   进入Dired列表模式

    **C-x C-d** 获取文件列表（简洁）

    **C-x C-f** 打开文件，输入路径为打开目录

    详细介绍见 文件管理_

        

区块选择
--------------------
    很多时候，我们需要选中缓冲区中的某一部分内容。和大多数程序一样，您可以在被选择区块的起始点按下左键，移动鼠标，在结束点释放左键，这部分区块便被选中。

    这种方式效率并不高，而且一些场合并没有鼠标支持，例如控制台或者远程登录。

    事实上，Emacs进行区块选择的方法，是设置一个标记，标记到\ 光标点_\ 之间的部分将被选中。

    标记的位置为 **M-x set-mark-command** 时，\ 光标点_\ 所处的位置。

|

    *M-x set-mark-command* 是设置标记的内部命令，默认绑定在 **C-SPC** 键上。

    如果使用输入法，这个键位多半是切换输入法的快捷键。键盘指令会先被输入法拦截下来，而无法发送到Emacs。

    当然也可以使用 **M-@** 来设定标记。不过 *M-@* 原绑定为 *M-x mark-word* ，虽然差不太多，但有时并不好用；况且对于一个常用的命令来讲， *M-@* 键位的难度太高了……

|

    Emacs的键位中，几乎没有默认绑定在 *WIN* 键上的命令，不妨利用一下：）

    在Emacs的用户配置文件 **~/.emacs** 中添加如下内容： ::

        ;; WIN+Space 设置标记
        (global-set-key (kbd "s-SPC") 'set-mark-command)    

    重启Emacs，或者在 *~/.emacs* 文件的缓冲区中执行命令 **M-x eval-buffer** ，便可以使配置文件立即生效：）

|

    .. _`C-z`:

    在某些类型的终端中，WIN键不起作用，建议使用命令。或者绑定到 **C-z** (Ctrl+z) ::

	;; （在注释里说明原命令和绑定，是一个良好的习惯）
        ;; C-z 设置标记 ;;  C-z:M-x iconify-or-deiconify-frame:C-z,C-x C-z
        (global-set-key (kbd "C-z") 'set-mark-command)

    **C-z** ，原为 *M-x iconify-or-deiconify-frame* 键为: *C-z*, *C-x C-z* 。绑定后，仍可以使用 **C-x C-z** 挂起Emacs。

    

中止执行
------------------
    如果想放弃一个命令，可以使用 **C-g** (\ *M-x keyboard-quit*\ )打断。

    当然了，建议您使用快捷键 *C-g* ，因为这时 *M-x* 通常是没有效果的

|

    **ESC ESC ESC** (\ *M-x keyboard-escape-quit*\ )可以从一些交互命令中退出。

    例如从 *询问替换* *M-x query-replace* 中退出。

    如果 *C-g* 不能搞定，这时多半需要连按三次 *ESC*


基本配置
------------------------
    您已经知道了，Emacs的配置文件为 **~/.emacs** 。配置文件中，以 **;** 起始到行末的部分为注释。

    让我们些简单配置一下： ::

        ;;========================================
        ;; 外观设置
        ;;========================================
      
        ;;禁用工具栏
        (tool-bar-mode nil)
      
        ;;禁用菜单栏，F10 开启关闭菜单
        (menu-bar-mode nil)
      
        ;;禁用滚动栏，用鼠标滚轮代替
        ;;(scroll-bar-mode nil)
      
        ;;禁用启动画面
        (setq inhibit-startup-message t)
      
        ;;========================================
        ;; 键绑定
        ;;========================================
      
        ;; C-z 设置标记 ;;  C-z:M-x iconify-or-deiconify-frame:C-z,C-x C-z
        (global-set-key (kbd "C-z") 'set-mark-command)
      
        ;;F10显示/隐藏菜单栏 ;; M-x menu-bar-open
        ;;(global-set-key (kbd "F10") 'menu-bar-mode)
      
        ;;WIN+s进入Shell ;; M-x shell
        (global-set-key (kbd "s-s") 'shell)
        ;;(define-key ctl-x-map "\M-s" 'shell)
      
        ;;WIN+space 设置标记
        (global-set-key (kbd "s-SPC") 'set-mark-command)
      
        ;;========================================
        ;; 缓冲区
        ;;========================================
      
        ;;设定行距
        (setq default-line-spacing 4)
      
        ;;页宽 
        (setq default-fill-column 60)
      
        ;;缺省模式 text-mode
        (setq default-major-mode 'text-mode)
      
        ;;设置删除纪录
        (setq kill-ring-max 200)
      
        ;;以空行结束
        (setq require-final-newline t) 
      
      
        ;;语法加亮
        (global-font-lock-mode t)
      
        ;;高亮显示区域选择
        (transient-mark-mode t)
      
        ;;页面平滑滚动， scroll-margin 3 靠近屏幕边沿3行时开始滚动，可以很好的看到上下文。
        (setq scroll-margin 3
        scroll-conservatively 10000)
      
        ;;高亮显示成对括号，但不来回弹跳
        (show-paren-mode t)
        (setq show-paren-style 'parentheses)
      
        ;;鼠标指针规避光标
        (mouse-avoidance-mode 'animate)
      
        ;;粘贴于光标处，而不是鼠标指针处
        (setq mouse-yank-at-point t)
      
        ;;========================================
        ;; 回显区
        ;;========================================
      
        ;;闪屏报警
        (setq visible-bell t)
      
        ;;使用 y or n 提问
        (fset 'yes-or-no-p 'y-or-n-p)
      
        ;;锁定行高
        (setq resize-mini-windows nil)
      
        ;;递归minibuffer
        (setq enable-recursive-minibuffers t) 
      
        ;;========================================
        ;; 状态栏
        ;;========================================
      
        ;;显示时间
        (display-time)
        ;;时间格式
        (setq display-time-24hr-format t)
        (setq display-time-day-and-date t)
        (setq display-time-interval 10)
      
        ;;显示列号
        (setq column-number-mode t)
      
        ;;标题栏显示 %f 缓冲区完整路径 %p 页面百分数 %l 行号 
        (setq frame-title-format "%f")
      
      
        ;;========================================
        ;; 编辑器设定
        ;;========================================
      
        ;;不生成临时文件
        ;;(setq-default make-backup-files nil)
      
        ;;只渲染当前屏幕语法高亮，加快显示速度
        (setq lazy-lock-defer-on-scrolling t)
        (setq font-lock-support-mode 'lazy-lock-mode)
        (setq font-lock-maximum-decoration t)
      
        ;;将错误信息显示在回显区
        (condition-case err
            (progn
            (require 'xxx) )
          (error
           (message "Can't load xxx-mode %s" (cdr err))))
      
        ;;使用X剪贴板
        (setq x-select-enable-clipboard t)
        ;;设定剪贴板内容格式    适应Firefox
        (set-clipboard-coding-system 'ctext)
      

帮助系统
===================
    使用Emacs的过程中，您随时可以获取帮助

    *M-x help-with-tutorial* 
        **C-h t** Emacs快捷指南

    *M-x info-emacs-manual*
	**C-h r** Emacs使用手册

    *M-x info* 
        **C-h i** 在线帮助



    其它

    ========    ========================    ===================
    C-h a       M-x apropos-command         搜索命令
    C-h f       M-x describe-function       函数说明
    C-h v       M-x describe-variable       变量说明
    C-h k       M-x describe-key            键绑定说明
    C-h c       M-x describe-key-briefly    键绑定说明
    C-h w       M-x where-is                查找键绑定
    ========    ========================    ===================

    - 使用帮助时，可能会分割出其它窗格。 **C-x 1** 关闭其它窗格 详见 窗格和缓冲区管理_
    

基本操作
=======================
    针对文件及编辑器的一些操作，绝大多数软件中，这类操作都安排在 *文件* 菜单里面。

    ============================ =============================== =======
    **C-x C-c**                  M-x save-buffers-kill-emacs     保存退出   
    **C-x C-z**                  M-x iconify-or-deiconify-frame  挂起（最小化）
    \	                        
    --------------------------------------------------------------------
    **C-x C-f**                  M-x find-file                   打开文件、目录
    **C-x C-r**                  M-x find-file-read-only         以只读模式打开
    **C-x i**                    M-x insert-file                 插入文件
    \	                        
    --------------------------------------------------------------------
    **C-x C-s**                  M-x save-buffer                 保存
    **C-x s**                    M-x save-some-buffers           询问，保存所有未保存的缓冲区
    **C-x C-w**                  M-x write-file                  另存为文件
    \	                        
    --------------------------------------------------------------------
    **C-x RET f <coding> RET**   略……                            以指定编码保存文件
    \                            M-x revert-buffer               恢复到原始状态
    ============================ =============================== =======


数字参数
===================
    Emacs中可以使用 *Ctrl+u* 向命令传递参数。
        例如用数字作为参数，指定命令运行的次数

    **C-u <#> <command>**   
        M-x universal-argument （通用参数）

    例如： 
    ::

        C-u 10 C-f               向前10个字符
        C-u 10 M-x forward-char  


    **M-<#> <command>** 
        negative-argument （负参数）

    **M-[1-9]** 快速参数
        digit-argument （数字参数）



基础编辑
==============	
    几乎所有编辑器都具有的基础功能。
        这里只是一个列表，更详细的介绍，请参阅《Emacs 快捷指南》 **C-h t**

    使用Readline控件的程序，例如 *bash* ；以及其它使用Emacs风格键绑定的程序，也使用基本相同的功能键。
        如果熟悉 *bash* 的快捷键，这些绑定您一定驾轻就熟：）



浏览
-----------------------

    ========== ============ ============ =======================  =======================
    \           向前          向后         向下                      向上
    ---------- ------------ ------------ -----------------------  -----------------------
    字符        **C-f**      **C-b**      **C-n**                  **C-p**        
    单词        **M-f**      **M-b**
    行          **C-a**      **C-e**      移动到行首或行尾，不能跨行
    ---------- ------------ ------------ ------------------------------------------------ 
    句          **M-a**      **M-e**
    段落        **M-{**      **M-}**
    缓冲区       **M-<**      **M->**      移动到缓冲区起始或结束
    ---------- ------------ ------------ ------------------------------------------------ 
    \
    -------------------------------------------------------------------------------------
    卷屏                                  **C-v**                  **M-v**
    ---------- ------------ ------------ -----------------------  -----------------------
    \  
    -------------------------------------------------------------------------------------
    \
    -------------------------------------------------------------------------------------
    行号        **M-g g**    **M-g M-g**  M-x goto-line            按行号跳转       
    字符位置                               M-x goto-char            按字符跳转
    ========== ============ ============ =======================  =======================
    
|
 
    其它：

    **C-M-l** *M-x reposition-window*
        将当前行卷至页面中部

    **C-l** *M-x recenter*
        刷新页面，将将当前行卷至页面中部 （使用数字参数指定行）

    **M-r**  *M-x move-to-window-line*
        移动光标至页面中间的行 （使用数字参数指定行）

编辑
-------------------------
    **删除**

    ===== ========= =================  ========================= ========================== 
    \      向前                          向后
    ----- ---------------------------  ----------------------------------------------------
    字符   **C-d**   M-x delete-char    **DEL**                   M-x delete-backward-char
    单词   **M-d**   M-x kill-word      **C-Delete** / **M-DEL**  M-x backward-kill-word
    \
    ---------------------------------------------------------------------------------------
    行     光标至行末                    **C-k**   M-x kill-line     
    ----- ---------------------------  ----------------------------------------------------
    \      整行                         **C-S-backspace**   M-x kill-whole-line
    ----- ---------------------------  ----------------------------------------------------
    \      按表达式删除                  **C-M-k**  M-x kill-sexp
    ----- ---------------------------  ----------------------------------------------------
    区块   **C-w**                          M-x kill-region
    ----- ---------------------------  ----------------------------------------------------
    空白   删除连续空格                       M-x delete-horizontal-space
    ===== ===========================  ====================================================


    .. note:: 上表中 **DEL** 实际按键为 *Backspace* ，PC中只有 *Delete* 键，而没有 *DEL* 键，Emacs把 *Backspace* 映射为 *DEL* 
         
	 *backspace* 实际按键也为 *Backspace* 
	 
	 类似的，Emacs把PC的 *Enter* 键映射为 *RET* ; 而 *RET* 实际为 *C-m*


    可能您注意到了，Emacs进行删除时有两种处理方法， **delete** 和 **kill**  
    
    *kill* 
        比较类似于 *剪切* ，剪切掉的内容被依次放入 *剪切轮环* **kill-ring** ，可以召回。

    *delete* 
        就是 *删除* 了，删除掉的内容并不能召回。但是可以通过 *M-x undo* 撤消删除。

|

    **复制**

    **M-w** *M-x kill-ring-save*
        将内容放入 *剪切轮环* **kill-ring**

|

    **粘贴**

    **C-y** *M-x yank*
        从 *剪切轮环* **kill-ring** 中召回最后一次放入的内容

    **M-y** *M-x yank-pop*
        从 *剪切轮环* **kill-ring** 中按后进先出的顺序，依次召回

        - 这个命令只能在 *M-x yank* 或者 *M-x yank-pop* 之后使用。也就是说，只能 *C-y* 后 *M-y* ， *M-y* 可以连续多次。

|

    **撤消**

    **C-/** *M-x undo*
        撤消之前的修改（\ 浏览_\ 部分的操作不可撤消）。


    **C-_** *M-x undo*

    **C-x u**  *M-x advertised-undo*
        *advertised-unde* 是 *undo* 命令的一个别名

    - 为了减少 undo 的次数，每插入20个字符，视为一个 undo 的单位。    
    
|

    **重做**

    **C-g M-x undo** 
        例如 ``C-g C-/`` ，撤消上一次的 *M-x undo* 。

    - 如果需要更多的 *redo* ，需要安装 **redo.el** 扩展
    
      并在配置文件中添加如下内容
       ::

        ;;---------- redo
	;; 读取扩展
	(require 'redo)
	;; 设置Redo的键绑定
	(global-set-key ( kbd "C-.") 'redo)




区块编辑
--------------------------------  
    关于区块的选择，可以参考 区块选择_ 

    需要补充的是，完成区块选择时，实际定义了两种区块 ：
        下面用 ``-`` 表示普通字符，用 ``X`` 表示被选中的字符。下面两个例子中，标记和光标点的位置相同。


        **连续区块**\ 为标记和光标点之间连续的区块::

	    ---XXXXXXXX
	    XXXXXXXXXXX
	    XXXXXXXXXXX
	    XXXXXXXX---

        **矩形区块**\ 为标记和光标点之间矩形的区块::

	    ---XXXXX---
	    ---XXXXX---
	    ---XXXXX---
	    ---XXXXX---
	    
	- 连续区块能够高亮显示，而矩形区块则是隐含的。
	  
	  下面例子，选中的矩形区块，与第一个例子相同。前面为 *左上-右下* 选择，现在为 *左下-右上* 选择 ::
	
	    --------XXX
	    XXXXXXXXXXX
	    XXXXXXXXXXX
	    XXX--------
	

    ========== ============================== ====================================
       连续区块
    ------------------------------------------------------------------------------
    C-SPC      M-x set-mark-command           在光标点处设置标记
    C-@        同上                            建议使用 `C-z`_
    M-@        M-x mark-word                  在单词结尾处设置标记
    M-h        M-x mark-paragraph             选中段落
    \          M-x mark-end-of-sentence       在句末设置标记
    C-x h      M-x mark-whole-buffer          整个缓冲区
    C-x C-x    M-x exchange-point-and-mark    交换标记和光标点
    \
    ------------------------------------------------------------------------------
    C-w        M-x kill-region                剪切区块
    M-w        M-x kill-ring-save             复制区块
    C-y        M-x yank                       粘贴区块
    M-y        M-x yank-pop                   轮环粘贴
       矩形区块
    ------------------------------------------------------------------------------
    C-x r k    M-x kill-rectangle             删除矩形区块
    C-x r y    M-x yank-rectangle             粘贴上一次删除的矩形区块
    C-x r t    M-x string-rectangle           用指定字符填充
    C-x r o    M-x open-rectangle             用空格插入
    C-x r c    M-x clear-rectangle            用空格填充
    \
    ------------------------------------------------------------------------------
    C-x r r    M-x copy-rectangle-to-register 拷贝到寄存器中
    ========== ============================== ====================================

    * **C-x r y** 粘贴时，召回的矩形区块，左上角对齐光标点

    - 矩形区块的标记和光标点，水平位置相同时，矩形区块是一条垂线。
        + 插入时，可直接使用 **C-x r t** 填充这条垂线，后两条命令根本用不到

    * 矩形区块经过的行，如果行尾在区块左侧，则行尾和区块之间的部分将强制填充。



搜索和替换
------------------------
    Emacs中，默认使用 **增量搜索** ：在搜索对话模式中输入关键词的同时，Emacs就开始进行搜索，随着关键字的输入，不断的缩小搜索范围

    而传统的非增量搜索，则是关键词输入后，再进行搜索。

    ========== =================================== ======================  
    增量搜索      
    ---------------------------------------------------------------------
    C-s        M-x isearch-forward                 向前增量搜索
    C-r	       M-x isearch-backward                向后增量搜索
    C-M-S      M-x isearch-forward-regexp          正则表达式向前增量搜索
    C-M-r      M-x isearch-backward-regexp         正则表达式向后增量搜索
    询问替换    
    ---------------------------------------------------------------------
    M-%	       M-x query-replace                   询问替换
    C-M-%      M-x query-replace-regexp            正则表达式询问替换  
    搜索         
    ---------------------------------------------------------------------
    \	       M-x search-forward                  向前搜索
    \	       M-x search-backward                 向后搜索  
    \	       M-x search-forward-regexp           正则表达式向前搜索  
    \	       M-x search-backward-regexp          正则表达式向后搜索  
    替换         
    ---------------------------------------------------------------------
    \          M-x replace-string                  替换
    \	       M-x replace-regexp                  正则表达式替换
    ========== =================================== ======================  

    - 增量搜索时，关键词会被一直保留。可以直接进行下一次搜索
    - 下一次增量搜索，如果之前进行了其它操作，则需要连续两次命令（快捷键），才能召回关键词。

      + 因为这种情况下，您很有可能是希望以其它关键词进行搜索
      + 同样的，没有搜索到关键词时，第一次取消，您可以重新输入关键词，连续取消两次才能取消这次搜索

    + **C-g** 取消搜索，回到搜索前的位置
    + **RET** 结束搜索，停在当前位置

      - 我倾向于使用方向键 *C-b* 结束搜索。拼音文字中，使用 *M-b* 或者 *M-DEL* 最好

    * 可以选中区块后，在区块内进行替换

其它
-----------
    **插入控制字符**

    使用 **C-q** ，可以在缓冲区插入一个控制字符。例如 *C-q C-m* = ``^M`` 

|

    **文本换位**

    ====== ============ =====================================
    字符    C-t          M-x transpose-chars
    单词    M-t          M-x transpose-words
    行      C-x C-t      M-x transpose-lines
    ====== ============ =====================================

|

    **将TAB字符转换为空格**
    
    选中需要转换的区域， *M-x untabify*

|

    **对齐文本块**
    
    选中需要对齐的区域， *M-x indent-region*


窗格和缓冲区管理
===============================
    **多窗格**

    =============== ================================ ======================================================
    C-x 2 	    M-x split-window-vertically      分隔出两个垂直窗格，水平分隔线
    C-x 3	    M-x split-window-horizontally    分隔出两个水平窗格，垂直分隔线
    C-x 1	    M-x delete-other-window          只保留当前窗格
    ESC ESC ESC	    M-x keyboard-escape-quit         同上
    C-x 0	    M-x delete-window                关闭当前窗格
    C-x o	    M-x other-window                 在下一个窗格中激活光标
    C-M-v	    M-x scroll-other-window          向下卷动下一个窗格，使用负参数可以向上卷动
    =============== ================================ ======================================================

    - *下一个窗格* 垂直分隔，则先左后右；水平分隔，则先上后下。如果窗格还有子窗格，则先遍历其子窗格后，再遍历其它窗格，以此递归。


|


    **多缓冲区**
       Emacs中，打开新的缓冲区，原有缓冲区并不会关闭

    =========== ====================== ===================
    C-x C-b     M-x list-buffers       查看缓冲区列表
    C-x b       M-x switch-to-buffer   切换到其它缓冲区
    C-x k       M-x kill-buffer        关闭当前缓冲区
    =========== ====================== ===================
   
    - 切换到其它缓冲区时，默认上一次使用的缓冲区。尽量用 *TAB* 补全
    - 使用多窗格时，缓冲区操作只对当前窗格有效
    - 建议使用 **ibuffer.el** 这个扩展。 Emacs自带，在配置文件中添加如下语句 ::

       ;;========== ibuffer
       (require 'ibuffer)
       (global-set-key ( kbd "C-x C-b ")' ibuffer)

    - 这一个缓冲区列表的扩展效果稍差，不过还不错。Emacs自带 ::

       ;;CRM bufer list
       (global-set-key "\C-x\C-b" 'electric-buffer-list) 


寄存器管理
======================
    寄存器用于存贮内容，在需要时取出，插入缓冲区。
    
    Emacs的寄存器使用\ **单个字符**\ 命名，可以存贮两种内容 ：

    **光标位置和窗口状态**
    
    ============================== ============================================= ================================
    C-x r SPC <寄存器名>            M-x point-to-register                          存贮光标位置
    C-x r w <寄存器名>              M-x window-configuration-to-register           保存当前窗口状态
    C-x r f <寄存器名>              M-x frame-configuration-to-register            保存所有窗口状态
    C-x r j <寄存器名>              M-x jump-to-register                           光标跳转
    C-x j <寄存器名>                略……                                          同上
    ============================== ============================================= ================================

    **文本和数字**

    ================================ ================================ ================================
    C-x r s <寄存器名>                M-x copy-to-register             将连续区块拷贝到寄存器中
    C-x r r <寄存器名>                M-x copy-rectangle-to-register   将矩形区块拷贝到寄存器中
    C-u <数字> C-x r n <寄存器名>      M-x number-to-register           将数字拷贝到寄存器中
    C-x r i <寄存器名>                M-x insert-register              在缓冲区中插入寄存器内容
    ================================ ================================ ================================

    - M-x view-register    查看寄存器内容
    - **M-x list-registers**   查看寄存器列表
    - 寄存器中的矩形区块，以矩形区块的方式插入到缓冲区中。 见 区块编辑_
    - 也可以将文件插入到寄存器中 **(set-register ?<寄存器名称> '(file . <文件名>))** ，示例 ::

        M-x lisp-interaction-mode 进入交互模式，输入如下Lisp代码：
        (set-register ?e '(file . "~/.emacs"))<光标>移动此外， C-j 求值。
	M-x list-registers 查看寄存器列表，多了寄存器 e ： Register e contains the file "~/.emacs".



    
书签管理
=====================
    Emacs可以在当前位置创建一个书签，以便能够快速的返回。 
    
    与存储光标位置的寄存器略有不同
        - 书签可以使用单词来命名，而不限于一个字符。起一个容易记住的名字
	- 退出Emacs后，书签不会消失，下次还可以使用
	
    =============== ============================ =======================
    C-x r m <name>  M-x bookmark-set		 设置书签
    C-x r b <name>  M-x bookmark-jump		 跳转到书签
    C-x r l         M-x bookmark-bmenu-list	 书签列表
    \               M-x bookmark-delete		 删除书签
    \               M-x bookmark-load		 读取存储书签文件
    =============== ============================ =======================

        - 书签默认存储在 **~/.emacs.bmk** 文件中
	- 在配置文件中，可以设置书签存储的文件 ::

	    ;; 书签文件的路径及文件名
	    (setq bookmark-default-file "~/.emacs.d/.emacs.bmk")

	    ;; 同步更新书签文件 ;; 或者退出时保存
	    (setq bookmark-save-flag 1)


Shell模式
============================
    **M-x shell** 进入Shell模式，可以完成一些简单的工作。不过有些情况下，输出会有一些问题

    事实上，这是Emacs自带的终端。它与 *bash* 和 *sh* 的兼容比较好，而 *fish* 之类比较现代的Shell，在Emacs终端里的效果则很差

    需要注意的是， *readline-bash* 的绑定 **C-p** **C-n** ，在Emacs终端需要使用 **M-p** **M-n** 。其它的键绑定，也以Emacs为准




宏
===============
    记录一系列的操作，在需要的时候，运行一遍

|

    例如给一个单词加 ``"`` ，可以分解为以下操作:
     | M-b 移动到词首
     | "
     | M-f 移动到词尾
     | "

    如果要给一个词加上 ``"`` ，只要定位到这个词，运行上面的宏就可以了。     

    当然，这只是最简单的宏。结合正则表达式进行匹配，以宏进行操作，可以完成许多复杂的操作

定义与运行
------------------------------

    **C-x (**  *M-x kmacro-start-macro*    **F3**  *M-x kmacro-start-macro-or-insert-counter*
	开始录制宏

    **C-x )**  *M-x kmacro-end-macro*
	结束录制

    **F4** *M-x kmacro-end-or-call-macro*
	播放刚录制的宏； 如果正在录制宏， *F4* 为结束录制。

    **C-x e**  *M-x kmacro-end-and-call-macro*
	播放宏




宏轮环
------------------
    与 *剪切轮环* 类似，Emacs中也有 *宏轮环* 的概念： 当一个新的宏被定义，原有的宏并不消失，只是在宏轮环中的位置被挤到后面。

    **C-x C-k**
	进入宏轮环，以下的操作可以在宏轮环中连续进行，例如：

	*C-x C-k C-p C-p C-k C-k C-k C-n C-n C-k C-p C-k C-d*

    **C-x C-k C-n**  *M-x kmacro-cycle-ring-next*
	在宏轮环中下翻一个宏

    **C-x C-k C-p**  *M-x kmacro-cycle-ring-previous*
	在宏轮环中上翻一个宏

    **C-x C-k C-d**  *M-x kmacro-delete-ring-head*
	在宏轮环中删除一个宏

    **C-x C-k C-k**  *M-x kmacro-end-or-call-macro-repeat*
	直接运行宏轮环中当前的宏



命名与保存
--------------------------------

    **C-x C-k n <name>**  *M-x kmacro-name-last-macro*
	命名最后一个宏

    **C-x C-k b**  *M-x kmacro-bind-to-key*
	绑定最近的一个宏。 （执行时需要 *C-x C-k* 作为按键序列的前缀）

    **M-x insert-kbd-macro** 
	使用Lisp代码在缓冲区中插入宏定义 

	- 保存为文件，使用 *M-x load-file* 加载
	- 保存到配置文件中，启动时加载





宏编辑器
--------------------------

    **C-x C-k C-e**  *M-x kmacro-edit-macro*
        使用宏编辑器打开最后一个宏

    **C-x C-k e**   *M-x edit-kbd-macro*
	编辑指定名称的宏

    **C-x C-k l**   *M-x kmacro-edit-lossage*
	编辑将最后100步键盘操作（不能包含鼠标操作）




询问执行
------------------------------------
        
    **C-x q** *M-x kbd-macro-query*
	在播放宏时，将进行询问确认

    
计数器
-------------------
    记录宏的执行次数

    **C-x C-k C-i**    *M-x kmacro-insert-counter*
        将宏计数器的数值插入缓冲区

    **C-x C-k C-c**  *M-x kmacro-set-counter*
        为宏计数器设置一个数值

    **C-x C-k C-a**   *M-x kmacro-add-counter*
        给宏计数器添加一个前缀参数

    **C-x C-k C-f**    *M-x kmacro-set-format*
        给宏计数器指定一个将要插入的特殊值

文件管理
===============================
    Emacs提供了 *Dired* 模式来管理文件系统，并且允许使用多个缓冲开启多个 *Dired* 。您可以使用以下命令进入：

    **C-x d** *M-x dired*
        进入Dired列表模式

    **C-x C-d** *M-x list-directory*
        获取文件列表（简洁）

    **C-x C-f** *M-x find-file*
        打开文件，没有文件名则打开目录


使用帮助
----------------------
    **?** *M-x dired-summary*
        简单帮助 （回显区）

    **h** *M-x describe-mode*
        模式帮助

查看
----------------
    
     =================  ====================  =====================
     \                   向下                    向上                
     文件                 n                      p                   
     \                   C-n                    C-p                 
     \                   SPC                                        
     目录                 >                      <                   
     已标记               M-}                    M-{                 
     刷新                 M-G                   *M-x revert-buffer*               
     =================  ====================  =====================

标记
---------------


m                  标记文件，下移一行 [p]
u                  去掉标记，下移一行 [p]
U                  去掉缓冲中所有的标记
M-Backspace        去掉缓冲中所有的某个标记，缺省为 * 标记
Backspace          并去掉上一行标记，并上移一行 [p]
t                  标记/未标记互换
D                  删除所有标记的文件/目录 [*]

d                  设置“删除标记”（字符D），并且光标下移一行 [p]
x                  删除用 d 标记的文件/目录

~                  将缓冲中备份文件做删除标记 [u]
&                  没用的文件，做删除标记
#                  将缓冲中自动保存的文件做删除标记 [u]
.                  按备份文件版本，将备份文件做删除标记 [u]

% g                标记所有“含有”regexp 的文件 [u]

\* *                标记所有可执行文件 [u]
\* .                标记所有同扩展名文件 [ux]
\* /                标记所有目录 [u]
\* @                标记所有符号连接 [u]
\* c                改变标记的符号
\% d                通过匹配 regexp 标记删除
\% m                通过匹配 regexp 标记 [u]

M-(                通过 sexp 标记 [x]
                   比如 (> size 1024) 标记所有大于 1k 的文件；
                   (and (> size 2048) (equal uid "spr")) 标记所有大于 2k 的用户 spr 的文件。
                   可用的变量有：

                     inode [整数值] 文件的 inode；
                     s     [整数值] 以块为单位的文件大小；
                     size  [整数值] 以字节为单位的文件大小；
                     nlink [整数值] 以连接到文件的个数；
                     uid   [字符串] 用户名；
                     gid   [字符串] 用户组名；
                     time  [字符串] buffer 中的时间串；
                     mode  [字符串] 权限模式串，比如 "-rw-r--r--"；
                     name  [字符串] 文件名；
                     sym   [字符串] 连接指向的文件名。



扩展管理
=======================
主模式



Guns
========


web
====================


ftp
==============
x

<?xml version="1.0" encoding="utf-8"?>
<!-- Created by Leo: http://leoeditor.com/leo_toc.html -->
<leo_file xmlns:leo="http://leoeditor.com/namespaces/leo-python-editor/1.1" >
<leo_header file_format="2" tnodes="0" max_tnode_index="0" clone_windows="0"/>
<globals body_outline_ratio="0.5" body_secondary_ratio="0.5">
	<global_window_position top="50" left="50" height="500" width="700"/>
	<global_log_window_position top="0" left="0" height="0" width="0"/>
</globals>
<preferences/>
<find_panel_settings/>
<vnodes>
<v t="ahshoe.20161120121808.1"><vh>@settings</vh>
<v t="ahshoe.20170315212615.1"><vh>@data qt-gui-plugin-style-sheet</vh></v>
<v t="ahshoe.20170315212626.1"><vh>@string initial_split_orientation = horizontal</vh></v>
</v>
<v t="40323230.20170123213451.1"><vh>@button Report pdf</vh></v>
<v t="yen.20170429132400.1"><vh>協同著作規劃</vh></v>
<v t="leo.20171218141522.1"><vh>報告章節規劃</vh></v>
<v t="yen.20170429103742.1" a="E"><vh>@path ./../</vh>
<v t="yen.20170429103940.1" a="E"><vh>@path markdown</vh>
<v t="ahshoe.20170322182713.1"><vh>@edit reference.md</vh></v>
<v t="ahshoe.20170322181453.1"><vh>@edit refer.bib</vh></v>
<v t="leo.20171119234752.1" a="E"><vh>封面以及摘要</vh>
<v t="ahshoe.20161120122151.1" a="E"><vh>@clean cover_and_abstract.md</vh>
<v t="ahshoe.20170317115820.1"><vh>摘要</vh></v>
</v>
</v>
<v t="leo.20171119234822.1" a="E"><vh>各章節內容</vh>
<v t="yen.20170429214845.1" a="E"><vh>@path paragraph</vh>
<v t="yen.20170429214838.1" a="E"><vh>@clean introduction.md</vh>
<v t="yen.20170429214838.3"><vh>前言內容</vh></v>
</v>
<v t="yen.20170429215041.1" a="E"><vh>@clean portable_system.md</vh>
<v t="leo.20180107001845.1"><vh>內文</vh></v>
</v>
<v t="yen.20170429215252.1" a="E"><vh>@clean python_introduction.md</vh>
<v t="leo.20180107002008.1"><vh>Python 程式語法介紹</vh></v>
<v t="yen.20170429215308.1"><vh>Python 程式語法介紹</vh></v>
<v t="leo.20180107002707.1"><vh>Python 程式語法介紹</vh></v>
<v t="leo.20180107002956.1"><vh>Python 程式語法介紹</vh></v>
<v t="leo.20180107003058.1"><vh>Python 程式語法介紹</vh></v>
<v t="leo.20180107003204.1"><vh>Python 程式語法介紹</vh></v>
<v t="leo.20180107003325.1"><vh>Python 程式語法介紹</vh></v>
</v>
<v t="yen.20170429215416.1" a="E"><vh>@clean pyqt5_introduction.md</vh>
<v t="yen.20170429215446.2"><vh>PyQt5 語法介紹</vh></v>
</v>
<v t="yen.20170429215617.1" a="E"><vh>@clean calculator.md</vh>
<v t="yen.20170429215851.1"><vh>計算機程式內容</vh></v>
</v>
<v t="yen.20170429215922.1" a="E"><vh>@clean discussion.md</vh>
<v t="leo.20180106163058.1"><vh>程式開發心得</vh></v>
</v>
<v t="yen.20170429220128.1" a="E"><vh>@clean results.md</vh>
<v t="yen.20170429220137.1"><vh>期末報告結論</vh></v>
</v>
<v t="yen.20170429220335.1" a="E"><vh>@clean appendix.md</vh>
<v t="yen.20170429220335.2"><vh>附錄</vh></v>
</v>
</v>
</v>
</v>
</v>
</vnodes>
<tnodes>
<t tx="40323230.20170123213451.1">@language python
filename = "report"
import os, platform
# 更換目錄到 markdown 
os.chdir("./../markdown")

# 若在 Linux 環境則使用 ukai.ttc 系統字形
if platform.system().lower()=="linux": font = "ukai.ttc"
# 在 windows 環境使用 SimSun 字形
elif platform.system().lower()=="windows": font = "SimSun"
else: font = "Arial"
fontsize = "12"
margin = "1in"
# --pdf-engine 使用 xelatex
# lang 請參照 https://tools.ietf.org/html/bcp47, 這裡的 zh-cmn 為 Mandarin Chinese 國語
# -V lang=zh-cmn 為一組 key=value 對應的 Variable 設定
# -N 表示 Number section headings in LaTeX, ConTeXt, HTML, or EPUB output. By default, sections are not numbered.
settingFlag = "--pdf-engine=xelatex -V lang=zh-cmn -N --toc --highlight-style kate -V documentclass=report  --filter pandoc-fignos --filter pandoc-tablenos --template=template.tex -V \"CJKmainfont:{0}\" -V fontsize={1}pt -V geometry:margin={2} --bibliography=refer.bib --csl=ieee.csl".format(font, fontsize, margin)
g.es("---Pandoc---")

# 選擇所要納入的 Markdown 檔案, 不納入的檔案名稱前方加上  # 即可
chapter_list = " ".join("./paragraph/" + i for i in [
"introduction.md",
"portable_system.md", 
"python_introduction.md", 
"pyqt5_introduction.md", 
"calculator.md", 
#"discussion.md", 
"results.md", 
])

# 若系統並未正確轉檔, 可以將 os.system 改為 g.es 表示要使用 Leo Editor 的 global 物件中的 echo string 將指令印在 log 區
# 然後複製指令, 然後在命令列視窗中的 markdown 目錄中執行, 就可以得到錯誤訊息
# 或許可以再從 https://stackoverflow.com/questions/26005583/return-value-of-x-os-system 中的建議改進此一指令
g.es(os.system("pandoc cover_and_abstract.md " + chapter_list + " reference.md -o ../pdf/report.pdf {}".format(settingFlag)))
g.es("pandoc cover_and_abstract.md " + chapter_list + " reference.md -o ../pdf/report.pdf {}".format(settingFlag))
g.es("PDF 轉換完畢")
g.es('-'*12)</t>
<t tx="ahshoe.20161120121808.1"></t>
<t tx="ahshoe.20161120122151.1">---
university_zh: '國立虎尾科技大學'
institute_zh: '機械設計工程系'
category_zh: '電腦輔助設計實習 ag6 期末報告'
title_zh: '鋼球運動機構設計-球哥'
title_en: 'marble machine design'
author:
- 設計二甲 40523125 張志雲
- 設計二甲 40523126 張博鈞
- 設計二甲 40523127 張皓然
- 設計二甲 40523134 陳鵬暉
- 設計二甲 40523135 湯科爾
- 設計二甲 40523136 黃胤瑋
advisor_zh: '嚴家銘'
date: '2017.12.21'
---

@others
</t>
<t tx="ahshoe.20170315212615.1">QTreeWidget {
    /* These apply to the selected item, but not to editing items.*/
    background-color: #ffffec; /* Leo's traditional tree color */
    selection-color: black; /* was white */
    selection-background-color: lightgrey;
    /* font-family: SansSerif; */
    /*font-family: DejaVu Sans Mono;*/
    font-family:YaHei Mono;
    /* 標題字型大小設定 */
    font-size: 20px;
    font-weight: normal; /* normal,bold,100,..,900 */
    font-style: normal; /* normal, italic,oblique */
 }

/* Headline edit widgets */
QTreeWidget QLineEdit {
    background-color: cornsilk;
    selection-color: white;
    selection-background-color: blue;
    /*font-family: DejaVu Sans Mono;*/    
    font-family:YaHei Mono;
    /* 沒有特別對應字型大小 */
    font-size: 20px;
    font-weight: normal; /* normal,bold,100,..,900 */
    font-style: normal; /* normal, italic,oblique */
}

/* The log panes */
QTextEdit {
    background-color: #f2fdff;
    selection-color: red;
    selection-background-color: blue;
    /* font-family: Courier New; */
    font-family:YaHei Mono;
    /* log font 大小 */
    font-size: 20px;
    font-weight: normal; /* normal,bold,100,..,900 */
    font-style: normal; /* normal, italic,oblique */
}

/* The body pane */
QTextEdit#richTextEdit {
    background-color: #fdf5f5; /* A kind of pink. */
    selection-color: white;
    selection-background-color: red;
    /*font-family: DejaVu Sans Mono;*/
    /* font-family: Courier New; */
    font-family:YaHei Mono;
    /* 內文字型大小 */
    font-size: 20px;
    font-weight: normal; /* normal,bold,100,..,900 */
    font-style: normal; /* normal,italic,oblique */
}

QLabel {
    font-family:YaHei Mono;'CherryPy', 'pytz', 'mako', 'beautifulsoup4', 'pymysql', 'peewee'
    /* 下方的 Minibuffer 標題字型大小 */
    font-size: 20px;
    font-weight: normal; /* normal,bold,100,..,900 */
    font-style: normal; /* normal,italic,oblique */
}

/* Editor labels */
QLineEdit#editorLabel {
    background-color: #ffffec;
    font-family:YaHei Mono;
    /* 沒有直接對應字型大小 */
    font-size: 20px;
    font-weight: normal; /* normal,bold,100,..,900 */
    font-style: normal; /* normal,italic,oblique */
    border: 2px;
    margin: 2px;
}</t>
<t tx="ahshoe.20170315212626.1">horizontal: body pane to the left
vertical: body pane on the botton</t>
<t tx="ahshoe.20170317115820.1">---
abstract: |
    這裡是摘要內容。.
    

    
    本研究的重點在於如何通過繪圖軟體設計出鋼球運動機構
    
    
    首先我們從網路上尋找到了適合的
    參考機構(marble machine etagen)，通過小組討論決定後,組員利
    用Solvespace畫出機構運動的方式機算出連桿的尺寸比例以及每一
    個階梯小球提升的高度，成功劃出可以讓鋼球上升的機構後我們利
    用Onshape畫出機構的實體以及每個組員的軌道，最後用V-rep模擬
    出鋼球運動系統。
    我們的機構叫做階梯式抬球機構
    利用馬達作動傳動帶動連桿再透過
    桿件之間的干涉使得我們的升降機構上下交互將小球從低處運至高
    處
---


</t>
<t tx="leo.20171119234752.1"></t>
<t tx="leo.20171119234822.1"></t>
<t tx="leo.20171218141522.1">標題頁 - 含報告標題、作者、日期與所屬單位
目錄 - 列出全文章節與所屬頁面連結
摘要 - 解釋報告編寫動機、報告重點、結論、建議與關鍵字

前言 - 簡要描述全文意旨與背景, 說明報告目標與報告內容組成架構

內文 - 依照章節標題, 詳細說明報告內容, 包括方法、操作步驟與所得結果的詳細說明

結論 - 條列所獲致的重要成果, 與摘要及導言中的目標互相呼應

討論與建議 - 說明後續值得進行的方向、方法與可能遭遇問題的討論

參考 - 詳列所引用的參考內容

附錄 - 附加值得參考的詳細內容</t>
<t tx="leo.20180106163058.1">個人軌道和心得
</t>
<t tx="leo.20180107001845.1">研究目的
---
希望大家閱讀此報告後，對鋼球運動機構的設計與組裝產生興趣，且有更進一步的認知，也可以自行獨立設計與完成心目中理想的鋼球運動機構。也希望藉由本報告，可以把我們所遇過的一些問題及解決方法提供給大家，大家在閱讀後能快速的解決問題及找到正確的解決方法。
    
本專題研究目的是作為鋼球運動機構應用，實務上可以延伸應用作為進階的產線自動化工具機與各式需使用電器裝置等設備有效的使用。



![01][]

稱為圖 {@fig:駱駝}。


[01]: ./images/01.jpg {#fig:駱駝}

這個機構是利用連桿的原理讓球一階一階的往上升




</t>
<t tx="leo.20180107002008.1">研究設備及器材
---

一、	軟體
以下是本鋼球機構所使用到的軟體及其詳細的介紹。
(一)	SolveSpace
此程式是目前我們進行機構模擬前期的測試系統，這系統相較其他大型的繪圖軟體來說更佳的容易攜帶，非常適合我們設計機構前期的桿件模擬，會使用此軟體也是因為老師的推薦，過程中我們利用此軟體，將我們的構想轉為機構圖，在經過一次次嘗試確認無誤後，最後才依依將零件放置在機構圖

有一張圖片：

![02][]

稱為圖 {@fig:駱駝}。



[02]: ./images/02.jpg {#fig:駱駝}

</t>
<t tx="leo.20180107002707.1">研究設備及器材
---

3D列印
抬球機構以及運球軌道，都是由3D列印機製作而成，製作出得成品比起木板，較為美觀且具有未來科技感，能將Onshape立體圖轉檔成STL檔案，載入印表機當中，用ABS線一層層堆疊列成實體。
三、伺服馬達伺服馬達介紹
本專題製作報告採用的伺服機為MG996如圖3
伺服機的動作原理如 圖5 ，輸入PWM控制訊號給控制電路板，控制電路板會依照輸入的PWM訊號所對應之角度與目前馬達角度做比較並驅動DC  馬達政轉或反轉，馬達轉動帶動變速齒輪組轉動，控制電路板的可變電阻旋鈕嵌入變速齒輪下方，變速齒輪轉動使可變電阻駔值大小改變，控制電路板利用可變電阻的分壓得知道目前轉動角度，繼續驅動馬達直到轉動到設定角度才停止，並持續做角度控制。更高階的伺服馬達可直接將主軸角度資料傳出，回授方式不會採用可變電阻分壓方式，會使用更精準的量測方式做回授，例如光學旋轉編碼器。

![03][]

稱為圖 {@fig:駱駝}。


[03]: ./images/03.jpg {#fig:駱駝}

</t>
<t tx="leo.20180107002956.1">研究設備及器材
---

![04][]

稱為圖 {@fig:駱駝}。



[04]: ./images/04.jpg {#fig:駱駝}

</t>
<t tx="leo.20180107003058.1">研究設備及器材
---

伺服馬達使用程式語言【Ａｒｄｕｉｎｏ】
Ａｒｄｕｉｎｏ是一種開放式的硬體與軟體，軟體的開發環境可在網路上免費下載，而網路上也有許多Arduino的作品程式可以參考，並依據自身之需求進行修改，且價格並不會太高。其特色如下：
→　入門簡單：程式操作並不困難，只需要電學基礎就可輕鬆操作。
→　彈性設計：可依自身需求修改、設計出自己所需的程式。
→　應用地方多：程式可以應用在馬達控制、遠端遙控等..許多地方。
→　購買管道多：許多電子材料行、網購、拍賣網都可購買的到。
伺服馬達控制模擬
為了在實體 Arduino Uno 控制板連線操作之前, 可以利用網際 Auduino 控制板與電子元件系統進行模擬, 我們在Autodesk Tinkercad進行模擬
選擇 Arudino Uno 控制板與 Servo Motor, 然後接上電源與地線, 並將控制訊號接到 Auduino Uno 控制板的 PWM pin 9, 利用 Code Editor 納入下列 Arduino 程式, 再利用 upload and run 將程式編譯後上傳到虛擬的 Arduino Uno 控制板上執行, 就可以模擬 Servo Motor 持續左右各旋轉 180 度. 操畫面如下圖所示: 

![05][]

稱為圖 {@fig:駱駝}。



[05]: ./images/05.png {#fig:駱駝}
</t>
<t tx="leo.20180107003204.1">研究設備及器材
---

完成上述以 TinkerCAD 模擬伺服馬達的接線與程式執行之後, 接著操作實體 Arduino 控制板與 Servo Motor 的控制, 首先利用電腦驅動 Arduino 控制板, 然後再利用板子上的脈衝寬度調變 (PWM, Pulse Width Modulation) 訊號控制伺服馬達, 之後再利用傳動機構與資訊控制介面, 製作所需的機電資整合系統. 電子電機系統除了可以方便感測各種物理化學量外, 還能夠快速傳遞感測與命令訊號, 而機械系統則透過機構元件的組合, 扮演傳遞功率致動或抵抗外力撞擊與疲勞破壞的角色, 至於資訊系統則用來整合各種資訊, 用更友善的人機介面, 讓使用者更有效能地運用機電資系統產品.</t>
<t tx="leo.20180107003325.1">研究過程或方法
---

![06][]

稱為圖 {@fig:駱駝}。



[06]: ./images/06.jpg {#fig:駱駝}

 整個製作流程先設計完整體架構後，再用Oshape畫出零件圖進行組裝確認無誤後，再將零件工作圖轉為STL檔，到 V-rep進行動態模擬，完成後再進行TinkerCAD 模擬伺服馬達的接線與程式，確定無誤後3D列印進行軌道製作，列印完後再進行組裝，最後將程式輸入，訊號線互相連好，就可進行鋼球循環運動了。</t>
<t tx="yen.20170429103742.1"></t>
<t tx="yen.20170429103940.1"></t>
<t tx="yen.20170429132400.1">每一位協同人員各在 users 目錄中建立一個 .leo 檔案

各自選擇要編輯的 .md 檔案, 可以使用 @edit 或 @clean 節點編輯指令

除非必要否則不更動 markdown 目錄下的 template.tex 檔案</t>
<t tx="yen.20170429214838.1">前言
===

計算器程式期末報告前言

@others</t>
<t tx="yen.20170429214838.3">前言內容。

\ 
一、研究背景與動機
撰寫這份報告的目的在於使用簡報的方式讓別人能夠了解我們這組是如何設計 出機構的以及如何使用本學期所學的工具成功模擬出小鋼球在機構和軌道中的運 動狀況 在簡報中會有我們這組的製作過程，會介紹我們是從哪裡找尋設計機構的參考和 設計過程中所遇到的問題以及解決辦法和最後的結論

二、報告架構
本報告將按照下列架構來論述；第一章前言；第二章研究目的；第三章說明設計所有有使用到的軟硬體介紹如伺服馬達、3D列印等…各種設備設計運球機構所牽涉到的軟體亦將在此一併介紹；第四章為研究過程及方法，分別對台球機構的製作流程以圖表搭配文字來達到更清楚的呈現；第五章為研究結果，將完成後比較出此專題所帶來的效益，將完成後與未完成所帶來的差別，第六章為問題與討論，將過程中所遇到的問題與解決方法，依依呈現在報告中，讓大家能看完報告後，不僅僅能對此專題有更深的了解，也能在家試作時能參考我們的報告，進行問題改善；第七章為結論，我們將製作專題過程中所學的一切詳細報告，也介紹了作品未來的發展性。 

\ 


</t>
<t tx="yen.20170429214845.1"></t>
<t tx="yen.20170429215041.1">內文
===

內文

@others</t>
<t tx="yen.20170429215252.1">使用工具
===

使用工具

@others</t>
<t tx="yen.20170429215308.1">研究設備及器材
---

一、(二)	Onshape
此程式目前製圖設計業中逐漸被重視，可以利用此程式來進行零件繪製、模擬組合、動畫製作、立體圖展示等…多方面的用途，會使用此軟體，也是因為此軟體為老師推薦教學的軟體，這程式主打能全雲端繪圖只要有網路就能繪圖，因此在製作專題的過程中，也能藉由上課所學，套用至機構製作當中，過程中我們利用此軟體，將我們的構想轉為立體圖，在經過一次次嘗試組裝確認無誤後，最後才依依將零件放置成零件圖，再轉成STL檔。

V-rep
此程式我們主要是用來進行我們所設計的機構實際的運行情況，這程式我們比較陌生所以花了比較多時間來摸索，但這程式很好用能進行鋼球在我們鋼球運動系統上運行的模擬

</t>
<t tx="yen.20170429215416.1">過程中的問題
===



@others</t>
<t tx="yen.20170429215446.2">過程中的問題

</t>
<t tx="yen.20170429215617.1">解決方法
===

解決方法

@others</t>
<t tx="yen.20170429215851.1">

</t>
<t tx="yen.20170429215922.1">心得
===

期末報告心得

@others</t>
<t tx="yen.20170429220128.1">結論
===

期末報告結論

@others</t>
<t tx="yen.20170429220137.1">結論與建議
---

結論與建議內容





</t>
<t tx="yen.20170429220335.1">
===

@others</t>
<t tx="yen.20170429220335.2">參考資料 https://www.youtube.com/watch?v=HrIfZrDe788
參考資料 http://woodgears.ca/marbles/paul.html</t>
</tnodes>
</leo_file>

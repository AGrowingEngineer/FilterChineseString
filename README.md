# 操作说明  
本文涉及内容如下：  
- 运行环境。   
- 准备工作。   
- 运行程序。   
- 功能一：提取项目中文并去重。   
- 功能二：比较两个xlsx/xls文件，筛选出不同的项。    
- 功能三：把翻译好的xlsx/xls文件转化为strings格式。   

## 1.运行环境
系统：MacOS 10.13.5  
工具：MacOS自带的终端和Python 2.7（或者Python 3），运行Python代码。  
&#8195;&emsp;&emsp;Sublime Text编辑JSON文件。
```
注：请使用系统自带终端，其它版本的终端容易产生错漏。
```
## 2.准备工作
**这里的准备工作要分三种：**
- 第一种：安装Python的第三方支持库  
因为本程序要运用Python来处理xlsx文件的读写操作，所以需要安装xlsxwriter（写操作）和xlrd（读操作）两个Python的第三方库。  
安装方法为：在终端中分别输入```pip install xlsxwriter``` 和 ```pip install xlrd```(如果没有pip命令，请先安装pip。另外，如果装有两个版本的Python，请注意pip的版本问题）。

- 第二种：从项目中获得待提取中文的文件  
首先，在Xcode打开对应的项目。  
接着，如图所示，在左边工具栏选中搜索  
![avatar](http://gitlab.adnonstop.com/Demo/FetchChinese-Debate/raw/master/PicSources/准备工作2.png)  
在搜寻类别中选择 ```Find > Regular Expression```  
在搜索框中输入 ```@"[^"]*[\u4E00-\u9FA5]+[^"\n]*?"``` 按下回车，就能得到全部包含中文的字符串。  
最后，把上面搜索到的结果，全选、复制、保存到txt文件中。  
例如在本项目中，我们提取出来的字符串保存到了```stringFile.txt```文件中。

- 第三种：根据过滤条件，修改```filterCondition.json```文件  
因为经过上面的步骤，获取到的txt文件中包含了很多字符串，有些字符串是我们做国际化的时候不需要的。  
例如，默认我们需要过滤掉NSLog中的字符串和第三方框架（即Pods中的文件）中用到的字符串。  
其他过滤条件则需要根据具体项目，添加具体条件。  
例如，本项目中添加的条件有：  

  1. 需要过滤社交目录下的所有字符串，过滤路径大概是这样  
```"/Users/ruanjian-063/MRSocialContact/xxxxxx"```  
故在json文件中，添加如图所示的路径：  
![avatar](http://gitlab.adnonstop.com/Demo/FetchChinese-Debate/raw/master/PicSources/准备工作3-1.png)   
```注：因为Pods路径下的已默认过滤了，这里不需要再添加。```  
  2. 需要过滤掉一些特定的log方法，添加关键词如图所示：  
![avatar](http://gitlab.adnonstop.com/Demo/FetchChinese-Debate/raw/master/PicSources/准备工作3-2.png)  
需要解析的是```“LogError”```这个关键词：因为本项目中有用到```“SLLogError”``` 和 ```“DDLogError”```两个关键词来打印log，所以根据它们共同性得到了关键词```“LogError”```。  
  3. 需要过滤掉神策统计相关函数方法，添加关键词如图所示：  
![avatar](http://gitlab.adnonstop.com/Demo/FetchChinese-Debate/raw/master/PicSources/准备工作3-3.png)  
解析：```“FCHEvent”```是由函数方法```”[FCHEvent shareInstance].appxxxxxxxxx”```提取而来。  
```“sensorPush”```是由函数方法  
```“[FCHSensorTool sensorPushEventKey:]”``` 和
```“[FCHSensorTool sensorPushEvent:property:]”```提取而来。  
同理，对应不同项目，可以有不同的关键词。  

## 3.运行程序  
经过上面的步骤后，就可以借助终端来运行本程序了。    
首先，运行终端，用cd命令进入到存放本程序Python代码的目录下，如图所示：     
![avatar](http://gitlab.adnonstop.com/Demo/FetchChinese-Debate/raw/master/PicSources/运行.png) 
```
注意这里的2.x和3.x分别对应的是Python的不同版本
```  
接着，键入命令```python MainCode.py```运行本程序代码（请注意自己系统的Python版本），就能看到如下图所示的界面  
![avatar](http://gitlab.adnonstop.com/Demo/FetchChinese-Debate/raw/master/PicSources/运行效果.png)  
## 4.功能一：提取项目中文并去重  
&emsp;&emsp;点击```“功能一”```区域的“选择文件”按钮，选中在上面准备工作步骤中准备好的```stringFile.txt```文件后，双击或者点击“Open”按钮。  
&emsp;&emsp;等待8秒左右，就会弹出输入保存文件名的弹窗。输入对应名字，就可以在桌面生成中文去重后的xlsx文件。  

## 5.功能二：比较两个xlsx/xls文件，筛选出不同的项  
&emsp;&emsp;在```“功能二”```区域，可以通过选择两个要进行比较的xlsx/xls文件，接着点击“开始筛选”按钮。然后在弹出输入保存文件名的弹窗中输入名字，就可以在桌面生成对应的txt文件。  
&emsp;&emsp;如果两个对比的xlsx/xls文件有不同的元素，该txt文件就会包含筛选后的元素，否则为空。  

## 6.功能三：把翻译好的xlsx/xls文件转化为strings格式  
&emsp;&emsp;对于翻译好的文件，应该是xlsx/xls格式的，其中有中文及对应的翻译文。  
&emsp;&emsp;在本程序中，假设在该xlsx/xls文件中的第一列是中文，第二列是翻译文。根据这种格式，将其转化为可以在Xcode项目中直接使用的.strings文件格式。  
&emsp;&emsp;在```“功能三”```区域中，点击“选择翻译好的xlsx文件”按钮，选中要转化为.stirngs的文件，双击或者点击“Open”按钮。然后在弹出输入保存文件名字的弹窗中输入名字，最后就会在桌面得到一个对应的.strings格式的文件。  

## 最后：  
本文阐述的方法在实践中，遇到了以下几个问题：  
- 在ZSH这个第三方终端中，对比于系统自带的终端，最终提取到的中文会漏掉很多。暂不知道问题出在哪。   
- 对于本项目，最终提取出来的中文中，仍然有几个不符合要求的字符串，需要手动删除。故本文阐述的方法仍有改善空间，欢迎各位大佬赐教！！   

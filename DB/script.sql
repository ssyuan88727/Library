USE [master]
GO
/****** Object:  Database [LibraryDB]    Script Date: 2025/02/23 上午 05:03:11 ******/
CREATE DATABASE [LibraryDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LibraryDB', FILENAME = N'/var/opt/mssql/data/LibraryDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'LibraryDB_log', FILENAME = N'/var/opt/mssql/data/LibraryDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [LibraryDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LibraryDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LibraryDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LibraryDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LibraryDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LibraryDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LibraryDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [LibraryDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LibraryDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LibraryDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LibraryDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LibraryDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LibraryDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LibraryDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LibraryDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LibraryDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LibraryDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LibraryDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LibraryDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LibraryDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LibraryDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LibraryDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LibraryDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LibraryDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LibraryDB] SET RECOVERY FULL 
GO
ALTER DATABASE [LibraryDB] SET  MULTI_USER 
GO
ALTER DATABASE [LibraryDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LibraryDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LibraryDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LibraryDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [LibraryDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [LibraryDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'LibraryDB', N'ON'
GO
ALTER DATABASE [LibraryDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [LibraryDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [LibraryDB]
GO
USE [LibraryDB]
GO
/****** Object:  Sequence [dbo].[title_seq]    Script Date: 2025/02/23 上午 05:03:11 ******/
CREATE SEQUENCE [dbo].[title_seq] 
 AS [bigint]
 START WITH 1
 INCREMENT BY 50
 MINVALUE -9223372036854775808
 MAXVALUE 9223372036854775807
 CACHE 
GO
/****** Object:  Table [dbo].[book]    Script Date: 2025/02/23 上午 05:03:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[book](
	[isbn] [varchar](255) NOT NULL,
	[author] [nvarchar](255) NOT NULL,
	[introduction] [ntext] NULL,
	[name] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[isbn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[borrowing_record]    Script Date: 2025/02/23 上午 05:03:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[borrowing_record](
	[record_id] [bigint] IDENTITY(1,1) NOT NULL,
	[borrowing_time] [datetime2](6) NOT NULL,
	[inventory_id] [bigint] NOT NULL,
	[user_id] [bigint] NOT NULL,
	[return_date_time] [datetime2](6) NULL,
PRIMARY KEY CLUSTERED 
(
	[record_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bulletin]    Script Date: 2025/02/23 上午 05:03:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bulletin](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[content] [text] NULL,
	[post_date] [varchar](255) NOT NULL,
	[stop_date] [varchar](255) NOT NULL,
	[title] [varchar](255) NOT NULL,
	[user_id] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[inventory]    Script Date: 2025/02/23 上午 05:03:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[inventory](
	[inventory_id] [bigint] IDENTITY(1,1) NOT NULL,
	[status] [varchar](255) NOT NULL,
	[store_time] [datetime2](6) NOT NULL,
	[isbn] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[inventory_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[menu]    Script Date: 2025/02/23 上午 05:03:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[menu](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[icon] [varchar](255) NULL,
	[name] [varchar](255) NOT NULL,
	[url] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user]    Script Date: 2025/02/23 上午 05:03:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user](
	[user_id] [bigint] IDENTITY(1,1) NOT NULL,
	[last_login_time] [datetime2](6) NULL,
	[password] [varchar](255) NOT NULL,
	[phone_number] [varchar](255) NOT NULL,
	[registration_time] [datetime2](6) NOT NULL,
	[user_name] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[book] ([isbn], [author], [introduction], [name]) VALUES (N'9786263618794', N'詹佳鑫', N'知性情意A+作文心法 20招大公開！
　　網嘆：「為什麼考完才講？」
　　高分必看！史上最好懂的作文書！
 
　　★獨家！國文學霸「學測30週讀書計畫表」
　　★超實用！不再後悔：上考場前小叮嚀
 
　　「作文投資報酬率超低，但又占國文一半成績！」
　　「一直拿B，到底怎麼寫才能從B跳到A＋？」
　　「閱卷教授怎麼給分？有哪些實用的作文技巧？」
 
　　詹佳鑫老師每年批改上千篇作文，非常清楚學生的作文痛點，針對學測國寫量身打造絕對高分20招！
 
　《學霸作文》按步驟、用方法、舉實例、講白話，手把手教你寫作文。
 　
　　★給同學：作文高分20招
　　1. 過來人經驗：本書統整學測歷屆國寫知性題與情意題考點，將學長姐常見的作文難題，拆解成20個小單元。
　　2. 步驟與口訣：每一招以「小步驟」的方式呈現，並給你超好用撇步與口訣。如：主故情聯反、破分例總、畫說找回、心的練習、顯微鏡作文法、穿越時空的象徵物等，讓你輕鬆上考場。
　　3. 幫你畫重點：重要文句幫你標粗體畫線，解說概念附參考句型，各單元最後再一次重點整理。
 
　　★給老師：作文教學好幫手
　　1.班級團訂：本書採單元式規劃，易於安排進度，教學好上手。使用一學期（18週），每週一單元；使用一學年（36週），每兩週一單元，高一到高三皆適用。
　　2.評量練習：每單元皆規劃「重點整理」與「有感進步小練習」，課堂上15分鐘即可完成，作為形成性評量。學生進步超有感，教師批閱更容易。
 
　　★給家長：作文安心伴讀指南
　　1.提早為大考做準備：帶孩子用具體的讀書計畫表，就國文考科三大面向，依照各單元重點，循序漸進練習，高分不漏接。
　　2.建立學習的成就感：本書示範明確、簡單好上手，能逐步幫助孩子們建立作文的信心與成就感。
 
本書特色

　　★最實用重點整理
　　★有感進步小練習
　　★歷屆考題大破解', N'學霸作文：建中臺大高材生，教你學測國寫拿A＋')
INSERT [dbo].[book] ([isbn], [author], [introduction], [name]) VALUES (N'9786267299029', N'楊定一, 馬奕安（Jan Martel）, 陳夢怡', N'每個不健康的人，幾乎都有呼吸的問題。
寫這本書，不是為了探討一般的呼吸而己，
而是希望陪你一起採用眼前適合療癒的呼吸。

　　「心健康，身體也會得到健康。
　　在身－心的健康之間，呼吸是最好的一座橋梁。」──楊定一

　　呼吸，本身是多層面的組合──包括怎麼運用身體的結構去進行呼吸、呼吸怎麼參與身體每一個角落的生化反應和代謝，以及呼吸和自律神經系統的互動，讓我們可以從生物物理、生物化學、神經電生理學、靈性或說意識的層面來帶動身心。

　　楊定一從個人的經驗和理解，意識到呼吸可以主導交感神經和副交感神經的作用，而且是統合身心的關鍵。

　　本書所談的呼吸，可分成兩大類：一個是隨時用、很安全、很健康的呼吸；一個是帶來刺激、打破慣性，用來緊急調整的呼吸。

　　透過呼吸的轉變，我們有機會帶來一種「零慣性」的空間，讓人走出疾病和創傷的影響，落回本來自然而然的放鬆。

　　【內容摘要】

　　#透過呼吸，把整體的協調找回來
　　各式各樣的慢性疾病與併發症，不光是呼吸或疾病本身的問題，而更是身體各部位失去協調、諧振或同步（coherence）。幸好，透過呼吸，我們有機會從代謝、心肺功能、免疫和壓力管理的層面，把整體的協調找回來。

　　#呼吸既是我們可以透過意志力控制，也可以自動進行
　　呼吸是一種生理的自主反應和非自主反應，它落在兩套神經系統的交會點上。你可以自己控制，也可以讓它自己運行。甚至，透過練習，你有機會讓新的步調在你不注意的時候也可以自己運行。這就是修正的開始。

　　#橫膈膜是第二個心臟，強化血液和淋巴循環
　　橫膈膜是帶動呼吸的主要肌肉。「橫膈膜腹式呼吸」也就是充分使用肺部下方的橫膈膜來帶動呼吸，讓呼吸肌肉的動可以延伸到腹部，帶來的胸壓變化，也有助於推動血液進出心臟和身體。

　　#腰痠背痛跟呼吸密切相關
　　一個人長期採用淺的上胸式呼吸，就好像戴著一層盔甲，隨時限制上半身肌肉的動作。時間久了，肩頸肌肉過度緊繃，而腹部核心肌肉缺乏支撐力量，也就免不了這裡痠那裡痛。

　　#呼吸是身體運作的國王
　　呼吸療癒的機制，離不開自律神經系統的平衡。
　　懂得透過呼吸的調整來移動自律神經的平衡，可以幫助身體減輕發炎反應，而有機會緩解COVID-19後遺症的影響。

　　#鯨豚式呼吸延長呼氣，可以減輕壓力感、放鬆身體
　　吸氣會很快活化交感神經，讓心跳加快、血壓升高。呼氣，則會活化副交感神經，讓心跳減慢、血壓下降。把呼氣拉長，可以幫助減輕面對威脅時的壓力反應。
　　容易感到緊繃的人，只要延長呼氣，就可以減輕壓力感並使身體放鬆。

　　#用朗誦發聲練習，改善肺部功能
　　OM的朗誦，可以帶動頭臉鼻腔共鳴的振動，刺激鼻竇釋放更多一氧化氮。一氧化氮有殺菌和抗病毒的效果，也帶來更多的放鬆。
　　時間長了，這種隨呼吸和發聲帶來的阻力，還可以強化呼吸肌肉的作用，讓更多肺泡打開，而提高肺部氣體交換的效果，改善肺部的功能。

　　#放慢呼吸，為身體帶來諧振
　　如果一個整體裡所有系統都以各自最好的狀態運作，而且彼此間是和諧而貫通的，就會出現這種一致性的狀態，也就是「諧振」。1分鐘4～7次的慢呼吸，是帶動這種諧振的鑰匙。

　　#正確的深呼吸，是最輕鬆而不費力的呼吸
　　「深呼吸，放輕鬆」並不是透過嘴巴用力吸一口氣、把肩膀和胸部聳起來進行。剛好相反，真正的深呼吸是溫和而不費力的。光是放慢呼吸的步調，輕輕慢慢吸氣，緩緩柔和吐氣，就已經在為好呼吸清除障礙，讓身體肌肉恢復自己的記憶，各部位協調起來，進入自然、緩慢、深沉、有節奏和平衡的呼吸。

　　#隨時回到呼吸，療癒創傷
　　身體的療癒，離不開心理的釋放。心理的療癒，也離不開身體的作用。
　　隨時回到呼吸。把過去隨時反彈、到處發散的注意力收回來，讓身心的能量匯聚到一個放鬆而療癒的狀態。
　　一個人能夠修復、能夠充電、能夠休息，不知不覺，身心活起來，也能笑得出來了。

　　#臣服到呼吸
　　呼吸，離不開情緒。念頭會造出情緒，而進入情緒，這股能量才會成形。這些情緒在身體裡彷彿凍結了，是透過重生的呼吸，讓冰封的情緒浮出來。
　　你只是透過呼吸切入，自然會解凍這些情緒，憤怒、萎縮、恐懼、恐慌都會浮出來。但是你不需要去關注它的內容，不需要特別再把這些記憶帶回來。
　　這種做法，本身也是一種臣服。臣服到生命。

　　#懂得愛自己，已經在改變呼吸
　　光是早上起來馬上跟一切、跟自己講「謝謝！」對全身從頭到腳做一個感恩的功課。這麼做，呼吸已經慢下來、已經拉長，進入一種諧振的狀態。
 
　　#清醒的呼吸練習
　　先從心理、意識的層面著手，然後再進入呼吸的練習。清醒的呼吸、轉變的呼吸，會影響到我們的意識，而為我們把唯識和唯物的觀念整合起來。

　　#透過呼吸，脫胎換骨
　　呼吸的方法，表面上是一個生理性的法門或練習。但是不知不覺，你發現透過呼吸卻可以把意識投入在身體、降落在身體、或說沉澱在身體。
　　很簡單地，用呼吸的方法，對個人已經帶來一種革命、一種脫胎換骨的改變。

　　*************
　　「全部生命系列」簡介

　　人的健康，身、心、靈從來沒有分開過。楊定一站在全人健康的角度，重新整合從古到今、世界各地的健康法門與哲學系統，用現代的語言重新表達，幫助你我活出全部的生命潛能。

　　《真原醫》、《螺旋舞》、《結構調整》、《好睡》與《最簡單、居家隨時做的結構調整運動》是從身心，也就是從「有」看著這個世界。希望在這個快步調的社會，幫助你我身心做一個整合，希望每一個人回到均衡。畢竟，在失衡的狀態下，一個人隨時都會被身心的不均衡給拉扯，而難以體會生命更深的層面。然而，一切都是幾面一體。有了「全部生命系列」的基礎，自然可以在這個最完整的預防醫學的每一個角落，體會到愛、平等、寧靜與希望。

　　從《靜坐》，「全部生命系列」《全部的你》、《神聖的你》、《不合理的快樂》到《我是誰》、《集體的失憶》、《落在地球》、《定》、《奇蹟》，再到兩本問答《十字路口》、《插對頭》，以及之後的《時間的陷阱》、《短路》、《頭腦的東西》、《無事生非》、《清醒地睡》、《我：弄錯身分的個案》、《豐盛》、《唯識》、《必要的創傷》、《轉捩點》、《療癒的飲食與斷食》，逐漸地，自然移動角度，從二元對立轉到一體，從「空」看著「有」，從內心看著外在，從「在」看著「做」，從「心」看著「人」。

　　隨著每一個作品，我們深入的，不是知識，而是每一個人內心都有的層面——生命最深的智慧與慈悲。這，是人類終極的療癒。

本書特色

　　* 清晰的圖文解說，讓讀者一窺「一口氣進入身體，要經歷怎樣的旅程來維繫生命？」的身體奧秘。
　　* 豐富的呼吸練習，方便讀者依據自己的身心狀態選用。
　　* 懂得如何呼吸好、呼吸飽，任何人都能掌握青春、健康與活力的奧秘。
　　* 簡單而容易實作，隨時隨地釋放壓力，修正自律神經失衡。
　　* 針對東方人、特別是華人文化的集體制約，調整了呼吸練習的重點與順序。
　　* 以「呼吸」為主題，深入淺出做跨領域的結合。從氣體與血液的生物化學出發，結合身體結構的生物物理與神經系統的運作，深入個人意識的轉變，認識生命的本質。', N'呼吸，為了療癒：全新的呼吸科學與醫學，透過清醒的呼吸，徹底轉化身心')
INSERT [dbo].[book] ([isbn], [author], [introduction], [name]) VALUES (N'9786267383698', N'洪錦魁', N'AI助攻
Python超級入門
創意設計 x AI程式實作
(全彩印刷)

　　本書內容
　　★★★★★【ChatGPT x Copilot x Gemini助攻】★★★★★
　　★★★★★【創意設計】【潛在應用】★★★★★
　　★★★★★【設計AI程式】★★★★★
　　★★★★★【Python Shell】【Google Colab】★★★★★

　　這是一本完全入門，充滿創意與描述Python未來潛在應用的書籍，閱讀本書內容，讀者可以學會下列知識的創意與潛在應用：

　　◎程式設計基礎
　　☆創意設計：機器人、ASCII藝術作品、數學魔術、故宮到羅浮宮、地球到月球、Unicode藝術輸出、星空圖案、雞兔同籠、核廢水。
　　☆潛在應用：房貸。

　　◎程式流程控制
　　★創意設計：情緒程式、火箭升空、推薦飲料。
　　☆潛在應用：使用者輸入驗證、遊戲開發中的決策制定、物聯網(IoT)中的條件響應、交通應用中的路線建議、社交應用中的隱私設置檢查、電子商務中的折扣促銷。

　　◎串列(List)與元組(Tuple)
　　★創意設計：凱薩密碼、旅行包裝清單、生日禮物選擇器。
　　☆潛在應用：矩陣運算、遊戲棋盤、學生分數表、商品庫存清單、多國語言詞彙表、坐標系統、員工資料、時間序列數據、商品清單、學生成績表。

　　◎迴圈控制
　　★創意設計：監控數據警報器、關鍵日誌、計時器、國王麥粒、購物車。
　　☆潛在應用：電影院劃位、簡易投票系統、簡易員工滿意度調查、訂單處理記錄、簡易客戶意見回饋收集、簡易聯絡人資料管理、監控系統。

　　◎字典(Dict)
　　★創意設計：文章分析、星座字典、凱薩密碼。
　　☆ 潛在應用：圖書館、管理超市、員工管理系統、餐廳菜單系統、學生課程和成績表、食譜和食材清單、個人行程安排、遊戲角色和屬性。

　　◎集合(Set)
　　★創意設計：雞尾酒。
　　☆潛在應用：統計獨特單字的數量、模擬抽獎系統、檢測兩個配置文件的差異。

　　◎函數設計
　　★創意設計：時間旅行者、故事生成器、冰淇淋的配料、多語言字典。
　　☆潛在應用：字串雕塑家、數據偵探、圖片濾鏡應用、股票價格分析、語言字典、系統配置字典、城市氣象報告、書店庫存管理。

　　◎類別(Class)
　　★創意設計：圖書館管理系統、餐廳點餐系統。
　　☆潛在應用：員工管理系統、產品庫存管理、會議室預訂系統。

　　◎模組開發與應用
　　★創意設計：時鐘程式、圖書館管理系統模組。
　　☆潛在應用：提醒休息程式、效能測試工具、生日倒數計時器、年齡計算。

　　◎檔案的讀取與寫入
　　★創意設計：詩歌生成器、互動式故事書。
　　☆潛在應用：數據探勘、資料保存、日誌文件寫入、自動備份系統日誌。

　　◎圖像與圖表
　　★創意設計：影像濾鏡、影像藝術、Sin軸移動的紅色球。
　　☆潛在應用：QR code、彩色專業圖表、日誌文件寫入、自動備份系統日誌。

　　◎網路爬蟲
　　★創意設計：上網不用瀏覽器、地址查詢地圖、十二星座圖片下載。
　　☆潛在應用：市場研究、社交媒體監控、新聞彙總和監控、產品評論和消費者意見挖掘、徵人訊息收集。

　　◎人工智慧與機器學習
　　★創意設計：新人職務分類、足球賽射門、選舉造勢要準備多少香腸。

　　◎ChatGPT和OpenAI API
　　★創意設計：AI客服機器人、Emoji機器人、AI聊天圖片生成。', N'AI助攻 Python超級入門 創意設計 x AI程式實作')
INSERT [dbo].[book] ([isbn], [author], [introduction], [name]) VALUES (N'9786267427606', N'郝旭烈', N'▕▁☆限量☆ 郝旭烈親筆繪製點石成金書籤！▁▏
★
不同人生階段該有的財富思維，
讓你成為游刃有餘的人生贏家！
★

所有你想問、還沒想到，但必知的理財知識和投資概念，
前台積電財務主管、「郝聲音」主持人──郝旭烈，
將日常生活化為50篇精闢短文，
點開你的致富財商，讓你好會賺、錢滾錢。

　　你渴望財富自由，拚命賺錢，卻又遲遲沒有進展嗎？

　　問題可能不在於你是否夠拚命，而是深植於你腦中的「貧窮木馬程式」在作祟。

　　播客「郝聲音」主持人、超人氣企業講師、前台積電財務主管──郝旭烈（郝哥），將親身經歷透過「三察」，以「覺察」植入財富思維；「觀察」找出致富之道；「洞察」創造財富流量。

　　﹝第一步﹞覺察：植入財富思維
　　很多人不明白為何自己賺不了錢，留不住財富。出身並不富裕的郝哥，最懂一個人致富過程中會遇到的阻礙。所以第一步，就讓郝哥來幫你覺察阻礙你的病毒，重新置入致富財商。
　　?金錢認知：錢在你心裡是什麼樣子？
　　?財商認知：你身旁朋友或家人有錢嗎?
　　?增值無限：開源重要，還是節流重要？
　　?投資本質：股市就是賭博嗎？
　　?現金流量：要多少現金在身邊才能退休？……etc.

　　﹝第二步﹞觀察：找出致富之道
　　百戰百勝之前，除了知彼，更要先「知己」，先從生活中的各個面向，如：該從事什麼職業？如何聰明使用薪資閒錢？租房或買房？……唯有了解最適合自己的生財之道，才能更快接近財富自由的目標。
　　?工作價值：工作只為賺錢，還是要找有興趣的才好？
　　?額外價值：賠本生意可以做嗎？
　　?第一桶金：必須先賺到100萬嗎？
　　?複利效應：要怎麼找到高報酬率的投資？
　　?時間擴張：如何開展斜槓人生？……etc.

　　〔第三步﹞洞察：創造財富流量
　　短暫又漫長的人生中，應該設法縮短累積財富的時間，增加享受自由的餘裕。但是如何才能將金錢放對地方，達成錢滾錢的目標呢？第三步郝哥會分享自己在創造財富之路上，深入問題本質後，探詢出的各種洞見。
　　?樂在其中：哪種理財或投資方式比較好？
　　?能力擴張：投資保守不好嗎？
　　?獲利自律：只能靠投資賺錢而不能投機嗎？
　　?學習增值：什麼樣投資最抗通膨？
　　?關注金流：如何看一家公司的前景？……etc.

　　▍其他精彩內容！
　　★夫妻要怎麼共同理財？
　　★如何跟孩子談錢、培養財商？
　　★如何培養孩子們主動積極態度？

點讚推薦

　　大俠武林│動能趨勢達人
　　小車X存股實驗│《給存股族的ETF實驗筆記》作者
　　王永福│F學院創辦人、頂尖企業講師
　　吳若權│作家/廣播主持/企管顧問
　　吳家德│NU PASTA總經理、職場作家
　　吳淡如│知名廣播主持人、暢銷作家
　　陳鳳馨│資深媒體人、News98《財經起床號》主持人
　　愛瑞克│《內在原力》系列作者、TMBA共同創辦人
　　楊斯棓醫師│《要有一個人》、《人生路引》作者
　　雷浩斯│價值投資者/財經作家
　　趙胤丞│企管講師、顧問
　　歐陽立中│暢銷作家、爆文教練
　　鄧惠文│精神科醫師、作家
　　鄭俊德│閱讀人社群主編
　　謝文憲│企業講師、作家、主持人

各界讚譽

　　──小車X存股實驗│《給存股族的ETF實驗筆記》作者：「透過一篇篇豐富多彩的人生故事，輕鬆學財商，同時能一口氣釐清大眾常見的投資迷思。郝氏金句連發，最具啟發的理財偈語，盡在其中。」

　　──王永福│F學院創辦人、頂尖企業講師：「『財富自由』，你真正想要的『財富』？還是『自由』？郝哥這本《致富覺察》，不止教你創造財富的方法，更教你深刻覺察的想法。不管你想追求是『財富』還是『自由』，這本書，都能幫助你達成你想要的目的，誠摯推薦！」

　　──吳家德│NU PASTA總經理、職場作家：「通常有錢就不得閒，有閒就容易沒錢。讀完郝哥這本《致富覺察》，我保證你會有錢又有閒。不信的話，趕緊翻閱。」

　　──楊斯棓醫師│《要有一個人》、《人生路引》作者：「台諺云：『錢若有，不驚世事！』《納瓦爾寶典》則開示：『錢雖然不能解決所有問題，但能解決所有跟錢有關的問題。』《致富覺察》一書，是駕馭金錢馬車的繡鞅。」

　　──趙胤丞│企管講師、顧問：「《致富覺察》不僅提供實用理財知識，更是自我覺醒之旅。郝哥引導我們發掘隱藏的致富機會，提升生活與財富認知，適合任何人生階段。誠摯推薦！」

　　──鄭俊德│閱讀人社群主編：「金錢帶來貪婪的慾望，也能帶來選擇的機會，在於你如何正確使用金錢工具，致富覺察將開啟你的金錢吸引力！」', N'致富覺察【郝旭烈親繪限量點石成金書籤】：培養點石成金的財富腦')
INSERT [dbo].[book] ([isbn], [author], [introduction], [name]) VALUES (N'9786267441886', N'James Hollis', N'盤點過往，重啟人生，與你靈魂的召喚久別重逢
當你開始意識到時光有限，如何重新思考人生的重要排序？

　　★榮格心理學名家、《中年之路》作者──經典著作
　　★《中年之路》譯者鐘穎老師──專文推薦

　　你一直在過著誰的生活？
　　是什麼將你帶至人生旅程的此時此地？

　　為何即使一帆風順，還是感覺哪裡不對勁？
　　為何那麼多事，最後都是失望收尾？

　　你目前的人生，已滿足靈魂的渴望了嗎？
　　現在是你最接近覺醒，展開「第二次人生」的時候。

　　許多人在三十至四十多歲時，迎來人生各種的動盪和困惑，發現自己一直在過著別人期待的人生，根本不知道自己是誰，想要的是什麼，甚至不知道為何而活，於是開始深思：自己要度過怎樣的人生下半場？

　　本書作者霍利斯博士在三十五歲時，因中年憂鬱開始接受第一次心理治療，那成為改變他日後人生的開始。他以自身閱歷與從業多年來豐富的個案經驗，寫成這本書，期盼為尋覓人生意義的人們，提供擴展覺知及聆聽內在的途徑。

　　本書是為了喚起你的個人覺醒，告別無意義的反覆迴圈，試圖從心理學的角度來思索人生下半場的價值與中年的意義，作者文字溫暖療癒，同時又不斷挑戰並鼓舞著我們，適時跳脫舒適圈，去回應生命所提出的靈魂召喚。

各界推薦

　　李全興（我是老查）╱數位轉型顧問、商業好書說書人
　　洪仲清╱臨床心理師
　　陳宏儒╱諮商心理師
　　愛瑞克╱《內在成就》系列作者、TMBA共同創辦人
　　楊斯棓╱家醫科醫師、《要有一個人》作者
　　鄭俊德╱閱讀人社群主編
　　盧美妏╱人生設計心理諮商所共同創辦人、諮商心理師
　　蘇予昕╱蘇予昕心理諮商所所長、暢銷作家
　　蘇益賢╱臨床心理師
　　鐘穎╱心理學作家、《中年之路》譯者
　　（以上按姓氏筆畫排列）

　　「無論我們是否實現了前半生的抱負或目標，中年時我們都可能因為各種原因感受到煩躁與不安，因為靈魂的目標已經覺醒，意欲追求完整（而非成就）。」──鐘穎（愛智者）╱《中年之路》、《榮格心理學辭典》譯者

　　「中年是人們可能感到迷惘及不知所措的時期。榮格分析心理學家詹姆斯‧霍利斯深知這個領域，提出了可以引導我們走向清晰、成熟和意義的重要問題。」──讓‧篠田‧波倫（Jean Shinoda Bolen），《女人中的女神》（Goddesses in Everywoman）作者

　　「詹姆斯‧霍利斯的新書是一部焠鍊靈魂的作品，它為我們這些在人生的下半場感到迷惘的人帶來了慰藉和智慧。」──愛德華‧赫希（Edward Hirsch），《如何閱讀詩歌並愛上詩歌》（How to Read a Poem and Fall in Love with Poetry）作者

　　「霍利斯所謂的中年最大課題：恢復個人權威。這意味著捨棄那些舒適但囚禁你的一切。」──《More雜誌》

　　「這本重要的書揭示了種種幻相，並為讓人生有意義的艱鉅任務，提出必要的靈魂功課。」──史蒂芬‧鄧恩（Stephen Dunn），普利茲獎詩人

　　「詹姆斯‧霍利斯是全球最頂尖的榮格分析心理學家，他對靈魂有很多話要說……博學又有素養，卻又通俗易懂。」──《波特蘭論壇報》（Portland Tribune）

　　「對尋找人生後期的真正意義的過程有深入的洞察……發人省思……真摯懇切。」──《休斯頓紀事報》

　　「對個體化進行深入的榮格式探索……既仁慈又有同情心……（霍利斯）對人生潛藏的意義的關注將引起許多人的共鳴。」──《出版者週刊》（Publishers Weekly）

　　「一位溫柔又有洞見的靈魂所寫的文字；他沒有陷入枯燥的分析，而是發自內心來講述及教導……真實的遠見和真正的仁慈是稀有且珍貴的禮物，而讀者將在本書中發現兩者。」──克拉麗莎‧平科拉‧埃斯特斯（Clarissa Pinkola Estes），《與狼同奔的女人》（Women Who Run with the Wolves）作者', N'覺醒中年：另一種生活的開始，找到人生下半場的意義')
INSERT [dbo].[book] ([isbn], [author], [introduction], [name]) VALUES (N'9789862139424', N'Richard Koch', N'★ 世紀商業經典．全球暢銷逾100萬冊
　　★ 原著出版20週年，更新1/5內容，全新擴充50,000字新版
　　★ 工作、生活中80/20法則無所不在，最多人推崇，必懂實用的省力原理
　　★ 80/20變90/10、99/1法則，資源時間精力，不均分配更重要
　　★ 20週年擴充新版增訂序，4篇全新章節，讓你投入更少，成效更好
　　★ 長年來深入人心，廣泛適用；《經理人月刊》《Cheers》特別報導

　　80/20法則，以少得多的黃金定律

　　想要提高效率，投入更少，獲得更多，就得不公平！
　　把焦點放在值得重視的人事物上——
　　你的工作、客戶、業績、時間分配、努力程度、財富分配，甚至人際關係和快樂，
　　至於不重要的部分，let it be。
　　集中投入、強化正反饋效應，擴大槓桿效益，
　　才是我們化解各種壓力、出類拔萃的關鍵。

　　本書做為第一本有關80/20法則的書籍，《80/20法則》出版20年來，一直是風行全球的熱門暢銷書。耳熟能詳的人生道理，幾乎人人都能信手拈來，但卻未必運用得好。如今，世界運行更加快速，市場與社會高度競爭，網路將每個人都連結在一起，作者理查．柯克為新世代的閱讀需求，更新超過50,000字，幫助我們更進一步善用80/20法則，重新認識它的方法與威力。

　　80/20法則主張：一小部分的原因、投入或努力，通常可以產生大部分的結果、產出或報酬。

　　20%的原因，導致約80%的結果。
　　20%的客戶，創造約80%的業績。
　　20%的產品，產生約80%的獲利。
　　20%的原則，解決約80%的問題。
　　20%的改變，帶來約80%的成效。

　　80/20的分析與思考法，將指導你如何跳脫線性邏輯的陷阱，充分了解：什麼該要，什麼不該要；什麼該做，什麼不該做；什麼該放，什麼不該放，全面掌握80/20法則的核心要領，找到正確施力點，杜絕無效努力目標，讓你的一分耕耘，不再只有一分收穫。

　　※修訂增補原書章節案例、全新設計書封內頁排版／擴充新版增訂內容

　　1.20週年擴充新版增訂序
　　2.總結內容精華的80/20饒舌歌
　　3.全新四個章節與結論：
　　●如何利用網絡崛起，建立與鞏固你的優勢
　　●80/20分配向90/10和99/1偏斜，如何調整你的出力比重更加關鍵
　　●如何和你的潛意識當好朋友，將帶給你意想不到的益處
　　●為你帶來更大成效的五個超級成功規則

各界好評

　　80/20法則是人們基於結果過生活的根本。讀一讀這本書，把80/20法則用起來吧。──提摩西．費里斯（Timothy Ferriss），《一週工作4小時》作者

　　時間管理不是要把日常事務處理得井井有條，而是要把重要的日常事務處理得井井有條，並將其他事務拋開。柯克僅憑藉這本暢銷書的一個核心概念，賺進了大把鈔票，證明這麼做極其有效。──《GQ雜誌精選25本最佳商業書》

　　恭喜你！80/20法則棒極了！──艾爾．賴茲（Al Ries），《焦點法則》及《定位》等書作者

　　這裡面有可以令你改變人生的觀念。──《好書指南》（The Good Book Guide）

　　柯克是80/20法則的狂熱信徒。讀完本書，你也會和他一樣。──安德魯．坎貝爾（Andrew Campbell），亞許里吉策略管理中心（Ashridge Strategic Management Center）

　　本書充滿機鋒、趣味盎然，內容發人深省，能幫助人們將心思放在如何不浪費生命上。──西奧多．澤爾丁（Theodore Zeldin）教授，牛津大學聖安東尼學院

　　我們給這本達利式巨作五顆星……精心創作的散文，拼貼成一幅美麗的畫……這本書的價值，遠比它的售價高出許多倍。──《韋斯頓書評》（The Weston Review），佛羅里達州坦帕灣', N'80/20法則：商場獲利與生活如意的成功法則（20週年擴充新版）')
GO
SET IDENTITY_INSERT [dbo].[borrowing_record] ON 

INSERT [dbo].[borrowing_record] ([record_id], [borrowing_time], [inventory_id], [user_id], [return_date_time]) VALUES (1, CAST(N'2025-02-22T15:34:22.1088680' AS DateTime2), 1, 7, CAST(N'2025-02-22T16:53:15.8033660' AS DateTime2))
INSERT [dbo].[borrowing_record] ([record_id], [borrowing_time], [inventory_id], [user_id], [return_date_time]) VALUES (2, CAST(N'2025-02-22T16:54:37.5796940' AS DateTime2), 1, 7, CAST(N'2025-02-22T17:06:56.6682820' AS DateTime2))
INSERT [dbo].[borrowing_record] ([record_id], [borrowing_time], [inventory_id], [user_id], [return_date_time]) VALUES (3, CAST(N'2025-02-22T17:07:58.9897460' AS DateTime2), 1, 7, CAST(N'2025-02-22T17:08:05.9238510' AS DateTime2))
INSERT [dbo].[borrowing_record] ([record_id], [borrowing_time], [inventory_id], [user_id], [return_date_time]) VALUES (4, CAST(N'2025-02-22T17:17:22.4746000' AS DateTime2), 1, 7, CAST(N'2025-02-22T17:17:27.9203740' AS DateTime2))
INSERT [dbo].[borrowing_record] ([record_id], [borrowing_time], [inventory_id], [user_id], [return_date_time]) VALUES (5, CAST(N'2025-02-22T17:31:06.9531940' AS DateTime2), 3, 15, NULL)
INSERT [dbo].[borrowing_record] ([record_id], [borrowing_time], [inventory_id], [user_id], [return_date_time]) VALUES (6, CAST(N'2025-02-22T17:31:23.0701720' AS DateTime2), 6, 7, CAST(N'2025-02-22T17:31:39.3724000' AS DateTime2))
INSERT [dbo].[borrowing_record] ([record_id], [borrowing_time], [inventory_id], [user_id], [return_date_time]) VALUES (7, CAST(N'2025-02-22T17:31:44.5657900' AS DateTime2), 6, 7, NULL)
SET IDENTITY_INSERT [dbo].[borrowing_record] OFF
GO
SET IDENTITY_INSERT [dbo].[bulletin] ON 

INSERT [dbo].[bulletin] ([id], [content], [post_date], [stop_date], [title], [user_id]) VALUES (1, N'<p>fdsfasdfasdf</p><ol><li data-list="ordered"><span class="ql-ui" contenteditable="false"></span>fdsafsadfgfdgs</li><li data-list="ordered"><span class="ql-ui" contenteditable="false"></span>hdfxghdgfjghk</li><li data-list="bullet"><span class="ql-ui" contenteditable="false"></span>fdsgvsdfhhkhjg</li></ol><p><br></p>', N'2025-02-17', N'2025-02-25', N'測試', 7)
INSERT [dbo].[bulletin] ([id], [content], [post_date], [stop_date], [title], [user_id]) VALUES (2, N'<p>4DAS856F41DS3F1DSCFVDX</p><h1>FDSFDSGFDSG</h1><p>AFASDGFH</p><p>456153453</p>', N'2025-02-07', N'2025-02-12', N'c8cDFGKSDFPO''G', 7)
INSERT [dbo].[bulletin] ([id], [content], [post_date], [stop_date], [title], [user_id]) VALUES (3, N'<p>dsfsdtgfd4561</p><p>dfg456dsf4g1f3ds25gdasd</p><p>fgsdf7853g4ewa165rfe4wr1243	</p>', N'2025-02-18', N'2025-02-25', N'998864156', 15)
SET IDENTITY_INSERT [dbo].[bulletin] OFF
GO
SET IDENTITY_INSERT [dbo].[inventory] ON 

INSERT [dbo].[inventory] ([inventory_id], [status], [store_time], [isbn]) VALUES (1, N'在庫', CAST(N'2025-02-22T00:00:00.0000000' AS DateTime2), N'9786263618794')
INSERT [dbo].[inventory] ([inventory_id], [status], [store_time], [isbn]) VALUES (3, N'已借出', CAST(N'2025-02-22T00:00:00.0000000' AS DateTime2), N'9786267299029')
INSERT [dbo].[inventory] ([inventory_id], [status], [store_time], [isbn]) VALUES (6, N'已借出', CAST(N'2025-02-22T00:00:00.0000000' AS DateTime2), N'9786267383698')
INSERT [dbo].[inventory] ([inventory_id], [status], [store_time], [isbn]) VALUES (8, N'在庫', CAST(N'2025-02-22T00:00:00.0000000' AS DateTime2), N'9786267427606')
INSERT [dbo].[inventory] ([inventory_id], [status], [store_time], [isbn]) VALUES (9, N'在庫', CAST(N'2025-02-22T00:00:00.0000000' AS DateTime2), N'9786267441886')
INSERT [dbo].[inventory] ([inventory_id], [status], [store_time], [isbn]) VALUES (10, N'在庫', CAST(N'2025-02-22T00:00:00.0000000' AS DateTime2), N'9789862139424')
SET IDENTITY_INSERT [dbo].[inventory] OFF
GO
SET IDENTITY_INSERT [dbo].[menu] ON 

INSERT [dbo].[menu] ([id], [icon], [name], [url]) VALUES (1, N'fa-solid fa-circle-user', N'User 使用者', N'/user')
INSERT [dbo].[menu] ([id], [icon], [name], [url]) VALUES (2, N'fa-solid fa-warehouse', N'Inventory 庫存', N'/inventory')
INSERT [dbo].[menu] ([id], [icon], [name], [url]) VALUES (3, N'fa-solid fa-book', N'Book 書籍', N'/book')
INSERT [dbo].[menu] ([id], [icon], [name], [url]) VALUES (4, N'fa-solid fa-file-export', N'Borrowing Record 借閱紀錄', N'/borrowingRecord')
INSERT [dbo].[menu] ([id], [icon], [name], [url]) VALUES (5, N'fa-solid fa-chalkboard-user', N'Bulletin Board 公佈欄', N'/bulletin')
SET IDENTITY_INSERT [dbo].[menu] OFF
GO
SET IDENTITY_INSERT [dbo].[user] ON 

INSERT [dbo].[user] ([user_id], [last_login_time], [password], [phone_number], [registration_time], [user_name]) VALUES (7, CAST(N'2025-02-23T03:13:36.7822010' AS DateTime2), N'yFwLRTu8OyE3KaZhAsEs70lvr5eGGhg5CEnaVXVjEcU=', N'0912345678', CAST(N'2025-02-21T20:36:30.9893040' AS DateTime2), N'Jennie Nichols')
INSERT [dbo].[user] ([user_id], [last_login_time], [password], [phone_number], [registration_time], [user_name]) VALUES (15, CAST(N'2025-02-23T03:08:47.8404330' AS DateTime2), N'yFwLRTu8OyE3KaZhAsEs70lvr5eGGhg5CEnaVXVjEcU=', N'0922345678', CAST(N'2025-02-22T17:30:49.8957210' AS DateTime2), N'test02')
SET IDENTITY_INSERT [dbo].[user] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK7h4xn7gqvj13r5qnhyqm3r3x0]    Script Date: 2025/02/23 上午 05:03:12 ******/
ALTER TABLE [dbo].[user] ADD  CONSTRAINT [UK7h4xn7gqvj13r5qnhyqm3r3x0] UNIQUE NONCLUSTERED 
(
	[phone_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[borrowing_record]  WITH CHECK ADD  CONSTRAINT [FKihucub62vbxjk7f5offbffbyj] FOREIGN KEY([inventory_id])
REFERENCES [dbo].[inventory] ([inventory_id])
GO
ALTER TABLE [dbo].[borrowing_record] CHECK CONSTRAINT [FKihucub62vbxjk7f5offbffbyj]
GO
ALTER TABLE [dbo].[borrowing_record]  WITH CHECK ADD  CONSTRAINT [FKt2bdm6cw1qd0pmidmn51jbdqa] FOREIGN KEY([user_id])
REFERENCES [dbo].[user] ([user_id])
GO
ALTER TABLE [dbo].[borrowing_record] CHECK CONSTRAINT [FKt2bdm6cw1qd0pmidmn51jbdqa]
GO
ALTER TABLE [dbo].[bulletin]  WITH CHECK ADD  CONSTRAINT [FK4cxj4pvd5d9vmjwi2q1mthssr] FOREIGN KEY([user_id])
REFERENCES [dbo].[user] ([user_id])
GO
ALTER TABLE [dbo].[bulletin] CHECK CONSTRAINT [FK4cxj4pvd5d9vmjwi2q1mthssr]
GO
ALTER TABLE [dbo].[inventory]  WITH CHECK ADD  CONSTRAINT [FKlkjyn517xkb9q92lp6boc2slk] FOREIGN KEY([isbn])
REFERENCES [dbo].[book] ([isbn])
GO
ALTER TABLE [dbo].[inventory] CHECK CONSTRAINT [FKlkjyn517xkb9q92lp6boc2slk]
GO
USE [master]
GO
ALTER DATABASE [LibraryDB] SET  READ_WRITE 
GO

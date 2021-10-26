import {
    getPage,
    getTitle,
    getQueryData
} from "../api/leavingmessage"

export const lmCommon = {
    data() {
        return {
            searchCondition: {      //搜索条件
                sender:"",          //留言发送人
                receiver:"",        //留言接收人
                currentPage: 1,     //当前页面
                pageSize: 8,        //页面大小
                title: "",          //标题
                content:"",         //内容
                startTime: "",      //开始时间
                endTime: "",        //结束时间
                isAll: false,       //是否为全部留言
            },
            choose: "",             //动态搜索前置条件(例:content/title)
            totalMessages: 0,       //总留言数
            totalPages: 0,          //总页面
            records: [],            //留言数据
            currentURLPath: "",     //当前地址栏路径
            restaurants: [],        //动态搜索内容显示
            timeout:"",             //动态搜索加载时间
            disabled: false         //是否显示tooltip
        }
    },
    methods: {
        querySearchAsync(queryString, callback) { //动态搜索内容
            if (queryString === '') {} else if (this.choose == "") {
                this.$message.warning({
                    message: "请先选择输入框左边的搜索条件"
                })
            } else {
                if(this.searchCondition.isAll && !this.choose.match(/\d/g)) this.choose += 1;
                console.log(this.choose)
                getQueryData(this.choose, queryString).then(res => {
                    this.restaurants = []
                    res.data.forEach(item => {
                        this.restaurants.push({
                            value: item
                        })
                    })
                })
                clearTimeout(this.timeout)
                this.timeout = setTimeout(() => {
                    callback(this.restaurants)
                }, 1000 * Math.random())
            }
        },
        dynamicSearch() { //根据输入内容更新数据
            if(this.choose.match(/\d/g)) this.choose = this.choose.replace("1","");
            if (this.choose == 'title') {
                this.searchCondition.title = this.inputSearch
            } else if (this.choose == 'content') {
                this.searchCondition.content = this.inputSearch
            } else {
                this.$message.error({
                    message: "系统出错"
                })
            }
            this.searchCondition.currentPage = 1
            getPage(JSON.stringify(this.searchCondition)).then(res => {
                this.updateData(res.data)
            })
        },
        getDataByTitle() { //根据标题获取数据
            this.searchCondition.title = this.currentTitle
            this.searchCondition.currentPage = 1
            getPage(JSON.stringify(this.searchCondition)).then(res => {
                this.updateData(res.data)
            })
        },
        getTitleList() { //获取标题列表
            getTitle(JSON.stringify(this.searchCondition)).then(res => {
                this.distinctTitle = res.data
            })
        },
        getPageByDate() { //根据日期获取数据
            if (this.date != null) {
                this.searchCondition.startTime = this.date[0];
                this.searchCondition.endTime = this.date[1];
            } else {
                this.searchCondition.startTime = "";
                this.searchCondition.endTime = "";
            }
            this.searchCondition.currentPage = 1
            getPage(JSON.stringify(this.searchCondition)).then(res => {
                this.updateData(res.data)
            })
        },
        pageChange(currentPage) { //更新任意页
            this.loading = true;
            this.searchCondition.currentPage = currentPage;
            getPage(JSON.stringify(this.searchCondition)).then(res => {
                this.updateData(res.data)
            })
        },
        toFirst() { //第一页
            if (this.searchCondition.currentPage != 1) {
                this.loading = true;
                this.searchCondition.currentPage = 1;
                getPage(JSON.stringify(this.searchCondition)).then(res => {
                    this.updateData(res.data)
                })
            }
        },
        toEnd() { //最后一页
            if (this.searchCondition.currentPage != this.totalPages) {
                this.loading = true;
                this.searchCondition.currentPage = this.totalPages;
                getPage(JSON.stringify(this.searchCondition)).then(res => {
                    this.updateData(res.data)
                })
            }
        },
        toBefore() { //上一页
            if (this.searchCondition.currentPage != 1) {
                this.loading = true;
                --this.searchCondition.currentPage;
                getPage(JSON.stringify(this.searchCondition)).then(res => {
                    this.updateData(res.data)
                })
            }
        },
        toAfter() { //下一页
            if (this.searchCondition.currentPage != this.totalPages) {
                this.loading = true;
                ++this.searchCondition.currentPage;
                getPage(JSON.stringify(this.searchCondition)).then(res => {
                    this.updateData(res.data)
                })
            }
        },
        updateData(data) {
            this.totalMessages = data.total; //全部留言数
            this.totalPages = data.pages; //全部页数
            this.records = data.records; //数据导入到页面表格中
            this.loading = false; //关闭加载
        }
    },
    created: function () {
        let user = JSON.parse(localStorage.getItem("user"));
        if(user != null) this.searchCondition.sender = user.name;
        this.currentURLPath = this.$route.path.split("/")[2];
        this.searchCondition.isAll = this.currentURLPath == 'mine' ? false : true; //判断当前是在我的留言还是全部留言
        if(this.searchCondition.isAll){
            this.searchCondition.receiver = user.name;
            this.searchCondition.pageSize = 10;
        }
        this.loading = true; //开始加载
        getPage(JSON.stringify(this.searchCondition)).then(res => {
            this.updateData(res.data)
        })
    },
}
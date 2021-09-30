import {
    getPage,getTitle
} from "../api/leavingmessage"

export const lmCommon = {
    data() {
        return {
            searchCondition: {
                currentPage: 1,
                pageSize: 5,
                title: "",
                startTime: "",
                endTime: "",
                isAll: false
            },
            totalMessages: 0,
            totalPages: 0,
            records: [],
            currentPath:""
        }
    },
    methods: {
        getDataByTitle(){    //根据标题获取数据
            this.searchCondition.isAll = this.currentPath == 'mine' ? false : true;
            this.searchCondition.title = this.currentTitle
            console.log(this.searchCondition.title)
            getPage(JSON.stringify(this.searchCondition)).then(res => {
                this.updateData(res.data)
            })
        },
        getTitleList() {    //获取标题列表
            this.searchCondition.isAll = this.currentPath == 'mine' ? false : true;
            getTitle(JSON.stringify(this.searchCondition)).then(res => {
                console.log(this.$route.path.split("/")[2])
                this.distinctTitle = res.data
            })
        },
        getPageByDate() {   //根据日期获取页
            this.searchCondition.isAll = this.currentPath == 'mine' ? false : true;
            this.searchCondition.startTime = this.date[0];
            this.searchCondition.endTime = this.date[1];
            console.log(this.searchCondition.startTime)
        },
        pageChange(page) { //任意页
            this.searchCondition.isAll = this.currentPath == 'mine' ? false : true;
            this.loading = true;
            this.searchCondition.currentPage = page;
            getPage(JSON.stringify(this.searchCondition)).then(res => {
                this.updateData(res.data)
            })
        },
        toFirst() { //第一页
            this.searchCondition.isAll = this.currentPath == 'mine' ? false : true;
            this.loading = true;
            this.searchCondition.currentPage = 1;
            getPage(JSON.stringify(this.searchCondition)).then(res => {
                this.updateData(res.data)
            })
        },
        toEnd() { //最后一页
            this.searchCondition.isAll = this.currentPath == 'mine' ? false : true;
            this.loading = true;
            this.searchCondition.currentPage = this.totalPages;
            getPage(JSON.stringify(this.searchCondition)).then(res => {
                this.updateData(res.data)
            })
        },
        toBefore() { //上一页
            this.searchCondition.isAll = this.currentPath == 'mine' ? false : true;
            this.loading = true;
            this.searchCondition.currentPage = this.searchCondition.currentPage - 1 >= 1 ? this.searchCondition.currentPage - 1 : this.searchCondition.currentPage;
            getPage(JSON.stringify(this.searchCondition)).then(res => {
                this.updateData(res.data)
            })
        },
        toAfter() { //下一页
            this.searchCondition.isAll = this.currentPath == 'mine' ? false : true;
            this.loading = true;
            this.searchCondition.currentPage = this.searchCondition.currentPage + 1 <= this.totalPages ? this.searchCondition.currentPage + 1 : this.searchCondition.currentPage;
            getPage(JSON.stringify(this.searchCondition)).then(res => {
                this.updateData(res.data)
            })
        },
        updateData(data) {
            this.totalMessages = data.total;  //全部留言数
            this.totalPages = data.pages;   //全部页数
            this.records = data.records;   //数据导入到页面表格中
            this.loading = false;   //关闭加载
        }
    },
    created: function () {
        this.currentPath = this.$route.path.split("/")[2];
        this.searchCondition.isAll = this.currentPath == 'mine' ? false : true;  //判断当前是在我的留言还是全部留言
        this.loading = true;    //开始加载
        getPage(JSON.stringify(this.searchCondition)).then(res => {
            console.log(res)
            this.updateData(res.data)
        })
    },
}
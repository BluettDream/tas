import dayjs from "dayjs";
import {
    getPage,
    getTitle
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
            currentURLPath: ""
        }
    },
    methods: {
        getDataByTitle() { //根据标题获取数据
            this.searchCondition.isAll = this.currentURLPath == 'mine' ? false : true;
            this.searchCondition.title = this.currentTitle
            getPage(JSON.stringify(this.searchCondition)).then(res => {
                this.updateData(res.data)
            })
        },
        getTitleList() { //获取标题列表
            this.searchCondition.isAll = this.currentURLPath == 'mine' ? false : true;
            getTitle(JSON.stringify(this.searchCondition)).then(res => {
                this.distinctTitle = res.data
            })
        },
        getPageByDate() { //根据日期获取页
            this.searchCondition.isAll = this.currentURLPath == 'mine' ? false : true;
            this.searchCondition.startTime = this.date[0];
            this.searchCondition.endTime = this.date[1];
            console.log(this.searchCondition.startTime)
        },
        pageChange(currentPage) { //更新任意页
            this.searchCondition.isAll = this.currentURLPath == 'mine' ? false : true;
            this.loading = true;
            this.searchCondition.currentPage = currentPage;
            getPage(JSON.stringify(this.searchCondition)).then(res => {
                this.updateData(res.data)
            })
        },
        toFirst() { //第一页
            this.searchCondition.isAll = this.currentURLPath == 'mine' ? false : true;
            if (this.searchCondition.currentPage != 1) {
                this.loading = true;
                this.searchCondition.currentPage = 1;
                getPage(JSON.stringify(this.searchCondition)).then(res => {
                    this.updateData(res.data)
                })
            }
        },
        toEnd() { //最后一页
            this.searchCondition.isAll = this.currentURLPath == 'mine' ? false : true;
            if (this.searchCondition.currentPage != this.totalPages) {
                this.loading = true;
                this.searchCondition.currentPage = this.totalPages;
                getPage(JSON.stringify(this.searchCondition)).then(res => {
                    this.updateData(res.data)
                })
            }
        },
        toBefore() { //上一页
            this.searchCondition.isAll = this.currentURLPath == 'mine' ? false : true;
            if (this.searchCondition.currentPage != 1) {
                this.loading = true;
                --this.searchCondition.currentPage;
                getPage(JSON.stringify(this.searchCondition)).then(res => {
                    this.updateData(res.data)
                })
            }
        },
        toAfter() { //下一页
            this.searchCondition.isAll = this.currentURLPath == 'mine' ? false : true;
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
            this.records.forEach(element => {
                element.date = dayjs(element.date).format("YYYY-MM-DD");
            });
            this.loading = false; //关闭加载
        }
    },
    created: function () {
        this.currentURLPath = this.$route.path.split("/")[2];
        this.searchCondition.isAll = this.currentURLPath == 'mine' ? false : true; //判断当前是在我的留言还是全部留言
        if (this.searchCondition.isAll) this.searchCondition.pageSize = 7;
        this.loading = true; //开始加载
        getPage(JSON.stringify(this.searchCondition)).then(res => {
            this.updateData(res.data)
        })
    },
}
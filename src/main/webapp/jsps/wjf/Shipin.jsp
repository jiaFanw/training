<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>视频资料库</title>
    <script src="${pageContext.request.contextPath }/static/vue/vue.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/vue/element/index.css">
    <script src="${pageContext.request.contextPath }/static/vue/element/index.js"></script>
    <script src="${pageContext.request.contextPath }/static/vue/axios.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/static/vue/qs.js"></script>
    <script src="${pageContext.request.contextPath }/static/js/jquery-3.4.1.min.js"></script>
</head>
<style type="text/css">
    .el-dialog__body{
        height: 400px;overflow: auto;
    }
</style>
<body>
<div id="app">

    <el-form ref="form" :inline="true" :model="form" label-width="80px">
        <el-form-item label="视频标题:">
            <el-input v-model="form.videoTitle"></el-input>
        </el-form-item>
        <el-form-item label="创建时间:">
            <el-col :span="11">
                <el-date-picker type="date" placeholder="开始日期" v-model="form.beginTime" style="width: 100%;"></el-date-picker>
            </el-col>
            <el-col class="line" :span="2">-</el-col>
            <el-col :span="11">
                <el-date-picker type="date" placeholder="结束日期" v-model="form.endTime" style="width: 100%;"></el-date-picker>
            </el-col>
        </el-form-item>
        <el-form-item>
            <el-button type="primary" @click="searchfind">查询</el-button>
            <el-button>重置</el-button>
        </el-form-item>
    </el-form>

    <el-button @click="search=true" type="primary">新增视频</el-button>

    <el-tabs v-model="activeName" @tab-click="handleClick1">
        <el-tab-pane label="我的视频库" name="first">
        </el-tab-pane>
        <el-tab-pane label="共享视频库" name="second">
        </el-tab-pane>
    </el-tabs>

    <%--视频库表格--%>
    <el-table
            :data="tableData"
            border
            style="width: 100%;">
        <el-table-column
                align="center"
                type="index"
                label="序号">
        </el-table-column>
        <el-table-column
                align="center"
                prop="videoTitle"
                label="视频标题">
        </el-table-column>
        <el-table-column
                align="center"
                prop="creatTimeStr"
                label="创建时间">
        </el-table-column>
        <el-table-column
                align="center"
                label="操作">
            <template slot-scope="scope" style="align-content: center">
                <el-button @click="findById(scope.row)"size="small" type="danger" round>查看</el-button>
                <el-button v-show="scope.row.videoStatus == '1'" @click="findById3(scope.row)"size="small" type="danger" round>编辑</el-button>
                <el-button v-show="scope.row.videoStatus == '1'" @click="delId(scope.$index,scope.row)"size="small" type="danger" round>删除</el-button>
                <el-button v-show="scope.row.videoStatus == '2'" @click="findById2(scope.row)"size="small" type="danger" round>添加至我的视频库</el-button>
            </template>
        </el-table-column>
    </el-table>






<%--新增视频--%>
    <el-dialog title="" :visible.sync="search">
            <el-form :model="vi">
                <el-col :span="10">
                    <el-form-item label="视频标题" >
                        <el-input v-model="vi.videoTitle" autocomplete="off"></el-input>
                    </el-form-item>
                </el-col>
                <el-col :span="20">
                    <el-form-item label="视频内容" >
                        <input type="file" class="file" name="file">
                    </el-form-item>
                </el-col>
                <el-col :span="20">
                    <el-form-item label="视频封面" >
                        <input type="file" class="file2" name="file2">
                    </el-form-item>
                    </el-form-item>
                </el-col>
                <el-col :span="20">
                    <el-form-item label="是否同步至共享库：" >
                        <el-switch
                                style="display: block;margin-top: 15px"
                                v-model="vi.videoStatus"
                                active-color="#ff4949"
                                inactive-color="#13ce66"
                                active-text="不同步"
                                inactive-text="">
                        </el-switch>
                    </el-form-item>
                </el-col>
            </el-form>
            <div slot="footer" class="dialog-footer">
                <el-button @click="search = false">取 消</el-button>
                <el-button type="primary" @click="addVideo">确 定</el-button>
            </div>
        </el-dialog>

     <%--查看--%>
    <el-dialog title="" :visible.sync="search2">
        <el-form :model="video">
            <el-col :span="10">
                <el-form-item label="视频标题：">{{video.videoTitle}}
                </el-form-item>
            </el-col>
            <el-col :span="20">
                <el-form-item label="视频内容">
                    <embed type="video/webm" :src="video.videoFile" width="300" height="300">
                </el-form-item>
            </el-col>
            <el-col :span="20">
                <el-form-item label="视频封面">
                   <img :src="video.videoCover" width="300" height="300">
                </el-form-item>
            </el-col>
            <el-col :span="20">
                <el-form-item label="是否同步至共享库：" >
                        <span v-if="video.videoStatus=='1'">不同步</span>
                        <span v-if="video.videoStatus=='2'">同步</span>
                </el-form-item>
            </el-col>
            <el-col :span="10">
                <el-form-item label="创建时间：">
                    {{video.creatTimeStr}}
                </el-form-item>
            </el-col>
        </el-form>
        <div slot="footer" class="dialog-footer">
            <el-button @click="search2 = false">关闭</el-button>
        </div>
    </el-dialog>






    </template>
</div>
</body>
<script type="text/javascript">
    var formData = new window.FormData();

    new Vue({
        el: '#app',
        mounted() {
            var _this=this;
            var videoStatus=1;
            axios.
            post('/WJF/findVideo',{
                videoStatus:videoStatus
            }).then(function (res)  {
                _this.tableData=res.data;
            }).catch(function (error) {
            });
        },

        data (){
            return{
                activeName:'first',
                tableData: [],
                handleClick:false,
                dialogTableVisible: false,
                search: false,
                search2: false,
                search3:false,
                search4:false,
                videoCover: '',
                form: {
                   videoTitle:'',
                   beginTime:'',
                   endTime:''
                },
                vi:{
                    videoTitle:'',
                    file:'',
                    videoStatus:true
                },
                video:{
                    videoTitle:'',
                    videoStatus:''
                },
                vid:{
                    videoId:''
                },
                vide:{
                    videoId:'',
                    videoTitle:''
                },
                formLabelWidth: '200px',
                c:''
            }
        },
        methods : {

            handleClick1(tab, event) {
                var _this=this;
                if(tab._uid == 25){
                    //我的视频库
                    var videoStatus=1;
                    axios.post('/WJF/findVideo',{
                        videoStatus:videoStatus
                    }).then(function (res)  {
                        console.log(res.data);
                        _this.tableData=res.data;
                    }).catch(function (error) {
                    });
                }else if(tab._uid == 26){
                    //共享视频库
                    var videoStatus=2;
                    axios.post('/WJF/findVideo',{
                        videoStatus:videoStatus
                    }).then(function (res)  {
                        console.log(res.data);
                        _this.tableData=res.data;
                    }).catch(function (error) {
                    });
                }

            },

            //模糊查询
            searchfind: function () {
                var _this = this;
                var videoTitle = _this.form.videoTitle;
                var beginTime = _this.form.beginTime;
                var endTime = _this.form.endTime;
                axios.post('/WJF/findVideo', {
                    videoTitle: videoTitle,
                    beginTime: beginTime,
                    endTime: endTime
                }).then(function (res) {
                    console.log(res.data)
                    _this.tableData = res.data;
                }).catch(function (error) {
                });
            },




            /*新增视频*/
            addVideo:function () {
                var _this=this;
                if(_this.vi.videoStatus==false){
                    _this.vi.videoStatus=2
                }else{
                    _this.vi.videoStatus=1
                }
                formData.append("file",document.querySelector('input[name=file]').files[0]);
                formData.append("file2",document.querySelector('input[name=file2]').files[0]);
                formData.append("videoTitle",_this.vi.videoTitle);
                formData.append("videoStatus",_this.vi.videoStatus);
                console.log(formData.get("file"))
                console.log(formData.get("file2"))
                var requestConfig = {
                    headers: {
                        'Content-Type': 'multipart/form-data'
                    },
                }
                axios.
                    post('/WJF/addVideo',formData,{})
                    .then(function (res)  {
                        alert("上传成功！")
                        location.reload();
                    })
                    .catch(function (error) {

                    });
            },


            delId(index,row) {
                var videoId=row.videoId
                /*this.tableData.splice(index,1);*/


                this.$confirm('是否确认删除?', '提示', {
                    confirmButtonText: '确定',
                    cancelButtonText: '取消',
                    type: 'warning'
                }).then(() => {
                    axios.post('/WJF/delVideo?videoId='+videoId,{
                    }).then(function (res)  {
                        location.reload();
                    }).catch(function (error) {
                    });
                }).catch(() => {
                        this.$message({
                        type: 'info',
                        message: '已取消'
                    });
                });

            },

           /*查看*/
            findById:function (row) {
                this.search2=true;
                var videoId=row.videoId;
                this.video=row;
                axios.post('/WJF/findById?videoId='+videoId,{
                }).then(function (res)  {

                }).catch(function (error) {
                });
            },

            findById3:function (row) {
                this.search4=true;
                var videoId=row.videoId;
                this.vide=row;
                axios.post('/WJF/findById?videoId='+videoId,{
                }).then(function (res)  {
                }).catch(function (error) {
                });
            },

        }
    });

</script>
</html>

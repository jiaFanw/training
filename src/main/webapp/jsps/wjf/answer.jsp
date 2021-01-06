<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>学生答题页面</title>
</head>
<script src="${pageContext.request.contextPath }/static/vue/vue.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/static/vue/element/index.css">
<script src="${pageContext.request.contextPath }/static/vue/element/index.js"></script>
<script src="${pageContext.request.contextPath }/static/vue/axios.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/vue/qs.js"></script>
<script src="${pageContext.request.contextPath }/static/js/jquery-3.4.1.min.js"></script>
<body>
<div id="answer">
    <el-row style="margin-top: 20px">
        <el-col :span="4"><div class="grid-content"></div></el-col>
        <el-col :span="16">
            <div style="border: 1px solid black;">
                <el-row>
                    <el-col :span="10"><div class="grid-content"></div></el-col>
                    <el-col :span="8"><div class="grid-content"><h2>{{testpapername}}</h2></div></el-col>
                    <el-col :span="6"><div class="grid-content" style="margin-top: 20px">
                        试题共<span style="color: red">{{tiShu}}</span>道，共<span style="color: red">{{follmark}}</span>分</div></el-col>
                </el-row>
                <el-row>
                    <el-col :span="1"><div class="grid-content"></div></el-col>
                    <el-col :span="23">
                        <div v-if="daXuanTi != ''" class="grid-content">
                            <h3>单选题</h3>
                            <span v-for="(daXuan,i) in daXuanTi">
                                {{i+1}},{{daXuan.questionname}}
                                <ul>
                                     <div v-if="biaoShi == ''">
                                        <el-radio-group v-model="danXuanAnswer[i]">
                                            <li style="list-style: none;"> <el-radio label="A" v-model="danXuanAnswer[daXuan.questionid]">{{daXuan.optiona}}</el-radio></li>
                                            <li style="list-style: none;"> <el-radio label="B" v-model="danXuanAnswer[daXuan.questionid]">{{daXuan.optionb}}</el-radio></li>
                                            <li style="list-style: none;"> <el-radio label="C" v-model="danXuanAnswer[daXuan.questionid]">{{daXuan.optionc}}</el-radio></li>
                                            <li style="list-style: none;"> <el-radio label="D" v-model="danXuanAnswer[daXuan.questionid]">{{daXuan.optiond}}</el-radio></li>
                                           </el-radio-group>
                                     </div>
                                    <div v-if="biaoShi != ''">
                                        <li style="list-style: none;"> <input type="radio" value="A" :name="danXuanAnswer[i]" disabled="disabled">{{daXuan.optiona}}</li>
                                        <li style="list-style: none;"> <input type="radio" value="B" :name="danXuanAnswer[i]" disabled="disabled">{{daXuan.optionb}}</li>
                                        <li style="list-style: none;"> <input type="radio" value="C" :name="danXuanAnswer[i]" disabled="disabled">{{daXuan.optionc}}</li>
                                        <li style="list-style: none;"> <input type="radio" value="D" :name="danXuanAnswer[i]" disabled="disabled">{{daXuan.optiond}}</li>
                                    </div>

                                </ul>
                                <div v-if="biaoShi != ''">
                                    <h4>答案：<span style="color: blue">{{daXuan.answer}}</span></h4>
                                    <h4>评卷结果：

                                        <span v-if="danFen[i] != 0" style="color: red">正确</span>
                                        <span v-if="danFen[i] == 0" style="color: red">错误</span>
                                        得分：{{danFen[i]}}
                                    </h4>
                                </div>
                                <h4>分值：<span style="color: red">{{daXuan.score}}</span></h4>
                            </span>
                        </div>
                        <div v-if="duoXuanTi != ''" class="grid-content">
                            <h3>多选题</h3>
                            <span v-for="(duoXuan,i) in duoXuanTi">
                                {{i+1}},{{duoXuan.questionname}}
                                <ul id="duo">
                                </ul>
                                <div v-if="biaoShi != ''">
                                    <h4>答案：<span style="color: blue">{{duoXuan.answer}}</span></h4>
                                    <h4>评卷结果：
                                        <span v-if="duoFen[i] != 0" style="color: red">正确</span>
                                        <span v-if="duoFen[i] == 0" style="color: red">错误</span>
                                        得分：{{duoFen[i]}}
                                    </h4>
                                </div>
                                <h4>分值：<span style="color: red">{{duoXuan.score}}</span></h4>
                            </span>
                        </div>
                        <div v-if="panDuanti != ''" class="grid-content">
                            <h3>判断题</h3>
                            <span v-for="(panDuan,i) in panDuanti">
                                {{i+1}},{{panDuan.questionname}}
                                <ul>
                                    <div v-if="biaoShi == ''">
                                    <el-radio-group v-model="panDuanAnswer[i]">
                                        <li style="list-style: none;"> <el-radio label="正确" name="panDuanAnswer[i]">正确</el-radio></li>
                                        <li style="list-style: none;"> <el-radio label="错误" name="panDuanAnswer[i]">错误</el-radio></li>
                                    </el-radio-group>
                                    </div>
                                    <div v-if="biaoShi != ''">
                                        <li style="list-style: none;"> <input type="radio" value="正确" :name="panDuanAnswer[i]" disabled="disabled">正确</li>
                                        <li style="list-style: none;"> <input type="radio" value="错误" :name="panDuanAnswer[i]" disabled="disabled">错误</li>
                                    </div>

                                </ul>
                                 <div v-if="biaoShi != ''">
                                    <h4>答案：<span style="color: blue">{{panDuan.answer}}</span></h4>
                                    <h4>评卷结果：
                                        <span v-if="panFen[i] != 0" style="color: red">正确</span>
                                        <span v-if="panFen[i] == 0" style="color: red">错误</span>
                                        得分：{{panFen[i]}}
                                    </h4>
                                </div>
                                <h4>分值：<span style="color: red">{{panDuan.score}}</span></h4>
                            </span>
                        </div>
                        <div v-if="tianKongTi != ''" class="grid-content">
                            <h3>填空题</h3>
                            <span v-for="(tianKong,i) in tianKongTi">
                                {{i+1}},{{tianKong.questionname}}<br/>
                                <div v-if="biaoShi == ''">
                                    填空答案：<input type="text" :name="tianKongAnswer[i]">
                                </div>
                                 <div v-if="biaoShi != ''">
                                     填空答案：<input type="text" :name="tianKongAnswer[i]" disabled="disabled">
                                    <h4>答案：<span style="color: blue">{{tianKong.answer}}</span></h4>
                                     <h4>
                                        得分：
                                         <span v-if="biaoShi == 'pigai'">
                                            <input type="text" :name="tianKongFen[i]" style="width: 30px">
                                         </span>
                                         <span v-if="biaoShi == 'chaKan'">
                                             {{tianKongFen[i]}}
                                         </span>
                                    </h4>
                                </div>
                                <h4>分值：<span style="color: red">{{tianKong.score}}</span></h4>
                            </span>
                        </div>
                        <div v-if="jianDaTi != ''" class="grid-content">
                            <h3>简答题</h3>
                            <span v-for="(jianDa,i) in jianDaTi">
                                {{i+1}},{{jianDa.questionname}}
                                <div v-if="biaoShi == ''">
                                    <input type="textarea" :name="jianDaAnswer[i]">
                                </div>
                                <div v-if="biaoShi != ''">
                                     <input type="textarea" :name="jianDaAnswer[i]" disabled="disabled">
                                    <h4>答案：<span style="color: blue">{{jianDa.answer}}</span></h4>
                                    <h4>
                                        得分：
                                        <span v-if="biaoShi == 'pigai'">
                                            <input type="text" :name="jianDaFen[i]" style="width: 30px">
                                         </span>
                                         <span v-if="biaoShi == 'chaKan'">
                                             {{jianDaFen[i]}}
                                         </span>
                                    </h4>
                                </div>
                                <h4>分值：<span style="color: red">{{jianDa.score}}</span></h4>
                            </span>
                        </div>
                    </el-col>
                </el-row>
                <el-row>

                    <div v-if="biaoShi == ''">
                        <el-col :span="10"><div class="grid-content"></div></el-col>
                        <el-col :span="8"><div class="grid-content"><el-button type="success" style="width: 200px" @click="jiaoJuan">交卷</el-button></div></el-col>
                        <el-col :span="6"><div class="grid-content"></div></el-col>
                    </div>
                    <div v-if="biaoShi == 'pigai'">
                        <el-col :span="6"><div class="grid-content"></div></el-col>
                        <el-col :span="8"><div class="grid-content"><el-button type="success" style="width: 200px">返回</el-button></div></el-col>
                        <el-col :span="10"><div class="grid-content"><el-button type="success" style="width: 200px" @click="panJuan">判卷完成</el-button></div></el-col>
                    </div>
                    <div v-if="biaoShi == 'chaKan'">
                        <el-col :span="10"><div class="grid-content"></div></el-col>
                        <el-col :span="8"><div class="grid-content"><el-button type="success" style="width: 200px" @click="back">返回</el-button></div></el-col>
                        <el-col :span="6"><div class="grid-content"></div></el-col>
                    </div>
                </el-row>
            </div>
        </el-col>
        <el-col :span="4"><div class="grid-content bg-purple"></div></el-col>
    </el-row>
</div>
</body>
<style>
    .grid-content {
        border-radius: 4px;
        min-height: 36px;
    }
</style>
<script>
    //获取路径中的参数
    function getQueryString(name) {
        var reg = new RegExp('(^|&)' + name + '=([^&]*)(&|$)', 'i');
        var r = window.location.search.substr(1).match(reg);
        if (r != null) {
            return unescape(r[2]);
        }
        return null;
    }



    new Vue({
        el: '#answer',
        data () {
            return {
                testpapername:'',//试卷名称
                tiShu:'',//当前试卷的题目数
                follmark:'',//试卷满分
                daXuanTi:[],//单选题
                duoXuanTi:[],//多选题
                panDuanti:[],//判断题
                tianKongTi:[],//填空题
                jianDaTi:[],//简答题
                testpaperid:'',//试卷id
                testId:'',//考试id
                userId:'',//用户id
                questionid:[],//单选题目id
                duoquestionid:[],//多选题目id
                panquestionid:[],//判断题目id
                tianKongQuestionId:[],//填空题目id
                jianDaQuestionId:[],//简答题目id
                jianDaAnswer:[],//简答题填写内容
                jianDaNum:'',//简答题数目
                danXuanAnswer:[],//单选题填写内容
                danXuantiNum:'',//单选题数目
                duoXuanAnswer:[],//多选题填写内容
                duoXuanNum:'',//多选题数目
                panDuanAnswer:[],//判断题填写内容
                panDuanNum:'',//判断题数目
                tianKongAnswer:[],//填空题填写内容
                tianKongNum:'',//填空题数目
                score:[],//每道题分数
                answer:[],
                biaoShi:'',//跳转页面的标识
                tianKongFen:[],//填空题得分
                jianDaFen:[],//简答题得分
                danFen:[],//单选题得分
                duoFen:[],//多选题得分
                panFen:[]//判断题得分


            }
        },
        beforeCreate() {
            //加载多选题
            var _this = this;
            _this.testpaperid = getQueryString("testpaperid");
            axios
                .post("/WJF/duoXuan/"+_this.testpaperid)
                .then(function (res) {
                    _this.duoXuanTi=res.data;
                    _this.duoXuanNum= _this.duoXuanTi.length;
                    var aa = "";
                    for (var i =0;i< _this.duoXuanTi.length;i++) {
                        aa+="<li style='list-style: none;'><input type='checkbox' value='A' name='duoXuanAnswer"+i+"'>"+_this.duoXuanTi[i].optiona
                        aa+="</li><li style='list-style: none;'><input type='checkbox' value='B' name='duoXuanAnswer"+i+"'>"+_this.duoXuanTi[i].optionb
                        aa+="</li><li style='list-style: none;'><input type='checkbox' value='C' name='duoXuanAnswer"+i+"'>"+_this.duoXuanTi[i].optionc
                        aa+="</li><li style='list-style: none;'><input type='checkbox' value='D' name='duoXuanAnswer"+i+"'>"+_this.duoXuanTi[i].optiond+"</li>"
                    }
                    $("#duo").append(aa);

                })

        },
        created() {
            //加载多选题
            var _this = this;
            _this.testpaperid = getQueryString("testpaperid");
            axios
                .post("/WJF/duoXuan/"+_this.testpaperid)
                .then(function (res) {
                    _this.duoXuanTi=res.data;
                    _this.duoXuanNum= _this.duoXuanTi.length;
                    var aa = "";
                    for (var i =0;i< _this.duoXuanTi.length;i++) {
                        _this.duoquestionid.push(_this.duoXuanTi[i].questionid)
                        _this.score.push(_this.duoXuanTi[i].score)
                        _this.answer.push(_this.duoXuanTi[i].questionid+","+_this.duoXuanTi[i].answer)
                        aa+="<li style='list-style: none;'><input type='checkbox' value='A' name='duoXuanAnswer"+i+"'>"+_this.duoXuanTi[i].optiona
                        aa+="</li><li style='list-style: none;'><input type='checkbox' value='B' name='duoXuanAnswer"+i+"'>"+_this.duoXuanTi[i].optionb
                        aa+="</li><li style='list-style: none;'><input type='checkbox' value='C' name='duoXuanAnswer"+i+"'>"+_this.duoXuanTi[i].optionc
                        aa+="</li><li style='list-style: none;'><input type='checkbox' value='D' name='duoXuanAnswer"+i+"'>"+_this.duoXuanTi[i].optiond+"</li>"
                    }
                    $("#duo").append(aa);

                })
        },
        //页面加载成功时完成
        mounted: function(){
            var _this = this;
            _this.testpaperid = getQueryString("testpaperid");
            //获取考试详细信息
            axios
                .post("/WJF/kaoShi/"+_this.testpaperid)
                .then(function (res) {
                    _this.testpapername=res.data.testpapername;
                    _this.tiShu=res.data.tiShu;
                    _this.follmark=res.data.follmark;
                })

            //单选题
            axios
                .post("/WJF/danXuan/"+_this.testpaperid)
                .then(function (res) {
                    _this.daXuanTi=res.data;
                    console.log(_this.daXuanTi)
                    _this.danXuantiNum=res.data.length;
                    for (var i =0;i< _this.daXuanTi.length;i++) {
                        _this.score.push(_this.daXuanTi[i].score)
                        _this.danXuanAnswer.push("danXuanAnswer"+_this.daXuanTi[i].questionid);
                        _this.questionid.push(_this.daXuanTi[i].questionid);
                        _this.answer.push(_this.daXuanTi[i].questionid+","+_this.daXuanTi[i].answer)
                    }

                })

            //判断题
            axios
                .post("/WJF/panDuan/"+_this.testpaperid)
                .then(function (res) {
                    _this.panDuanti=res.data;
                    _this.panDuanNum=_this.panDuanti.length;
                    for (var i =0;i< _this.panDuanti.length;i++) {
                        _this.score.push(_this.panDuanti[i].score)
                        _this.panDuanAnswer.push("panDuanAnswer"+i);
                        _this.panquestionid.push(_this.panDuanti[i].questionid)
                        _this.answer.push(_this.panDuanti[i].questionid+","+_this.panDuanti[i].answer)
                    }

                })
            //填空题
            axios
                .post("/WJF/tianKong/"+_this.testpaperid)
                .then(function (res) {
                    _this.tianKongTi=res.data;
                    _this.tianKongNum = _this.tianKongTi.length;
                    for (var i =0;i< _this.tianKongTi.length;i++) {
                        _this.tianKongAnswer.push("tianKongAnswer"+i);
                        _this.tianKongQuestionId.push(_this.tianKongTi[i].questionid)

                    }
                })
            //简答题
            axios
                .post("/WJF/jianDa/"+_this.testpaperid)
                .then(function (res) {
                    _this.jianDaTi=res.data;
                    _this.jianDaNum= _this.jianDaTi.length;
                    for (var i =0;i< _this.jianDaTi.length;i++) {
                        _this.jianDaAnswer.push("jianDaAnswer"+i);
                        _this.jianDaQuestionId.push(_this.jianDaTi[i].questionid)
                    }
                })


            var biao = getQueryString("biaoshi");
            if(biao == "pigai"){
                //biaoshi==pigai时，证明是判卷人登陆的，用于批改试卷
                _this.biaoShi="pigai";
                console.log(111)
                //获取员工的答案
                axios
                    .post("/WJF/userAnswer",{
                        testpaperid: _this.testpaperid,
                        userId: _this.userId,
                    })
                    .then(function (res) {
                        console.log(res.data)
                        var answerData = res.data;
                        for (var i = 0; i < answerData.length; i++) {

                            //员工答案单选
                            for (var j = 0; j < _this.danXuantiNum; j++) {
                                if((answerData[i].questionid) == _this.questionid[j]){
                                    _this.danFen.push(answerData[i].score);
                                    $("input:radio[value='"+answerData[i].useranswer+"']").attr("checked","true");
                                    //$("input:radio[value='"+answerData[i].useranswer+"'][name='danXuanAnswer'"+j+"]").attr("checked","true");
                                }
                            }

                            //员工多选题答案
                            for (var j = 0; j <_this.duoXuanNum ; j++) {
                                if((answerData[i].questionid) == _this.duoquestionid[j]){
                                    _this.duoFen.push(answerData[i].score);
                                    var a = answerData[i].useranswer;
                                    if(a.indexOf('A') !== -1) {
                                        $("input:checkbox[value='A'][name='duoXuanAnswer"+j+"']").attr("checked","true");
                                    }
                                    if(a.indexOf('B') !== -1){
                                        $("input:checkbox[value='B'][name='duoXuanAnswer"+j+"']").attr("checked","true");
                                    }
                                    if(a.indexOf('C') !== -1){
                                        $("input:checkbox[value='C'][name='duoXuanAnswer"+j+"']").attr("checked","true");
                                    }
                                    if(a.indexOf('D') !== -1){
                                        $("input:checkbox[value='D'][name='duoXuanAnswer"+j+"']").attr("checked","true");
                                    }
                                }
                            }

                            //员工判断题答案
                            for (var j = 0; j <_this.panDuanNum ; j++) {
                                if((answerData[i].questionid) == _this.panquestionid[j]){
                                    console.log("=======")
                                    _this.panFen.push(answerData[i].score);
                                    $("input:radio[value='"+answerData[i].useranswer+"'][name='panDuanAnswer"+j+"']").attr("checked","true");
                                    $("input[name='panFen"+j+"']").attr("value",answerData[i].score);
                                }
                            }

                            //员工填空题答案
                            for (var j = 0; j < _this.tianKongNum; j++) {
                                if((answerData[i].questionid) == _this.tianKongQuestionId[j]){
                                    _this.tianKongFen.push("tianKongFen"+j);
                                    $("input[name='tianKongAnswer"+j+"']").attr("value",answerData[i].useranswer);
                                }
                            }

                            //员工简答题答案
                            for (var j = 0; j < _this.jianDaNum; j++) {
                                if((answerData[i].questionid) == _this.jianDaQuestionId[j]){
                                    _this.jianDaFen.push("jianDaFen"+j);
                                    $("input[name='jianDaAnswer"+j+"']").attr("value",answerData[i].useranswer);
                                }
                            }
                        }
                    })
            }else if(biao == "chaKan"){
                //biaoshi==chaKan 时，证明是员工登陆，用于查看已经批改的答卷
                _this.biaoShi="chaKan";
                console.log(222)
                axios
                    .post("/WJF/userAnswer",{
                        testpaperid: _this.testpaperid,
                        userId: _this.userId,
                    })
                    .then(function (res) {
                        var answerData = res.data;
                        for (var i = 0; i < answerData.length; i++) {
                            for (var j = 0; j < _this.danXuantiNum; j++) {
                                if((answerData[i].questionid) == _this.questionid[j]){
                                    _this.danFen.push(answerData[i].score);
                                    $("input:radio[value='"+answerData[i].useranswer+"']").attr("checked","true");
                                    //$("input:radio[value='"+answerData[i].useranswer+"'][name='danXuanAnswer'"+j+"]").attr("checked","true");
                                }
                            }

                            for (var j = 0; j <_this.duoXuanNum ; j++) {
                                if((answerData[i].questionid) == _this.duoquestionid[j]){
                                    _this.duoFen.push(answerData[i].score);
                                    var a = answerData[i].useranswer;
                                    if(a.indexOf('A') !== -1) {
                                        $("input:checkbox[value='A'][name='duoXuanAnswer"+j+"']").attr("checked","true");
                                    }
                                    if(a.indexOf('B') !== -1){
                                        $("input:checkbox[value='B'][name='duoXuanAnswer"+j+"']").attr("checked","true");
                                    }
                                    if(a.indexOf('C') !== -1){
                                        $("input:checkbox[value='C'][name='duoXuanAnswer"+j+"']").attr("checked","true");
                                    }
                                    if(a.indexOf('D') !== -1){
                                        $("input:checkbox[value='D'][name='duoXuanAnswer"+j+"']").attr("checked","true");
                                    }
                                }
                            }

                            for (var j = 0; j <_this.panDuanNum ; j++) {
                                if((answerData[i].questionid) == _this.panquestionid[j]){
                                    _this.panFen.push(answerData[i].score);
                                    $("input:radio[value='"+answerData[i].useranswer+"'][name='panDuanAnswer"+j+"']").attr("checked","true");
                                    $("input[name='panFen"+j+"']").attr("value",answerData[i].score);
                                }
                            }

                            for (var j = 0; j < _this.tianKongNum; j++) {
                                if((answerData[i].questionid) == _this.tianKongQuestionId[j]){
                                    _this.tianKongFen.push(answerData[i].score);
                                    $("input[name='tianKongAnswer"+j+"']").attr("value",answerData[i].useranswer);
                                }
                            }

                            for (var j = 0; j < _this.jianDaNum; j++) {
                                if((answerData[i].questionid) == _this.jianDaQuestionId[j]){
                                    _this.jianDaFen.push(answerData[i].score);
                                    $("input[name='jianDaAnswer"+j+"']").attr("value",answerData[i].useranswer);
                                }
                            }
                        }
                    })
            }




        },
        /*方法函数  事件等*/
        methods: {
            //返回上一步
            back(){
                window.history.go(-1)
            },

            //员工考试完成，交卷
            jiaoJuan() {
                var num = getQueryString("num");
                var _this = this;
                var daAn = [];
                var defen = 0;
                var duo = '';
                //获取多选题选中的答案
                for (var i = 0; i <_this.duoXuanNum ; i++) {
                    var name = document.getElementsByName("duoXuanAnswer"+i);
                    for(var j=0;j<name.length;j++){
                        if(name[j].checked==true){
                            duo+=name[j].value;
                        }
                    }
                    daAn.push(_this.duoquestionid[i]+","+duo)
                }

                for (var i = 0; i < _this.danXuantiNum; i++) {
                    daAn.push(_this.questionid[i]+","+_this.danXuanAnswer[i])
                }
                for (var i = 0; i < _this.panDuanNum; i++) {
                    daAn.push(_this.panquestionid[i]+","+_this.panDuanAnswer[i])
                }

                for (var i = 0; i < _this.tianKongNum; i++) {
                    var tian = $("input[name='tianKongAnswer"+i+"']").val();
                    daAn.push(_this.tianKongQuestionId[i]+","+tian)
                }
                for (var i = 0; i < _this.jianDaNum; i++) {
                    var jian = $("input[name='jianDaAnswer"+i+"']").val();
                    daAn.push(_this.jianDaQuestionId[i]+","+jian)
                }
                var c = [];
                console.log(daAn)
                for (var i = 0; i < daAn.length; i++) {
                    if(_this.answer.indexOf(daAn[i]) > -1){
                        c.push(daAn[i]+","+_this.score[i])
                        console.log("------------------------------------")
                        console.log(c)
                    }else {
                        c.push(daAn[i]+","+ 0)
                    }

                }
                 var _this = this;
                 _this.userId = getQueryString("userId");

                this.$confirm('是否确认交卷?', '提示', {
                    confirmButtonText: '确定',
                    cancelButtonText: '取消',
                    type: 'warning'
                }).then(() => {
                    axios
                    .post('/WJF/jiaoJuan', {
                        testpaperid: _this.testpaperid,
                        userId: _this.userId,
                        daAn:c,
                        num:num
                    })
                    .then(function (res) {
                        location.href = "/jsps/wjf/jiaoJuanSuccess.jsp";
                    });
            }).catch(() => {
                    this.$message({
                    type: 'info',
                    message: '已取消'
                });
            });
            },


            //判卷人批改试卷完成
            panJuan(){
                var _this = this;
                var a = [];
                for (var i = 0; i < _this.tianKongNum; i++) {
                    var tianKongFen = $("input[name='tianKongFen"+i+"']").val();
                    a.push(_this.tianKongQuestionId[i]+","+tianKongFen)
                }

                for (var i = 0; i < _this.jianDaNum; i++) {
                    var jianDaFen = $("input[name='jianDaFen"+i+"']").val();
                    a.push(_this.jianDaQuestionId[i]+","+jianDaFen);
                }

                console.log(a)
                _this.userId = getQueryString("userId");
                axios
                    .post('/WJF/panJuan', {
                        testpaperid: _this.testpaperid,
                        userId: _this.userId,
                        fen:a,
                    })
                    .then(function (res) {
                        location.href="/jsps/wjf/center_detail.jsp?testpaperid="+_this.testpaperid

                    });


            }
        }
    });

</script>
</html>

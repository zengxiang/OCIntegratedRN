/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 * @flow
 */
import React, { Component } from 'react';
import CodePush from "react-native-code-push";
import {
  Platform,
  AppRegistry,
  StyleSheet,
  Text,
  View,
  TouchableHighlight,
} from 'react-native';

const instructions = Platform.select({
  ios: 'Press Cmd+R to reload,\n' +
    'Cmd+D or shake for dev menu',
  android: 'Double tap R on your keyboard to reload,\n' +
    'Shake or press menu button for dev menu',
});
export default class App extends Component<{}> {
// 初始化
constructor(props) {
  super(props);
  this.state={
    callBackSuccess:false,
    callBackItems:null,
  };
}

componentDidMount(){
      CodePush.notifyAppReady();
      CodePush.sync(
          {ignoreFailedUpdates: false},
      );
  }
render() {
  var { NativeModules } = require('react-native');
  //创建原生模块实例,NativeModules 是 react-native 文件夹下实例，hans是RCT_EXPORT_MODULE(hans); OC设定的
  var RNBridgeModule=NativeModules.hans;

  var contents = this.props["scores"].map(
    score => <Text key={score.name}>{score.name}:{score.value}{"\n"}</Text>
  );
  var callBackContents = this.state.callBackSuccess ? this.state.callBackItems.map(
    score => <Text key={score.name}>{score.name}:{score.value}{"\n"}</Text>
  ) : null;

  return (
    <View style={styles.container}>

      <TouchableHighlight style={styles.btnBack} underlayColor="#eee" onPress={() => {
          //方法调用 transportMessage要和OC设定的一样   这样写会跳转{'method:'push', name':'华南犀牛','url':'http://www.jianshu.com/u/5d91572789ad'}   
        RNBridgeModule.transportMessage({'name':'华南犀牛','url':'http://www.jianshu.com/u/5d91572789ad'});
      }}>
          <Text style={{color:'#ffffff'}}>我是新的back回上层VC</Text>
        </TouchableHighlight>

        <TouchableHighlight style={styles.btnFetch} underlayColor="#eee" onPress={()=>{RNBridgeModule.RNInvokeOCCallBack(
          //方法调用 RNInvokeOCCallBack 要和OC设定的一样，并把下面这个字典传给OC
          {'name':'华南犀牛','url':'http://www.jianshu.com/u/5d91572789ad'},
          // 回调方法，从OC中获取events数组
          (error,events)=>{
              if(error){
                console.error(error);
              }else{
                this.setState({callBackItems:events, callBackSuccess:true});
              }
        })}}>
          <Text style={{color:'#ffffff'}}>获取原生中数据</Text>
        </TouchableHighlight>

      <Text style={styles.scores}>
        {this.state.callBackSuccess ? callBackContents : contents }
      </Text>
    </View>
  );
}
}

let codePushOptions = { checkFrequency: CodePush.CheckFrequency.MANUAL };

App = CodePush(codePushOptions)(App);

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#FFFFFF',
  },
  scores: {
    fontSize: 20,
    textAlign: 'center',
    color: '#333333',
    margin: 15,
  },
  btnBack:{
    width: 150,
    height: 40,
    borderRadius: 20,
    backgroundColor: "red",
    alignItems: "center",
    justifyContent: "center",
    marginTop: 15,
  },
  btnFetch:{
    width: 150,
    height: 40,
    borderRadius: 20,
    backgroundColor: "blue",
    alignItems: "center",
    justifyContent: "center",
    marginTop: 15,
  },
});

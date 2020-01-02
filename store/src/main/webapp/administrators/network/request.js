 function request(config) {

    const instance=axios.create({
        baseURI:"localhost:8080",
        timeout: 500
    })

    //请求拦截器
    instance.interceptors.request.use(config=>{
        return config;
    },error=>{
        console.log(error);
    })

    //响应拦截器
    instance.interceptors.response.use(res=>{
        return res.data;
    },error=>{
        console.log(error);
    })

    return instance(config);
}
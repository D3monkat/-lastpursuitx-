const mu=function(){const e=document.createElement("link").relList;if(e&&e.supports&&e.supports("modulepreload"))return;for(const i of document.querySelectorAll('link[rel="modulepreload"]'))n(i);new MutationObserver(i=>{for(const s of i)if(s.type==="childList")for(const a of s.addedNodes)a.tagName==="LINK"&&a.rel==="modulepreload"&&n(a)}).observe(document,{childList:!0,subtree:!0});function t(i){const s={};return i.integrity&&(s.integrity=i.integrity),i.referrerpolicy&&(s.referrerPolicy=i.referrerpolicy),i.crossorigin==="use-credentials"?s.credentials="include":i.crossorigin==="anonymous"?s.credentials="omit":s.credentials="same-origin",s}function n(i){if(i.ep)return;i.ep=!0;const s=t(i);fetch(i.href,s)}};mu();function _e(){}const Ec=r=>r;function _u(r,e){for(const t in e)r[t]=e[t];return r}function Lc(r){return r()}function Aa(){return Object.create(null)}function xt(r){r.forEach(Lc)}function ga(r){return typeof r=="function"}function He(r,e){return r!=r?e==e:r!==e||r&&typeof r=="object"||typeof r=="function"}function gu(r){return Object.keys(r).length===0}function bu(r,...e){if(r==null)return _e;const t=r.subscribe(...e);return t.unsubscribe?()=>t.unsubscribe():t}function ft(r,e,t){r.$$.on_destroy.push(bu(e,t))}function is(r){return r??""}function vu(r,e,t){return r.set(t),e}const Pc=typeof window<"u";let Ac=Pc?()=>window.performance.now():()=>Date.now(),ba=Pc?r=>requestAnimationFrame(r):_e;const ki=new Set;function Dc(r){ki.forEach(e=>{e.c(r)||(ki.delete(e),e.f())}),ki.size!==0&&ba(Dc)}function Rc(r){let e;return ki.size===0&&ba(Dc),{promise:new Promise(t=>{ki.add(e={c:r,f:t})}),abort(){ki.delete(e)}}}function E(r,e){r.appendChild(e)}function kc(r){if(!r)return document;const e=r.getRootNode?r.getRootNode():r.ownerDocument;return e&&e.host?e:r.ownerDocument}function yu(r){const e=z("style");return wu(kc(r),e),e.sheet}function wu(r,e){E(r.head||r,e)}function B(r,e,t){r.insertBefore(e,t||null)}function U(r){r.parentNode.removeChild(r)}function Pt(r,e){for(let t=0;t<r.length;t+=1)r[t]&&r[t].d(e)}function z(r){return document.createElement(r)}function Ii(r){return document.createElementNS("http://www.w3.org/2000/svg",r)}function J(r){return document.createTextNode(r)}function Z(){return J(" ")}function Ft(){return J("")}function ze(r,e,t,n){return r.addEventListener(e,t,n),()=>r.removeEventListener(e,t,n)}function P(r,e,t){t==null?r.removeAttribute(e):r.getAttribute(e)!==t&&r.setAttribute(e,t)}function Ic(r){return r===""?null:+r}function Mu(r){return Array.from(r.childNodes)}function pe(r,e){e=""+e,r.wholeText!==e&&(r.data=e)}function Nt(r,e){r.value=e??""}function Bn(r,e,t,n){t===null?r.style.removeProperty(e):r.style.setProperty(e,t,n?"important":"")}function Da(r,e){for(let t=0;t<r.options.length;t+=1){const n=r.options[t];if(n.__value===e){n.selected=!0;return}}r.selectedIndex=-1}function xu(r){const e=r.querySelector(":checked")||r.options[0];return e&&e.__value}function Nc(r,e,{bubbles:t=!1,cancelable:n=!1}={}){const i=document.createEvent("CustomEvent");return i.initCustomEvent(r,t,n,e),i}const rs=new Map;let ss=0;function Su(r){let e=5381,t=r.length;for(;t--;)e=(e<<5)-e^r.charCodeAt(t);return e>>>0}function Cu(r,e){const t={stylesheet:yu(e),rules:{}};return rs.set(r,t),t}function sa(r,e,t,n,i,s,a,o=0){const l=16.666/n;let c=`{
`;for(let _=0;_<=1;_+=l){const g=e+(t-e)*s(_);c+=_*100+`%{${a(g,1-g)}}
`}const u=c+`100% {${a(t,1-t)}}
}`,f=`__svelte_${Su(u)}_${o}`,d=kc(r),{stylesheet:p,rules:m}=rs.get(d)||Cu(d,r);m[f]||(m[f]=!0,p.insertRule(`@keyframes ${f} ${u}`,p.cssRules.length));const h=r.style.animation||"";return r.style.animation=`${h?`${h}, `:""}${f} ${n}ms linear ${i}ms 1 both`,ss+=1,f}function zc(r,e){const t=(r.style.animation||"").split(", "),n=t.filter(e?s=>s.indexOf(e)<0:s=>s.indexOf("__svelte")===-1),i=t.length-n.length;i&&(r.style.animation=n.join(", "),ss-=i,ss||Tu())}function Tu(){ba(()=>{ss||(rs.forEach(r=>{const{stylesheet:e}=r;let t=e.cssRules.length;for(;t--;)e.deleteRule(t);r.rules={}}),rs.clear())})}function wr(r,e,t,n){if(!e)return _e;const i=r.getBoundingClientRect();if(e.left===i.left&&e.right===i.right&&e.top===i.top&&e.bottom===i.bottom)return _e;const{delay:s=0,duration:a=300,easing:o=Ec,start:l=Ac()+s,end:c=l+a,tick:u=_e,css:f}=t(r,{from:e,to:i},n);let d=!0,p=!1,m;function h(){f&&(m=sa(r,0,1,a,s,o,f)),s||(p=!0)}function _(){f&&zc(r,m),d=!1}return Rc(g=>{if(!p&&g>=l&&(p=!0),p&&g>=c&&(u(1,0),_()),!d)return!1;if(p){const v=g-l,b=0+1*o(v/a);u(b,1-b)}return!0}),h(),u(0,1),_}function Mr(r){const e=getComputedStyle(r);if(e.position!=="absolute"&&e.position!=="fixed"){const{width:t,height:n}=e,i=r.getBoundingClientRect();r.style.position="absolute",r.style.width=t,r.style.height=n,Eu(r,i)}}function Eu(r,e){const t=r.getBoundingClientRect();if(e.left!==t.left||e.top!==t.top){const n=getComputedStyle(r),i=n.transform==="none"?"":n.transform;r.style.transform=`${i} translate(${e.left-t.left}px, ${e.top-t.top}px)`}}let mr;function fr(r){mr=r}function va(){if(!mr)throw new Error("Function called outside component initialization");return mr}function ct(r){va().$$.on_mount.push(r)}function Lu(r){va().$$.on_destroy.push(r)}function ln(){const r=va();return(e,t,{cancelable:n=!1}={})=>{const i=r.$$.callbacks[e];if(i){const s=Nc(e,t,{cancelable:n});return i.slice().forEach(a=>{a.call(r,s)}),!s.defaultPrevented}return!0}}const sr=[],Ra=[],$r=[],ka=[],Pu=Promise.resolve();let aa=!1;function Au(){aa||(aa=!0,Pu.then(Fc))}function fi(r){$r.push(r)}const Ss=new Set;let Lr=0;function Fc(){const r=mr;do{for(;Lr<sr.length;){const e=sr[Lr];Lr++,fr(e),Du(e.$$)}for(fr(null),sr.length=0,Lr=0;Ra.length;)Ra.pop()();for(let e=0;e<$r.length;e+=1){const t=$r[e];Ss.has(t)||(Ss.add(t),t())}$r.length=0}while(sr.length);for(;ka.length;)ka.pop()();aa=!1,Ss.clear(),fr(r)}function Du(r){if(r.fragment!==null){r.update(),xt(r.before_update);const e=r.dirty;r.dirty=[-1],r.fragment&&r.fragment.p(r.ctx,e),r.after_update.forEach(fi)}}let Zi;function Ru(){return Zi||(Zi=Promise.resolve(),Zi.then(()=>{Zi=null})),Zi}function Cs(r,e,t){r.dispatchEvent(Nc(`${e?"intro":"outro"}${t}`))}const es=new Set;let Nn;function De(){Nn={r:0,c:[],p:Nn}}function Re(){Nn.r||xt(Nn.c),Nn=Nn.p}function D(r,e){r&&r.i&&(es.delete(r),r.i(e))}function I(r,e,t,n){if(r&&r.o){if(es.has(r))return;es.add(r),Nn.c.push(()=>{es.delete(r),n&&(t&&r.d(1),n())}),r.o(e)}else n&&n()}const ku={duration:0};function as(r,e,t,n){let i=e(r,t),s=n?0:1,a=null,o=null,l=null;function c(){l&&zc(r,l)}function u(d,p){const m=d.b-s;return p*=Math.abs(m),{a:s,b:d.b,d:m,duration:p,start:d.start,end:d.start+p,group:d.group}}function f(d){const{delay:p=0,duration:m=300,easing:h=Ec,tick:_=_e,css:g}=i||ku,v={start:Ac()+p,b:d};d||(v.group=Nn,Nn.r+=1),a||o?o=v:(g&&(c(),l=sa(r,s,d,m,p,h,g)),d&&_(0,1),a=u(v,m),fi(()=>Cs(r,d,"start")),Rc(b=>{if(o&&b>o.start&&(a=u(o,m),o=null,Cs(r,a.b,"start"),g&&(c(),l=sa(r,s,a.b,a.duration,0,h,i.css))),a){if(b>=a.end)_(s=a.b,1-s),Cs(r,a.b,"end"),o||(a.b?c():--a.group.r||xt(a.group.c)),a=null;else if(b>=a.start){const w=b-a.start;s=a.a+a.d*h(w/a.duration),_(s,1-s)}}return!!(a||o)}))}return{run(d){ga(i)?Ru().then(()=>{i=i(),f(d)}):f(d)},end(){c(),a=o=null}}}function Iu(r,e){r.d(1),e.delete(r.key)}function Nu(r,e){I(r,1,1,()=>{e.delete(r.key)})}function zu(r,e){r.f(),Iu(r,e)}function hs(r,e){r.f(),Nu(r,e)}function xr(r,e,t,n,i,s,a,o,l,c,u,f){let d=r.length,p=s.length,m=d;const h={};for(;m--;)h[r[m].key]=m;const _=[],g=new Map,v=new Map;for(m=p;m--;){const x=f(i,s,m),S=t(x);let M=a.get(S);M?n&&M.p(x,e):(M=c(S,x),M.c()),g.set(S,_[m]=M),S in h&&v.set(S,Math.abs(m-h[S]))}const b=new Set,w=new Set;function y(x){D(x,1),x.m(o,u),a.set(x.key,x),u=x.first,p--}for(;d&&p;){const x=_[p-1],S=r[d-1],M=x.key,T=S.key;x===S?(u=x.first,d--,p--):g.has(T)?!a.has(M)||b.has(M)?y(x):w.has(T)?d--:v.get(M)>v.get(T)?(w.add(M),y(x)):(b.add(T),d--):(l(S,a),d--)}for(;d--;){const x=r[d];g.has(x.key)||l(x,a)}for(;p;)y(_[p-1]);return _}function Fu(r,e){const t={},n={},i={$$scope:1};let s=r.length;for(;s--;){const a=r[s],o=e[s];if(o){for(const l in a)l in o||(n[l]=1);for(const l in o)i[l]||(t[l]=o[l],i[l]=1);r[s]=o}else for(const l in a)i[l]=1}for(const a in n)a in t||(t[a]=void 0);return t}function Ou(r){return typeof r=="object"&&r!==null?r:{}}function ee(r){r&&r.c()}function Q(r,e,t,n){const{fragment:i,on_mount:s,on_destroy:a,after_update:o}=r.$$;i&&i.m(e,t),n||fi(()=>{const l=s.map(Lc).filter(ga);a?a.push(...l):xt(l),r.$$.on_mount=[]}),o.forEach(fi)}function $(r,e){const t=r.$$;t.fragment!==null&&(xt(t.on_destroy),t.fragment&&t.fragment.d(e),t.on_destroy=t.fragment=null,t.ctx=[])}function Uu(r,e){r.$$.dirty[0]===-1&&(sr.push(r),Au(),r.$$.dirty.fill(0)),r.$$.dirty[e/31|0]|=1<<e%31}function We(r,e,t,n,i,s,a,o=[-1]){const l=mr;fr(r);const c=r.$$={fragment:null,ctx:null,props:s,update:_e,not_equal:i,bound:Aa(),on_mount:[],on_destroy:[],on_disconnect:[],before_update:[],after_update:[],context:new Map(e.context||(l?l.$$.context:[])),callbacks:Aa(),dirty:o,skip_bound:!1,root:e.target||l.$$.root};a&&a(c.root);let u=!1;if(c.ctx=t?t(r,e.props||{},(f,d,...p)=>{const m=p.length?p[0]:d;return c.ctx&&i(c.ctx[f],c.ctx[f]=m)&&(!c.skip_bound&&c.bound[f]&&c.bound[f](m),u&&Uu(r,f)),d}):[],c.update(),u=!0,xt(c.before_update),c.fragment=n?n(c.ctx):!1,e.target){if(e.hydrate){const f=Mu(e.target);c.fragment&&c.fragment.l(f),f.forEach(U)}else c.fragment&&c.fragment.c();e.intro&&D(r.$$.fragment),Q(r,e.target,e.anchor,e.customElement),Fc()}fr(l)}class Xe{$destroy(){$(this,1),this.$destroy=_e}$on(e,t){const n=this.$$.callbacks[e]||(this.$$.callbacks[e]=[]);return n.push(t),()=>{const i=n.indexOf(t);i!==-1&&n.splice(i,1)}}$set(e){this.$$set&&!gu(e)&&(this.$$.skip_bound=!0,this.$$set(e),this.$$.skip_bound=!1)}}const _i=[];function Ia(r,e){return{subscribe:Fn(r,e).subscribe}}function Fn(r,e=_e){let t;const n=new Set;function i(o){if(He(r,o)&&(r=o,t)){const l=!_i.length;for(const c of n)c[1](),_i.push(c,r);if(l){for(let c=0;c<_i.length;c+=2)_i[c][0](_i[c+1]);_i.length=0}}}function s(o){i(o(r))}function a(o,l=_e){const c=[o,l];return n.add(c),n.size===1&&(t=e(i)||_e),o(r),()=>{n.delete(c),n.size===0&&(t(),t=null)}}return{set:i,update:s,subscribe:a}}async function Pe(r,e={}){const t={method:"post",headers:{"Content-Type":"application/json; charset=UTF-8"},body:JSON.stringify(e)},n="snipe-menu";try{return await(await fetch(`https://${n}/${r}`,t)).json()}catch{}}const Bu=()=>{const r={showReport:Fn(!1),reportData:Fn({})};return{...r,...{closeReportForm(t=null){r.showReport.set(!1),Pe("closeReport",t)},showReportForm(t){r.showReport.set(!0),r.reportData.set(t)}}}},_r=Bu(),Vu=await fetch("config.json").then(r=>r.json()).catch(r=>console.log(r)),Gu=await fetch(`locales/${Vu.lang}.json`).then(r=>r.json()).catch(r=>console.log(r)),Hu=()=>{new Date().getFullYear();const r={show:Fn(!1),data:Fn({}),locales:Ia(Gu),isDev:Ia(!1)},e={closeForm(t=null){r.show.set(!1),Pe("closeMenu",t)},toggleFocus(t=null){Pe("toggleFocus",t)},showForm(t){r.show.set(!0),r.data.set(t)},handleKeyUp(t){t.key=="Escape"&&(e.closeForm(),_r.closeReportForm()),t.key=="Alt"&&e.toggleFocus()}};return{...r,...e}},yt=Hu(),Wu=()=>{const r={unreadReport:Fn(!1)};return{...r,...{showUnreadReport(){r.unreadReport.set(!0)},hideUnreadReport(t=null){r.unreadReport.set(!1)}}}},oa=Wu(),Xu=()=>{const r={showObject:Fn(!1),gizmoData:Fn({}),gizmoCamData:Fn({})};return{...r,...{closeGizmoObject(t=null){r.showObject.set(!1)},showGizmoObject(t){t.handle&&r.showObject.set(!0),r.gizmoData.set(t)},getCamCoords(t){r.gizmoCamData.set(t)}}}},dr=Xu();function ju(r){const e=document.createElement("textarea");e.value=r,document.body.appendChild(e),e.select(),document.execCommand("copy"),document.body.removeChild(e)}function qu(){function r(e){switch(e.data.action){case"openMenu":yt.showForm(e.data.data);break;case"forceClose":yt.closeForm();break;case"copytoclipboard":ju(e.data.data);break;case"openUserReportMenu":_r.showReportForm(e.data.data);break;case"forceCloseUserReportMenu":_r.closeReportForm();break;case"showUnreadReport":oa.showUnreadReport();break;case"hideUnreadReport":oa.hideUnreadReport();break;case"showGizmoObject":dr.showGizmoObject(e.data.data);break;case"hideGizmoObject":dr.closeGizmoObject();break;case"gizmo-cam-cords":dr.getCamCoords(e.data.data);break}}ct(()=>window.addEventListener("message",r)),Lu(()=>window.removeEventListener("message",r))}const Pr=parseFloat;function os(r,e=";"){let t;if(Array.isArray(r))t=r.filter(n=>n);else{t=[];for(const n in r)r[n]&&t.push(`${n}:${r[n]}`)}return t.join(e)}function Yu(r,e,t,n){let i,s;const a="1em";let o,l,c,u="-.125em";const f="visible";return n&&(c="center",s="1.25em"),t&&(i=t),e&&(e=="lg"?(l="1.33333em",o=".75em",u="-.225em"):e=="xs"?l=".75em":e=="sm"?l=".875em":l=e.replace("x","em")),os([os({float:i,width:s,height:a,"line-height":o,"font-size":l,"text-align":c,"vertical-align":u,"transform-origin":"center",overflow:f}),r])}function Zu(r,e,t,n,i,s=1,a="",o=""){let l=1,c=1;return i&&(i=="horizontal"?l=-1:i=="vertical"?c=-1:l=c=-1),os([`translate(${Pr(e)*s}${a},${Pr(t)*s}${a})`,`scale(${l*Pr(r)},${c*Pr(r)})`,n&&`rotate(${n}${o})`]," ")}function Na(r){let e,t,n,i,s,a,o;function l(f,d){return typeof f[7][4]=="string"?Ju:Ku}let c=l(r),u=c(r);return{c(){e=Ii("svg"),t=Ii("g"),n=Ii("g"),u.c(),P(n,"transform",r[10]),P(t,"transform",i=`translate(${r[7][0]/2} ${r[7][1]/2})`),P(t,"transform-origin",s=`${r[7][0]/4} 0`),P(e,"id",r[0]),P(e,"class",a=is(r[8])+" svelte-1cj2gr0"),P(e,"style",r[9]),P(e,"viewBox",o=`0 0 ${r[7][0]} ${r[7][1]}`),P(e,"aria-hidden","true"),P(e,"role","img"),P(e,"xmlns","http://www.w3.org/2000/svg")},m(f,d){B(f,e,d),E(e,t),E(t,n),u.m(n,null)},p(f,d){c===(c=l(f))&&u?u.p(f,d):(u.d(1),u=c(f),u&&(u.c(),u.m(n,null))),d&1024&&P(n,"transform",f[10]),d&128&&i!==(i=`translate(${f[7][0]/2} ${f[7][1]/2})`)&&P(t,"transform",i),d&128&&s!==(s=`${f[7][0]/4} 0`)&&P(t,"transform-origin",s),d&1&&P(e,"id",f[0]),d&256&&a!==(a=is(f[8])+" svelte-1cj2gr0")&&P(e,"class",a),d&512&&P(e,"style",f[9]),d&128&&o!==(o=`0 0 ${f[7][0]} ${f[7][1]}`)&&P(e,"viewBox",o)},d(f){f&&U(e),u.d()}}}function Ku(r){let e,t,n,i,s,a,o,l,c,u;return{c(){e=Ii("path"),a=Ii("path"),P(e,"d",t=r[7][4][0]),P(e,"fill",n=r[3]||r[1]||"currentColor"),P(e,"fill-opacity",i=r[6]!=!1?r[4]:r[5]),P(e,"transform",s=`translate(${r[7][0]/-2} ${r[7][1]/-2})`),P(a,"d",o=r[7][4][1]),P(a,"fill",l=r[2]||r[1]||"currentColor"),P(a,"fill-opacity",c=r[6]!=!1?r[5]:r[4]),P(a,"transform",u=`translate(${r[7][0]/-2} ${r[7][1]/-2})`)},m(f,d){B(f,e,d),B(f,a,d)},p(f,d){d&128&&t!==(t=f[7][4][0])&&P(e,"d",t),d&10&&n!==(n=f[3]||f[1]||"currentColor")&&P(e,"fill",n),d&112&&i!==(i=f[6]!=!1?f[4]:f[5])&&P(e,"fill-opacity",i),d&128&&s!==(s=`translate(${f[7][0]/-2} ${f[7][1]/-2})`)&&P(e,"transform",s),d&128&&o!==(o=f[7][4][1])&&P(a,"d",o),d&6&&l!==(l=f[2]||f[1]||"currentColor")&&P(a,"fill",l),d&112&&c!==(c=f[6]!=!1?f[5]:f[4])&&P(a,"fill-opacity",c),d&128&&u!==(u=`translate(${f[7][0]/-2} ${f[7][1]/-2})`)&&P(a,"transform",u)},d(f){f&&U(e),f&&U(a)}}}function Ju(r){let e,t,n,i;return{c(){e=Ii("path"),P(e,"d",t=r[7][4]),P(e,"fill",n=r[1]||r[2]||"currentColor"),P(e,"transform",i=`translate(${r[7][0]/-2} ${r[7][1]/-2})`)},m(s,a){B(s,e,a)},p(s,a){a&128&&t!==(t=s[7][4])&&P(e,"d",t),a&6&&n!==(n=s[1]||s[2]||"currentColor")&&P(e,"fill",n),a&128&&i!==(i=`translate(${s[7][0]/-2} ${s[7][1]/-2})`)&&P(e,"transform",i)},d(s){s&&U(e)}}}function Qu(r){let e,t=r[7][4]&&Na(r);return{c(){t&&t.c(),e=Ft()},m(n,i){t&&t.m(n,i),B(n,e,i)},p(n,[i]){n[7][4]?t?t.p(n,i):(t=Na(n),t.c(),t.m(e.parentNode,e)):t&&(t.d(1),t=null)},i:_e,o:_e,d(n){t&&t.d(n),n&&U(e)}}}function $u(r,e,t){let{class:n=""}=e,{id:i=""}=e,{style:s=""}=e,{icon:a}=e,{size:o=""}=e,{color:l=""}=e,{fw:c=!1}=e,{pull:u=""}=e,{scale:f=1}=e,{translateX:d=0}=e,{translateY:p=0}=e,{rotate:m=""}=e,{flip:h=!1}=e,{spin:_=!1}=e,{pulse:g=!1}=e,{primaryColor:v=""}=e,{secondaryColor:b=""}=e,{primaryOpacity:w=1}=e,{secondaryOpacity:y=.4}=e,{swapOpacity:x=!1}=e,S,M,T,R;return r.$$set=k=>{"class"in k&&t(11,n=k.class),"id"in k&&t(0,i=k.id),"style"in k&&t(12,s=k.style),"icon"in k&&t(13,a=k.icon),"size"in k&&t(14,o=k.size),"color"in k&&t(1,l=k.color),"fw"in k&&t(15,c=k.fw),"pull"in k&&t(16,u=k.pull),"scale"in k&&t(17,f=k.scale),"translateX"in k&&t(18,d=k.translateX),"translateY"in k&&t(19,p=k.translateY),"rotate"in k&&t(20,m=k.rotate),"flip"in k&&t(21,h=k.flip),"spin"in k&&t(22,_=k.spin),"pulse"in k&&t(23,g=k.pulse),"primaryColor"in k&&t(2,v=k.primaryColor),"secondaryColor"in k&&t(3,b=k.secondaryColor),"primaryOpacity"in k&&t(4,w=k.primaryOpacity),"secondaryOpacity"in k&&t(5,y=k.secondaryOpacity),"swapOpacity"in k&&t(6,x=k.swapOpacity)},r.$$.update=()=>{r.$$.dirty&8192&&t(7,S=a&&a.icon||[0,0,"",[],""]),r.$$.dirty&12584960&&t(8,M=os([n,"svelte-fa",_&&"spin",g&&"pulse"]," ")),r.$$.dirty&118784&&t(9,T=Yu(s,o,u,c)),r.$$.dirty&4063232&&t(10,R=Zu(f,d,p,m,h,512))},[i,l,v,b,w,y,x,S,M,T,R,n,s,a,o,c,u,f,d,p,m,h,_,g]}class zt extends Xe{constructor(e){super(),We(this,e,$u,Qu,He,{class:11,id:0,style:12,icon:13,size:14,color:1,fw:15,pull:16,scale:17,translateX:18,translateY:19,rotate:20,flip:21,spin:22,pulse:23,primaryColor:2,secondaryColor:3,primaryOpacity:4,secondaryOpacity:5,swapOpacity:6})}}function Oc(r){const e=r-1;return e*e*e+1}function Sr(r,{from:e,to:t},n={}){const i=getComputedStyle(r),s=i.transform==="none"?"":i.transform,[a,o]=i.transformOrigin.split(" ").map(parseFloat),l=e.left+e.width*a/t.width-(t.left+a),c=e.top+e.height*o/t.height-(t.top+o),{delay:u=0,duration:f=p=>Math.sqrt(p)*120,easing:d=Oc}=n;return{delay:u,duration:ga(f)?f(Math.sqrt(l*l+c*c)):f,easing:d,css:(p,m)=>{const h=m*l,_=m*c,g=p+m*e.width/t.width,v=p+m*e.height/t.height;return`transform: ${s} translate(${h}px, ${_}px) scale(${g}, ${v});`}}}/*!
 * Font Awesome Free 6.1.2 by @fontawesome - https://fontawesome.com
 * License - https://fontawesome.com/license/free (Icons: CC BY 4.0, Fonts: SIL OFL 1.1, Code: MIT License)
 * Copyright 2022 Fonticons, Inc.
 */var ef={prefix:"fas",iconName:"arrow-right-to-bracket",icon:[512,512,["sign-in"],"f090","M416 32h-64c-17.67 0-32 14.33-32 32s14.33 32 32 32h64c17.67 0 32 14.33 32 32v256c0 17.67-14.33 32-32 32h-64c-17.67 0-32 14.33-32 32s14.33 32 32 32h64c53.02 0 96-42.98 96-96V128C512 74.98 469 32 416 32zM342.6 233.4l-128-128c-12.51-12.51-32.76-12.49-45.25 0c-12.5 12.5-12.5 32.75 0 45.25L242.8 224H32C14.31 224 0 238.3 0 256s14.31 32 32 32h210.8l-73.38 73.38c-12.5 12.5-12.5 32.75 0 45.25s32.75 12.5 45.25 0l128-128C355.1 266.1 355.1 245.9 342.6 233.4z"]},tf={prefix:"fas",iconName:"arrow-rotate-right",icon:[512,512,[8635,"arrow-right-rotate","arrow-rotate-forward","redo"],"f01e","M496 48V192c0 17.69-14.31 32-32 32H320c-17.69 0-32-14.31-32-32s14.31-32 32-32h63.39c-29.97-39.7-77.25-63.78-127.6-63.78C167.7 96.22 96 167.9 96 256s71.69 159.8 159.8 159.8c34.88 0 68.03-11.03 95.88-31.94c14.22-10.53 34.22-7.75 44.81 6.375c10.59 14.16 7.75 34.22-6.375 44.81c-39.03 29.28-85.36 44.86-134.2 44.86C132.5 479.9 32 379.4 32 256s100.5-223.9 223.9-223.9c69.15 0 134 32.47 176.1 86.12V48c0-17.69 14.31-32 32-32S496 30.31 496 48z"]},nf=tf,rf={prefix:"fas",iconName:"arrows-rotate",icon:[512,512,[128472,"refresh","sync"],"f021","M464 16c-17.67 0-32 14.31-32 32v74.09C392.1 66.52 327.4 32 256 32C161.5 32 78.59 92.34 49.58 182.2c-5.438 16.81 3.797 34.88 20.61 40.28c16.89 5.5 34.88-3.812 40.3-20.59C130.9 138.5 189.4 96 256 96c50.5 0 96.26 24.55 124.4 64H336c-17.67 0-32 14.31-32 32s14.33 32 32 32h128c17.67 0 32-14.31 32-32V48C496 30.31 481.7 16 464 16zM441.8 289.6c-16.92-5.438-34.88 3.812-40.3 20.59C381.1 373.5 322.6 416 256 416c-50.5 0-96.25-24.55-124.4-64H176c17.67 0 32-14.31 32-32s-14.33-32-32-32h-128c-17.67 0-32 14.31-32 32v144c0 17.69 14.33 32 32 32s32-14.31 32-32v-74.09C119.9 445.5 184.6 480 255.1 480c94.45 0 177.4-60.34 206.4-150.2C467.9 313 458.6 294.1 441.8 289.6z"]},sf=rf,af={prefix:"fas",iconName:"bug",icon:[512,512,[],"f188","M352 96V99.56C352 115.3 339.3 128 323.6 128H188.4C172.7 128 159.1 115.3 159.1 99.56V96C159.1 42.98 202.1 0 255.1 0C309 0 352 42.98 352 96zM41.37 105.4C53.87 92.88 74.13 92.88 86.63 105.4L150.6 169.4C151.3 170 151.9 170.7 152.5 171.4C166.8 164.1 182.9 160 199.1 160H312C329.1 160 345.2 164.1 359.5 171.4C360.1 170.7 360.7 170 361.4 169.4L425.4 105.4C437.9 92.88 458.1 92.88 470.6 105.4C483.1 117.9 483.1 138.1 470.6 150.6L406.6 214.6C405.1 215.3 405.3 215.9 404.6 216.5C410.7 228.5 414.6 241.9 415.7 256H480C497.7 256 512 270.3 512 288C512 305.7 497.7 320 480 320H416C416 344.6 410.5 367.8 400.6 388.6C402.7 389.9 404.8 391.5 406.6 393.4L470.6 457.4C483.1 469.9 483.1 490.1 470.6 502.6C458.1 515.1 437.9 515.1 425.4 502.6L362.3 439.6C337.8 461.4 306.5 475.8 272 479.2V240C272 231.2 264.8 224 255.1 224C247.2 224 239.1 231.2 239.1 240V479.2C205.5 475.8 174.2 461.4 149.7 439.6L86.63 502.6C74.13 515.1 53.87 515.1 41.37 502.6C28.88 490.1 28.88 469.9 41.37 457.4L105.4 393.4C107.2 391.5 109.3 389.9 111.4 388.6C101.5 367.8 96 344.6 96 320H32C14.33 320 0 305.7 0 288C0 270.3 14.33 256 32 256H96.3C97.38 241.9 101.3 228.5 107.4 216.5C106.7 215.9 106 215.3 105.4 214.6L41.37 150.6C28.88 138.1 28.88 117.9 41.37 105.4H41.37z"]},gr={prefix:"fas",iconName:"chevron-down",icon:[448,512,[],"f078","M224 416c-8.188 0-16.38-3.125-22.62-9.375l-192-192c-12.5-12.5-12.5-32.75 0-45.25s32.75-12.5 45.25 0L224 338.8l169.4-169.4c12.5-12.5 32.75-12.5 45.25 0s12.5 32.75 0 45.25l-192 192C240.4 412.9 232.2 416 224 416z"]},za={prefix:"fas",iconName:"chevron-left",icon:[320,512,[9001],"f053","M224 480c-8.188 0-16.38-3.125-22.62-9.375l-192-192c-12.5-12.5-12.5-32.75 0-45.25l192-192c12.5-12.5 32.75-12.5 45.25 0s12.5 32.75 0 45.25L77.25 256l169.4 169.4c12.5 12.5 12.5 32.75 0 45.25C240.4 476.9 232.2 480 224 480z"]},Fa={prefix:"fas",iconName:"chevron-right",icon:[320,512,[9002],"f054","M96 480c-8.188 0-16.38-3.125-22.62-9.375c-12.5-12.5-12.5-32.75 0-45.25L242.8 256L73.38 86.63c-12.5-12.5-12.5-32.75 0-45.25s32.75-12.5 45.25 0l192 192c12.5 12.5 12.5 32.75 0 45.25l-192 192C112.4 476.9 104.2 480 96 480z"]},ls={prefix:"fas",iconName:"chevron-up",icon:[448,512,[],"f077","M416 352c-8.188 0-16.38-3.125-22.62-9.375L224 173.3l-169.4 169.4c-12.5 12.5-32.75 12.5-45.25 0s-12.5-32.75 0-45.25l192-192c12.5-12.5 32.75-12.5 45.25 0l192 192c12.5 12.5 12.5 32.75 0 45.25C432.4 348.9 424.2 352 416 352z"]},of={prefix:"fas",iconName:"circle-xmark",icon:[512,512,[61532,"times-circle","xmark-circle"],"f057","M0 256C0 114.6 114.6 0 256 0C397.4 0 512 114.6 512 256C512 397.4 397.4 512 256 512C114.6 512 0 397.4 0 256zM175 208.1L222.1 255.1L175 303C165.7 312.4 165.7 327.6 175 336.1C184.4 346.3 199.6 346.3 208.1 336.1L255.1 289.9L303 336.1C312.4 346.3 327.6 346.3 336.1 336.1C346.3 327.6 346.3 312.4 336.1 303L289.9 255.1L336.1 208.1C346.3 199.6 346.3 184.4 336.1 175C327.6 165.7 312.4 165.7 303 175L255.1 222.1L208.1 175C199.6 165.7 184.4 165.7 175 175C165.7 184.4 165.7 199.6 175 208.1V208.1z"]},lf=of,cf={prefix:"fas",iconName:"clipboard",icon:[384,512,[128203],"f328","M336 64h-53.88C268.9 26.8 233.7 0 192 0S115.1 26.8 101.9 64H48C21.5 64 0 85.48 0 112v352C0 490.5 21.5 512 48 512h288c26.5 0 48-21.48 48-48v-352C384 85.48 362.5 64 336 64zM192 64c17.67 0 32 14.33 32 32c0 17.67-14.33 32-32 32S160 113.7 160 96C160 78.33 174.3 64 192 64zM272 224h-160C103.2 224 96 216.8 96 208C96 199.2 103.2 192 112 192h160C280.8 192 288 199.2 288 208S280.8 224 272 224z"]},uf={prefix:"fas",iconName:"comment-dots",icon:[512,512,[62075,128172,"commenting"],"f4ad","M256 31.1c-141.4 0-255.1 93.12-255.1 208c0 49.62 21.35 94.98 56.97 130.7c-12.5 50.37-54.27 95.27-54.77 95.77c-2.25 2.25-2.875 5.734-1.5 8.734c1.249 3 4.021 4.766 7.271 4.766c66.25 0 115.1-31.76 140.6-51.39c32.63 12.25 69.02 19.39 107.4 19.39c141.4 0 255.1-93.13 255.1-207.1S397.4 31.1 256 31.1zM127.1 271.1c-17.75 0-32-14.25-32-31.1s14.25-32 32-32s32 14.25 32 32S145.7 271.1 127.1 271.1zM256 271.1c-17.75 0-31.1-14.25-31.1-31.1s14.25-32 31.1-32s31.1 14.25 31.1 32S273.8 271.1 256 271.1zM383.1 271.1c-17.75 0-32-14.25-32-31.1s14.25-32 32-32s32 14.25 32 32S401.7 271.1 383.1 271.1z"]},ff={prefix:"fas",iconName:"cubes",icon:[576,512,[],"f1b3","M172.1 40.16L268.1 3.76C280.9-1.089 295.1-1.089 307.9 3.76L403.9 40.16C425.6 48.41 440 69.25 440 92.52V204.7C441.3 205.1 442.6 205.5 443.9 205.1L539.9 242.4C561.6 250.6 576 271.5 576 294.7V413.9C576 436.1 562.9 456.2 542.5 465.1L446.5 507.3C432.2 513.7 415.8 513.7 401.5 507.3L288 457.5L174.5 507.3C160.2 513.7 143.8 513.7 129.5 507.3L33.46 465.1C13.13 456.2 0 436.1 0 413.9V294.7C0 271.5 14.39 250.6 36.15 242.4L132.1 205.1C133.4 205.5 134.7 205.1 136 204.7V92.52C136 69.25 150.4 48.41 172.1 40.16V40.16zM290.8 48.64C289 47.95 286.1 47.95 285.2 48.64L206.8 78.35L287.1 109.5L369.2 78.35L290.8 48.64zM392 210.6V121L309.6 152.6V241.8L392 210.6zM154.8 250.9C153 250.2 150.1 250.2 149.2 250.9L70.81 280.6L152 311.7L233.2 280.6L154.8 250.9zM173.6 455.3L256 419.1V323.2L173.6 354.8V455.3zM342.8 280.6L424 311.7L505.2 280.6L426.8 250.9C425 250.2 422.1 250.2 421.2 250.9L342.8 280.6zM528 413.9V323.2L445.6 354.8V455.3L523.2 421.2C526.1 419.9 528 417.1 528 413.9V413.9z"]},df={prefix:"fas",iconName:"file-contract",icon:[384,512,[],"f56c","M256 0v128h128L256 0zM224 128L224 0H48C21.49 0 0 21.49 0 48v416C0 490.5 21.49 512 48 512h288c26.51 0 48-21.49 48-48V160h-127.1C238.3 160 224 145.7 224 128zM64 72C64 67.63 67.63 64 72 64h80C156.4 64 160 67.63 160 72v16C160 92.38 156.4 96 152 96h-80C67.63 96 64 92.38 64 88V72zM64 136C64 131.6 67.63 128 72 128h80C156.4 128 160 131.6 160 136v16C160 156.4 156.4 160 152 160h-80C67.63 160 64 156.4 64 152V136zM304 384c8.875 0 16 7.125 16 16S312.9 416 304 416h-47.25c-16.38 0-31.25-9.125-38.63-23.88c-2.875-5.875-8-6.5-10.12-6.5s-7.25 .625-10 6.125l-7.75 15.38C187.6 412.6 181.1 416 176 416H174.9c-6.5-.5-12-4.75-14-11L144 354.6L133.4 386.5C127.5 404.1 111 416 92.38 416H80C71.13 416 64 408.9 64 400S71.13 384 80 384h12.38c4.875 0 9.125-3.125 10.62-7.625l18.25-54.63C124.5 311.9 133.6 305.3 144 305.3s19.5 6.625 22.75 16.5l13.88 41.63c19.75-16.25 54.13-9.75 66 14.12c2 4 6 6.5 10.12 6.5H304z"]},hf={prefix:"fas",iconName:"gear",icon:[512,512,[9881,"cog"],"f013","M495.9 166.6C499.2 175.2 496.4 184.9 489.6 191.2L446.3 230.6C447.4 238.9 448 247.4 448 256C448 264.6 447.4 273.1 446.3 281.4L489.6 320.8C496.4 327.1 499.2 336.8 495.9 345.4C491.5 357.3 486.2 368.8 480.2 379.7L475.5 387.8C468.9 398.8 461.5 409.2 453.4 419.1C447.4 426.2 437.7 428.7 428.9 425.9L373.2 408.1C359.8 418.4 344.1 427 329.2 433.6L316.7 490.7C314.7 499.7 307.7 506.1 298.5 508.5C284.7 510.8 270.5 512 255.1 512C241.5 512 227.3 510.8 213.5 508.5C204.3 506.1 197.3 499.7 195.3 490.7L182.8 433.6C167 427 152.2 418.4 138.8 408.1L83.14 425.9C74.3 428.7 64.55 426.2 58.63 419.1C50.52 409.2 43.12 398.8 36.52 387.8L31.84 379.7C25.77 368.8 20.49 357.3 16.06 345.4C12.82 336.8 15.55 327.1 22.41 320.8L65.67 281.4C64.57 273.1 64 264.6 64 256C64 247.4 64.57 238.9 65.67 230.6L22.41 191.2C15.55 184.9 12.82 175.3 16.06 166.6C20.49 154.7 25.78 143.2 31.84 132.3L36.51 124.2C43.12 113.2 50.52 102.8 58.63 92.95C64.55 85.8 74.3 83.32 83.14 86.14L138.8 103.9C152.2 93.56 167 84.96 182.8 78.43L195.3 21.33C197.3 12.25 204.3 5.04 213.5 3.51C227.3 1.201 241.5 0 256 0C270.5 0 284.7 1.201 298.5 3.51C307.7 5.04 314.7 12.25 316.7 21.33L329.2 78.43C344.1 84.96 359.8 93.56 373.2 103.9L428.9 86.14C437.7 83.32 447.4 85.8 453.4 92.95C461.5 102.8 468.9 113.2 475.5 124.2L480.2 132.3C486.2 143.2 491.5 154.7 495.9 166.6V166.6zM256 336C300.2 336 336 300.2 336 255.1C336 211.8 300.2 175.1 256 175.1C211.8 175.1 176 211.8 176 255.1C176 300.2 211.8 336 256 336z"]},pf=hf,mf={prefix:"fas",iconName:"message",icon:[512,512,["comment-alt"],"f27a","M511.1 63.1v287.1c0 35.25-28.75 63.1-64 63.1h-144l-124.9 93.68c-7.875 5.75-19.12 .0497-19.12-9.7v-83.98h-96c-35.25 0-64-28.75-64-63.1V63.1c0-35.25 28.75-63.1 64-63.1h384C483.2 0 511.1 28.75 511.1 63.1z"]},_f={prefix:"fas",iconName:"palette",icon:[512,512,[127912],"f53f","M512 255.1C512 256.9 511.1 257.8 511.1 258.7C511.6 295.2 478.4 319.1 441.9 319.1H344C317.5 319.1 296 341.5 296 368C296 371.4 296.4 374.7 297 377.9C299.2 388.1 303.5 397.1 307.9 407.8C313.9 421.6 320 435.3 320 449.8C320 481.7 298.4 510.5 266.6 511.8C263.1 511.9 259.5 512 256 512C114.6 512 0 397.4 0 256C0 114.6 114.6 0 256 0C397.4 0 512 114.6 512 256V255.1zM96 255.1C78.33 255.1 64 270.3 64 287.1C64 305.7 78.33 319.1 96 319.1C113.7 319.1 128 305.7 128 287.1C128 270.3 113.7 255.1 96 255.1zM128 191.1C145.7 191.1 160 177.7 160 159.1C160 142.3 145.7 127.1 128 127.1C110.3 127.1 96 142.3 96 159.1C96 177.7 110.3 191.1 128 191.1zM256 63.1C238.3 63.1 224 78.33 224 95.1C224 113.7 238.3 127.1 256 127.1C273.7 127.1 288 113.7 288 95.1C288 78.33 273.7 63.1 256 63.1zM384 191.1C401.7 191.1 416 177.7 416 159.1C416 142.3 401.7 127.1 384 127.1C366.3 127.1 352 142.3 352 159.1C352 177.7 366.3 191.1 384 191.1z"]},gf={prefix:"fas",iconName:"paper-plane",icon:[512,512,[61913],"f1d8","M511.6 36.86l-64 415.1c-1.5 9.734-7.375 18.22-15.97 23.05c-4.844 2.719-10.27 4.097-15.68 4.097c-4.188 0-8.319-.8154-12.29-2.472l-122.6-51.1l-50.86 76.29C226.3 508.5 219.8 512 212.8 512C201.3 512 192 502.7 192 491.2v-96.18c0-7.115 2.372-14.03 6.742-19.64L416 96l-293.7 264.3L19.69 317.5C8.438 312.8 .8125 302.2 .0625 289.1s5.469-23.72 16.06-29.77l448-255.1c10.69-6.109 23.88-5.547 34 1.406S513.5 24.72 511.6 36.86z"]},bf={prefix:"fas",iconName:"people-group",icon:[640,512,[],"e533","M184 88C184 118.9 158.9 144 128 144C97.07 144 72 118.9 72 88C72 57.07 97.07 32 128 32C158.9 32 184 57.07 184 88zM208.4 196.3C178.7 222.7 160 261.2 160 304C160 338.3 171.1 369.8 192 394.5V416C192 433.7 177.7 448 160 448H96C78.33 448 64 433.7 64 416V389.2C26.16 371.2 0 332.7 0 288C0 226.1 50.14 176 112 176H144C167.1 176 190.2 183.5 208.4 196.3V196.3zM64 245.7C54.04 256.9 48 271.8 48 288C48 304.2 54.04 319.1 64 330.3V245.7zM448 416V394.5C468 369.8 480 338.3 480 304C480 261.2 461.3 222.7 431.6 196.3C449.8 183.5 472 176 496 176H528C589.9 176 640 226.1 640 288C640 332.7 613.8 371.2 576 389.2V416C576 433.7 561.7 448 544 448H480C462.3 448 448 433.7 448 416zM576 330.3C585.1 319.1 592 304.2 592 288C592 271.8 585.1 256.9 576 245.7V330.3zM568 88C568 118.9 542.9 144 512 144C481.1 144 456 118.9 456 88C456 57.07 481.1 32 512 32C542.9 32 568 57.07 568 88zM256 96C256 60.65 284.7 32 320 32C355.3 32 384 60.65 384 96C384 131.3 355.3 160 320 160C284.7 160 256 131.3 256 96zM448 304C448 348.7 421.8 387.2 384 405.2V448C384 465.7 369.7 480 352 480H288C270.3 480 256 465.7 256 448V405.2C218.2 387.2 192 348.7 192 304C192 242.1 242.1 192 304 192H336C397.9 192 448 242.1 448 304zM256 346.3V261.7C246 272.9 240 287.8 240 304C240 320.2 246 335.1 256 346.3zM384 261.7V346.3C393.1 335 400 320.2 400 304C400 287.8 393.1 272.9 384 261.7z"]},vf={prefix:"fas",iconName:"people-pulling",icon:[576,512,[],"e535","M32 48C32 21.49 53.49 0 80 0C106.5 0 128 21.49 128 48C128 74.51 106.5 96 80 96C53.49 96 32 74.51 32 48V48zM118.3 128C130.1 128 143.5 130.5 155.2 135.4L289.3 191.2C302.6 171.1 320.1 156.6 342.7 146.9L353.7 142C374.5 132.8 396.1 128 419.7 128C464.3 128 504.5 154.8 521.6 195.9L536.1 232.7L558.3 243.4C574.1 251.3 580.5 270.5 572.6 286.3C564.7 302.1 545.5 308.5 529.7 300.6L503 287.3C492.7 282.1 484.6 273.4 480.2 262.8L470.6 239.8L451.3 305.3L500.8 359.4C506.2 365.3 510.1 372.4 512 380.2L535 472.2C539.3 489.4 528.9 506.8 511.8 511C494.6 515.3 477.2 504.9 472.1 487.8L450.9 399.6L380.3 322.5C365.5 306.4 359.1 283.9 365.6 262.8L382.5 199.3C381.6 199.7 380.6 200.1 379.7 200.5L368.7 205.4C353.4 212.2 341.4 224.6 335.2 240.1L333.7 243.9C328.6 256.7 316.1 264.4 303 263.1C299.2 263.9 295.4 263.1 291.7 261.5L173.3 212.2L231.2 473.1C235.1 490.3 224.2 507.4 206.9 511.2C189.7 515.1 172.6 504.2 168.8 486.9L138.8 352H123.1L143.6 474.7C146.5 492.2 134.7 508.7 117.3 511.6C99.83 514.5 83.34 502.7 80.44 485.3L56.35 340.8C50.48 347.6 41.75 352 32 352C14.33 352 0 337.7 0 319.1V191.1C0 156.7 28.65 127.1 64 127.1L118.3 128zM416 48C416 21.49 437.5 0 464 0C490.5 0 512 21.49 512 48C512 74.51 490.5 96 464 96C437.5 96 416 74.51 416 48V48zM356.7 344.2L397.4 388.6L382.9 424.8C380.5 430.9 376.9 436.4 372.3 440.9L310.6 502.6C298.1 515.1 277.9 515.1 265.4 502.6C252.9 490.1 252.9 469.9 265.4 457.4L324.7 398L349.7 335.6C351.8 338.6 354.2 341.4 356.7 344.2H356.7z"]},yf={prefix:"fas",iconName:"person-walking",icon:[320,512,[128694,"walking"],"f554","M256 48C256 74.51 234.5 96 208 96C181.5 96 160 74.51 160 48C160 21.49 181.5 0 208 0C234.5 0 256 21.49 256 48zM126.5 199.3C125.6 199.7 124.6 200.1 123.7 200.5L112.7 205.4C97.41 212.2 85.42 224.6 79.22 240.1L77.71 243.9C71.15 260.3 52.53 268.3 36.12 261.7C19.71 255.1 11.73 236.5 18.29 220.1L19.8 216.3C32.19 185.4 56.18 160.5 86.66 146.9L97.66 142C118.5 132.8 140.1 128 163.7 128C208.3 128 248.5 154.8 265.6 195.9L280.1 232.7L302.3 243.4C318.1 251.3 324.5 270.5 316.6 286.3C308.7 302.1 289.5 308.5 273.7 300.6L247 287.3C236.7 282.1 228.6 273.4 224.2 262.8L214.6 239.8L195.3 305.3L244.8 359.4C250.2 365.3 254.1 372.4 256 380.2L279 472.2C283.3 489.4 272.9 506.8 255.8 511C238.6 515.3 221.2 504.9 216.1 487.8L194.9 399.6L124.3 322.5C109.5 306.4 103.1 283.9 109.6 262.8L126.5 199.3zM68.73 398L93.69 335.6C95.84 338.6 98.16 341.4 100.7 344.2L141.4 388.6L126.9 424.8C124.5 430.9 120.9 436.4 116.3 440.9L54.63 502.6C42.13 515.1 21.87 515.1 9.372 502.6C-3.124 490.1-3.124 469.9 9.372 457.4L68.73 398z"]},wf={prefix:"fas",iconName:"play",icon:[384,512,[9654],"f04b","M361 215C375.3 223.8 384 239.3 384 256C384 272.7 375.3 288.2 361 296.1L73.03 472.1C58.21 482 39.66 482.4 24.52 473.9C9.377 465.4 0 449.4 0 432V80C0 62.64 9.377 46.63 24.52 38.13C39.66 29.64 58.21 29.99 73.03 39.04L361 215z"]},Mf={prefix:"fas",iconName:"share",icon:[512,512,["arrow-turn-right","mail-forward"],"f064","M503.7 226.2l-176 151.1c-15.38 13.3-39.69 2.545-39.69-18.16V272.1C132.9 274.3 66.06 312.8 111.4 457.8c5.031 16.09-14.41 28.56-28.06 18.62C39.59 444.6 0 383.8 0 322.3c0-152.2 127.4-184.4 288-186.3V56.02c0-20.67 24.28-31.46 39.69-18.16l176 151.1C514.8 199.4 514.8 216.6 503.7 226.2z"]},xf={prefix:"fas",iconName:"star",icon:[576,512,[61446,11088],"f005","M381.2 150.3L524.9 171.5C536.8 173.2 546.8 181.6 550.6 193.1C554.4 204.7 551.3 217.3 542.7 225.9L438.5 328.1L463.1 474.7C465.1 486.7 460.2 498.9 450.2 506C440.3 513.1 427.2 514 416.5 508.3L288.1 439.8L159.8 508.3C149 514 135.9 513.1 126 506C116.1 498.9 111.1 486.7 113.2 474.7L137.8 328.1L33.58 225.9C24.97 217.3 21.91 204.7 25.69 193.1C29.46 181.6 39.43 173.2 51.42 171.5L195 150.3L259.4 17.97C264.7 6.954 275.9-.0391 288.1-.0391C300.4-.0391 311.6 6.954 316.9 17.97L381.2 150.3z"]},Sf={prefix:"fas",iconName:"stop",icon:[384,512,[9209],"f04d","M384 128v255.1c0 35.35-28.65 64-64 64H64c-35.35 0-64-28.65-64-64V128c0-35.35 28.65-64 64-64H320C355.3 64 384 92.65 384 128z"]},Cf={prefix:"fas",iconName:"terminal",icon:[576,512,[],"f120","M9.372 86.63C-3.124 74.13-3.124 53.87 9.372 41.37C21.87 28.88 42.13 28.88 54.63 41.37L246.6 233.4C259.1 245.9 259.1 266.1 246.6 278.6L54.63 470.6C42.13 483.1 21.87 483.1 9.372 470.6C-3.124 458.1-3.124 437.9 9.372 425.4L178.7 256L9.372 86.63zM544 416C561.7 416 576 430.3 576 448C576 465.7 561.7 480 544 480H256C238.3 480 224 465.7 224 448C224 430.3 238.3 416 256 416H544z"]},Tf={prefix:"fas",iconName:"video",icon:[576,512,["video-camera"],"f03d","M384 112v288c0 26.51-21.49 48-48 48h-288c-26.51 0-48-21.49-48-48v-288c0-26.51 21.49-48 48-48h288C362.5 64 384 85.49 384 112zM576 127.5v256.9c0 25.5-29.17 40.39-50.39 25.79L416 334.7V177.3l109.6-75.56C546.9 87.13 576 102.1 576 127.5z"]},Uc={prefix:"fas",iconName:"x",icon:[384,512,[120],"58","M376.6 427.5c11.31 13.58 9.484 33.75-4.094 45.06c-5.984 4.984-13.25 7.422-20.47 7.422c-9.172 0-18.27-3.922-24.59-11.52L192 305.1l-135.4 162.5c-6.328 7.594-15.42 11.52-24.59 11.52c-7.219 0-14.48-2.438-20.47-7.422c-13.58-11.31-15.41-31.48-4.094-45.06l142.9-171.5L7.422 84.5C-3.891 70.92-2.063 50.75 11.52 39.44c13.56-11.34 33.73-9.516 45.06 4.094L192 206l135.4-162.5c11.3-13.58 31.48-15.42 45.06-4.094c13.58 11.31 15.41 31.48 4.094 45.06l-142.9 171.5L376.6 427.5z"]};function cs(r,{delay:e=0,duration:t=400,easing:n=Oc}={}){const i=getComputedStyle(r),s=+i.opacity,a=parseFloat(i.height),o=parseFloat(i.paddingTop),l=parseFloat(i.paddingBottom),c=parseFloat(i.marginTop),u=parseFloat(i.marginBottom),f=parseFloat(i.borderTopWidth),d=parseFloat(i.borderBottomWidth);return{delay:e,duration:t,easing:n,css:p=>`overflow: hidden;opacity: ${Math.min(p*20,1)*s};height: ${p*a}px;padding-top: ${p*o}px;padding-bottom: ${p*l}px;margin-top: ${p*c}px;margin-bottom: ${p*u}px;border-top-width: ${p*f}px;border-bottom-width: ${p*d}px;`}}/*!
 * Font Awesome Free 6.1.2 by @fontawesome - https://fontawesome.com
 * License - https://fontawesome.com/license/free (Icons: CC BY 4.0, Fonts: SIL OFL 1.1, Code: MIT License)
 * Copyright 2022 Fonticons, Inc.
 */var Ef={prefix:"far",iconName:"star",icon:[576,512,[61446,11088],"f005","M287.9 0C297.1 0 305.5 5.25 309.5 13.52L378.1 154.8L531.4 177.5C540.4 178.8 547.8 185.1 550.7 193.7C553.5 202.4 551.2 211.9 544.8 218.2L433.6 328.4L459.9 483.9C461.4 492.9 457.7 502.1 450.2 507.4C442.8 512.7 432.1 513.4 424.9 509.1L287.9 435.9L150.1 509.1C142.9 513.4 133.1 512.7 125.6 507.4C118.2 502.1 114.5 492.9 115.1 483.9L142.2 328.4L31.11 218.2C24.65 211.9 22.36 202.4 25.2 193.7C28.03 185.1 35.5 178.8 44.49 177.5L197.7 154.8L266.3 13.52C270.4 5.249 278.7 0 287.9 0L287.9 0zM287.9 78.95L235.4 187.2C231.9 194.3 225.1 199.3 217.3 200.5L98.98 217.9L184.9 303C190.4 308.5 192.9 316.4 191.6 324.1L171.4 443.7L276.6 387.5C283.7 383.7 292.2 383.7 299.2 387.5L404.4 443.7L384.2 324.1C382.9 316.4 385.5 308.5 391 303L476.9 217.9L358.6 200.5C350.7 199.3 343.9 194.3 340.5 187.2L287.9 78.95z"]};function Lf(r){let e,t,n;return{c(){e=z("div"),t=z("span"),P(t,"class",n=is(r[0]?"loader":"small-loader")+" svelte-s46sr9"),P(t,"style",""),P(e,"id","loader-id"),P(e,"class","loader-wrapper svelte-s46sr9")},m(i,s){B(i,e,s),E(e,t)},p(i,[s]){s&1&&n!==(n=is(i[0]?"loader":"small-loader")+" svelte-s46sr9")&&P(t,"class",n)},i:_e,o:_e,d(i){i&&U(e)}}}function Pf(r,e,t){let{marginLeft:n="40%",marginRight:i="",marginTop:s="50%",isBig:a=!1}=e;return ct(()=>{const o=document.getElementById("loader-id");n!==""&&(o.style.marginLeft=n),i!==""&&(o.style.marginRight=i),s!==""&&(o.style.marginTop=s)}),r.$$set=o=>{"marginLeft"in o&&t(1,n=o.marginLeft),"marginRight"in o&&t(2,i=o.marginRight),"marginTop"in o&&t(3,s=o.marginTop),"isBig"in o&&t(0,a=o.isBig)},[a,n,i,s]}class dt extends Xe{constructor(e){super(),We(this,e,Pf,Lf,He,{marginLeft:1,marginRight:2,marginTop:3,isBig:0})}}function Oa(r,e,t){const n=r.slice();return n[14]=e[t],n}function Ua(r){let e,t=r[5],n=[];for(let i=0;i<t.length;i+=1)n[i]=Ba(Oa(r,t,i));return{c(){e=z("div");for(let i=0;i<n.length;i+=1)n[i].c();P(e,"class","dropdown-menu")},m(i,s){B(i,e,s);for(let a=0;a<n.length;a+=1)n[a].m(e,null)},p(i,s){if(s&288){t=i[5];let a;for(a=0;a<t.length;a+=1){const o=Oa(i,t,a);n[a]?n[a].p(o,s):(n[a]=Ba(o),n[a].c(),n[a].m(e,null))}for(;a<n.length;a+=1)n[a].d(1);n.length=t.length}},d(i){i&&U(e),Pt(n,i)}}}function Ba(r){let e,t,n=r[14].id+"",i,s,a=r[14].name+"",o,l,c;function u(){return r[12](r[14])}return{c(){e=z("p"),t=J("("),i=J(n),s=J(") "),o=J(a)},m(f,d){B(f,e,d),E(e,t),E(e,i),E(e,s),E(e,o),l||(c=ze(e,"click",u),l=!0)},p(f,d){r=f,d&32&&n!==(n=r[14].id+"")&&pe(i,n),d&32&&a!==(a=r[14].name+"")&&pe(o,a)},d(f){f&&U(e),l=!1,c()}}}function Af(r){let e,t,n,i,s,a,o,l,c,u,f,d,p,m,h;f=new zt({props:{icon:gr,class:"txt-xs dropdown-chevron"}});let _=r[4]&&Ua(r);return{c(){e=z("div"),t=z("p"),n=J(r[0]),i=J(":"),s=Z(),a=z("div"),o=z("div"),l=z("input"),c=Z(),u=z("div"),ee(f.$$.fragment),d=Z(),_&&_.c(),P(t,"class","block txt-sm panel-labels"),P(l,"id",r[1]),P(l,"type","text"),P(l,"class","panel-inputs txt-sm p-2"),P(l,"placeholder",r[2]),P(o,"class","relative"),P(a,"class","dropdown")},m(g,v){B(g,e,v),E(e,t),E(t,n),E(t,i),E(e,s),E(e,a),E(a,o),E(o,l),Nt(l,r[3]),E(o,c),E(o,u),Q(f,u,null),E(a,d),_&&_.m(a,null),p=!0,m||(h=[ze(l,"input",r[11]),ze(l,"click",r[6]),ze(l,"keyup",r[7]),ze(u,"click",r[6])],m=!0)},p(g,[v]){(!p||v&1)&&pe(n,g[0]),(!p||v&2)&&P(l,"id",g[1]),(!p||v&4)&&P(l,"placeholder",g[2]),v&8&&l.value!==g[3]&&Nt(l,g[3]),g[4]?_?_.p(g,v):(_=Ua(g),_.c(),_.m(a,null)):_&&(_.d(1),_=null)},i(g){p||(D(f.$$.fragment,g),p=!0)},o(g){I(f.$$.fragment,g),p=!1},d(g){g&&U(e),$(f),_&&_.d(),m=!1,xt(h)}}}function Df(r,e,t){const n=ln();let{ddLabel:i,dropdownList:s,ddId:a,placeholder:o="",selectedValue:l}=e,c="",u=!1,f=[];ct(()=>{t(5,f=s)});function d(){u?(document.getElementById(a).style.borderBottomLeftRadius="0.2vw",document.getElementById(a).style.borderBottomRightRadius="0.2vw"):(document.getElementById(a).style.borderBottomLeftRadius="0",document.getElementById(a).style.borderBottomRightRadius="0"),t(4,u=!u)}function p(){t(4,u=!0),t(5,f=s.filter(g=>{let v=g.name.toLocaleLowerCase(),b=g.id.toString().toLocaleLowerCase();if(v.includes(c.toLocaleLowerCase())||b.includes(c.toLocaleLowerCase()))return g}))}function m(g){t(3,c=g.name),document.getElementById(a).style.borderBottomLeftRadius="0.2vw",document.getElementById(a).style.borderBottomRightRadius="0.2vw",t(4,u=!1),n("searchable-dd-selected-value",g)}function h(){c=this.value,t(3,c)}const _=g=>m(g);return r.$$set=g=>{"ddLabel"in g&&t(0,i=g.ddLabel),"dropdownList"in g&&t(9,s=g.dropdownList),"ddId"in g&&t(1,a=g.ddId),"placeholder"in g&&t(2,o=g.placeholder),"selectedValue"in g&&t(10,l=g.selectedValue)},[i,a,o,c,u,f,d,p,m,s,l,h,_]}class bn extends Xe{constructor(e){super(),We(this,e,Df,Af,He,{ddLabel:0,dropdownList:9,ddId:1,placeholder:2,selectedValue:10})}}function Rf(r){let e,t,n,i,s,a,o,l;return{c(){e=z("p"),t=J(r[2]),n=J(":"),i=Z(),s=z("input"),P(e,"class","block txt-sm panel-labels"),P(s,"id",r[3]),P(s,"type","text"),P(s,"placeholder",r[1]),P(s,"style","width=auto;"),P(s,"class",a="panel-inputs "+r[4])},m(c,u){B(c,e,u),E(e,t),E(e,n),B(c,i,u),B(c,s,u),Nt(s,r[0]),o||(l=[ze(s,"input",r[7]),ze(s,"keyup",r[5])],o=!0)},p(c,[u]){u&4&&pe(t,c[2]),u&8&&P(s,"id",c[3]),u&2&&P(s,"placeholder",c[1]),u&16&&a!==(a="panel-inputs "+c[4])&&P(s,"class",a),u&1&&s.value!==c[0]&&Nt(s,c[0])},i:_e,o:_e,d(c){c&&U(e),c&&U(i),c&&U(s),o=!1,xt(l)}}}function kf(r,e,t){let{placeholder:n="",label:i="",inputId:s,inputValue:a="",className:o="block",width:l="90%"}=e;const c=ln();ct(()=>{const d=document.getElementById(s);d.style.width=l});function u(){c("input-value-update",a)}function f(){a=this.value,t(0,a)}return r.$$set=d=>{"placeholder"in d&&t(1,n=d.placeholder),"label"in d&&t(2,i=d.label),"inputId"in d&&t(3,s=d.inputId),"inputValue"in d&&t(0,a=d.inputValue),"className"in d&&t(4,o=d.className),"width"in d&&t(6,l=d.width)},[a,n,i,s,o,u,l,f]}class Tn extends Xe{constructor(e){super(),We(this,e,kf,Rf,He,{placeholder:1,label:2,inputId:3,inputValue:0,className:4,width:6})}}function If(r){let e,t,n,i;return{c(){e=z("button"),t=J(r[0]),P(e,"id",r[3]),P(e,"class",r[1]),e.disabled=r[2]},m(s,a){B(s,e,a),E(e,t),n||(i=ze(e,"click",r[4]),n=!0)},p(s,[a]){a&1&&pe(t,s[0]),a&8&&P(e,"id",s[3]),a&2&&P(e,"class",s[1]),a&4&&(e.disabled=s[2])},i:_e,o:_e,d(s){s&&U(e),n=!1,i()}}}function Nf(r,e,t){const n=ln();let{buttonLabel:i,className:s="block panel-btns txt-xs",btnDisabled:a=!0,btnId:o}=e;function l(){n("button-clicked")}return r.$$set=c=>{"buttonLabel"in c&&t(0,i=c.buttonLabel),"className"in c&&t(1,s=c.className),"btnDisabled"in c&&t(2,a=c.btnDisabled),"btnId"in c&&t(3,o=c.btnId)},[i,s,a,o,l]}class bt extends Xe{constructor(e){super(),We(this,e,Nf,If,He,{buttonLabel:0,className:1,btnDisabled:2,btnId:3})}}function zf(r){let e,t,n,i,s,a,o;return{c(){e=z("div"),t=z("input"),n=Z(),i=z("p"),s=J(r[1]),P(t,"type","checkbox"),P(t,"class","cursor-pointer"),P(t,"id",r[2]),P(t,"name",r[2]),P(i,"class","inline-block txt-sm panel-labels pleft-1 ptop-1"),P(e,"class","checkboxes")},m(l,c){B(l,e,c),E(e,t),Nt(t,r[0]),E(e,n),E(e,i),E(i,s),a||(o=[ze(t,"change",r[4]),ze(t,"click",r[3])],a=!0)},p(l,[c]){c&4&&P(t,"id",l[2]),c&4&&P(t,"name",l[2]),c&1&&Nt(t,l[0]),c&2&&pe(s,l[1])},i:_e,o:_e,d(l){l&&U(e),a=!1,xt(o)}}}function Ff(r,e,t){const n=ln();let{checkboxValue:i,checkboxLabel:s,checkboxId:a}=e;function o(){t(0,i=!i),n("checkbox-clicked",i)}function l(){i=this.value,t(0,i)}return r.$$set=c=>{"checkboxValue"in c&&t(0,i=c.checkboxValue),"checkboxLabel"in c&&t(1,s=c.checkboxLabel),"checkboxId"in c&&t(2,a=c.checkboxId)},[i,s,a,o,l]}class us extends Xe{constructor(e){super(),We(this,e,Ff,zf,He,{checkboxValue:0,checkboxLabel:1,checkboxId:2})}}function Of(r){let e,t;return e=new dt({}),{c(){ee(e.$$.fragment)},m(n,i){Q(e,n,i),t=!0},p:_e,i(n){t||(D(e.$$.fragment,n),t=!0)},o(n){I(e.$$.fragment,n),t=!1},d(n){$(e,n)}}}function Uf(r){let e,t,n,i,s,a,o,l,c,u;return e=new bn({props:{ddLabel:r[0].vehicle,dropdownList:r[3],ddId:"spawn-car-dd-input",placeholder:r[0].vehicle,selectedValue:r[4]}}),e.$on("searchable-dd-selected-value",r[13]),n=new Tn({props:{placeholder:r[0].override_placeholder,label:r[0].override,inputId:"spawn-car-override-input",inputValue:r[8]}}),n.$on("input-value-update",r[14]),s=new us({props:{checkboxValue:r[6],checkboxLabel:r[0].max_mods,checkboxId:r[6]}}),s.$on("checkbox-clicked",r[15]),o=new us({props:{checkboxValue:r[7],checkboxLabel:r[0].seat_vehicle,checkboxId:r[7]}}),o.$on("checkbox-clicked",r[16]),c=new bt({props:{buttonLabel:r[0].submit,btnDisabled:r[5],btnId:"submit-btn-spawn-car"}}),c.$on("button-clicked",r[12]),{c(){ee(e.$$.fragment),t=Z(),ee(n.$$.fragment),i=Z(),ee(s.$$.fragment),a=Z(),ee(o.$$.fragment),l=Z(),ee(c.$$.fragment)},m(f,d){Q(e,f,d),B(f,t,d),Q(n,f,d),B(f,i,d),Q(s,f,d),B(f,a,d),Q(o,f,d),B(f,l,d),Q(c,f,d),u=!0},p(f,d){const p={};d&1&&(p.ddLabel=f[0].vehicle),d&8&&(p.dropdownList=f[3]),d&1&&(p.placeholder=f[0].vehicle),d&16&&(p.selectedValue=f[4]),e.$set(p);const m={};d&1&&(m.placeholder=f[0].override_placeholder),d&1&&(m.label=f[0].override),d&256&&(m.inputValue=f[8]),n.$set(m);const h={};d&64&&(h.checkboxValue=f[6]),d&1&&(h.checkboxLabel=f[0].max_mods),d&64&&(h.checkboxId=f[6]),s.$set(h);const _={};d&128&&(_.checkboxValue=f[7]),d&1&&(_.checkboxLabel=f[0].seat_vehicle),d&128&&(_.checkboxId=f[7]),o.$set(_);const g={};d&1&&(g.buttonLabel=f[0].submit),d&32&&(g.btnDisabled=f[5]),c.$set(g)},i(f){u||(D(e.$$.fragment,f),D(n.$$.fragment,f),D(s.$$.fragment,f),D(o.$$.fragment,f),D(c.$$.fragment,f),u=!0)},o(f){I(e.$$.fragment,f),I(n.$$.fragment,f),I(s.$$.fragment,f),I(o.$$.fragment,f),I(c.$$.fragment,f),u=!1},d(f){$(e,f),f&&U(t),$(n,f),f&&U(i),$(s,f),f&&U(a),$(o,f),f&&U(l),$(c,f)}}}function Bf(r){let e,t,n,i;const s=[Uf,Of],a=[];function o(l,c){return!l[1]&&!l[2]?0:1}return t=o(r),n=a[t]=s[t](r),{c(){e=z("div"),n.c()},m(l,c){B(l,e,c),a[t].m(e,null),i=!0},p(l,[c]){let u=t;t=o(l),t===u?a[t].p(l,c):(De(),I(a[u],1,1,()=>{a[u]=null}),Re(),n=a[t],n?n.p(l,c):(n=a[t]=s[t](l),n.c()),D(n,1),n.m(e,null))},i(l){i||(D(n),i=!0)},o(l){I(n),i=!1},d(l){l&&U(e),a[t].d()}}}function Vf(r,e,t){let n,{localeConsts:i}=e,{isDev:s}=yt;ft(r,s,y=>t(18,n=y));let a=!1,o=!1,l=[],c="",u=!0,f=!1,d=!1,p="";ct(async()=>{t(2,o=!0),n?t(3,l=[{id:1,name:"Sakshi"},{id:2,name:"Pushkar"},{id:3,name:"Monu"},{id:4,name:"Chinu"},{id:5,name:"Vaishnavi"},{id:6,name:"Anvi"},{id:7,name:"Lalla"}]):t(3,l=await Pe("getAllVehicles")),t(2,o=!1)});function m(y){t(4,c=y.detail),c!==""&&t(5,u=!1)}function h(){p.trim(),p.trim()!==""?t(5,u=!1):t(5,u=!0)}async function _(){t(1,a=!0),await Pe("spawncardata",{selectedPlayer:c,override:p,maxMods:f,seatValue:d}),t(5,u=!0),t(4,c=""),t(6,f=!1),t(7,d=!1),t(8,p=""),t(1,a=!1)}const g=y=>m(y),v=y=>{t(8,p=y.detail),h()},b=y=>t(6,f=y.detail),w=y=>t(7,d=y.detail);return r.$$set=y=>{"localeConsts"in y&&t(0,i=y.localeConsts)},[i,a,o,l,c,u,f,d,p,s,m,h,_,g,v,b,w]}class Gf extends Xe{constructor(e){super(),We(this,e,Vf,Bf,He,{localeConsts:0})}}function Hf(r){let e,t;return e=new dt({}),{c(){ee(e.$$.fragment)},m(n,i){Q(e,n,i),t=!0},p:_e,i(n){t||(D(e.$$.fragment,n),t=!0)},o(n){I(e.$$.fragment,n),t=!1},d(n){$(e,n)}}}function Wf(r){let e,t,n,i;return e=new Tn({props:{placeholder:r[6],label:r[5],inputId:"announce-input",inputValue:r[1]}}),e.$on("input-value-update",r[10]),n=new bt({props:{buttonLabel:r[0].submit,btnDisabled:r[2],btnId:"submit-btn-announce"}}),n.$on("button-clicked",r[8]),{c(){ee(e.$$.fragment),t=Z(),ee(n.$$.fragment)},m(s,a){Q(e,s,a),B(s,t,a),Q(n,s,a),i=!0},p(s,a){const o={};a&64&&(o.placeholder=s[6]),a&32&&(o.label=s[5]),a&2&&(o.inputValue=s[1]),e.$set(o);const l={};a&1&&(l.buttonLabel=s[0].submit),a&4&&(l.btnDisabled=s[2]),n.$set(l)},i(s){i||(D(e.$$.fragment,s),D(n.$$.fragment,s),i=!0)},o(s){I(e.$$.fragment,s),I(n.$$.fragment,s),i=!1},d(s){$(e,s),s&&U(t),$(n,s)}}}function Xf(r){let e,t,n,i;const s=[Wf,Hf],a=[];function o(l,c){return!l[3]&&!l[4]?0:1}return t=o(r),n=a[t]=s[t](r),{c(){e=z("div"),n.c()},m(l,c){B(l,e,c),a[t].m(e,null),i=!0},p(l,[c]){let u=t;t=o(l),t===u?a[t].p(l,c):(De(),I(a[u],1,1,()=>{a[u]=null}),Re(),n=a[t],n?n.p(l,c):(n=a[t]=s[t](l),n.c()),D(n,1),n.m(e,null))},i(l){i||(D(n),i=!0)},o(l){I(n),i=!1},d(l){l&&U(e),a[t].d()}}}function jf(r,e,t){let{title:n,localeConsts:i}=e,s="",a=!0,o=!1,l=!1,c="",u="",f="";ct(async()=>{t(4,l=!0),m(),t(4,l=!1)});function d(){t(2,a=s.trim()==="")}async function p(){t(3,o=!0);let _={};if(n===i.search_by_citizen_id){const v=parseInt(s);if(isNaN(v)){t(3,o=!1),t(1,s="");return}_={citizenId:v}}else _={announcement:s};const g=await Pe(c,_);i.search_by_citizen_id,t(3,o=!1),t(1,s="")}function m(){n===i.Announce?(t(1,s=""),c="announce",t(5,u=i.announce),t(6,f=i.announce_placeholder)):n===i.search_by_citizen_id&&(t(1,s=""),c="searchCitizenId",t(5,u=i.citizen_id_label),t(6,f=i.search_placeholder))}const h=_=>{t(1,s=_.detail),d()};return r.$$set=_=>{"title"in _&&t(9,n=_.title),"localeConsts"in _&&t(0,i=_.localeConsts)},[i,s,a,o,l,u,f,d,p,n,h]}class qf extends Xe{constructor(e){super(),We(this,e,jf,Xf,He,{title:9,localeConsts:0})}}function Yf(r){let e,t;return e=new dt({}),{c(){ee(e.$$.fragment)},m(n,i){Q(e,n,i),t=!0},p:_e,i(n){t||(D(e.$$.fragment,n),t=!0)},o(n){I(e.$$.fragment,n),t=!1},d(n){$(e,n)}}}function Zf(r){let e,t,n,i,s,a;e=new Tn({props:{placeholder:"10.00,10.00,10.00",label:r[0].coordinates_label,inputId:"teleport-coords-input",inputValue:r[1]}}),e.$on("input-value-update",r[7]),n=new bt({props:{buttonLabel:r[0].submit,btnDisabled:r[2],btnId:"submit-btn-teleport-coords"}}),n.$on("button-clicked",r[6]);let o=r[4]!==""&&Va(r);return{c(){ee(e.$$.fragment),t=Z(),ee(n.$$.fragment),i=Z(),o&&o.c(),s=Ft()},m(l,c){Q(e,l,c),B(l,t,c),Q(n,l,c),B(l,i,c),o&&o.m(l,c),B(l,s,c),a=!0},p(l,c){const u={};c&1&&(u.label=l[0].coordinates_label),c&2&&(u.inputValue=l[1]),e.$set(u);const f={};c&1&&(f.buttonLabel=l[0].submit),c&4&&(f.btnDisabled=l[2]),n.$set(f),l[4]!==""?o?o.p(l,c):(o=Va(l),o.c(),o.m(s.parentNode,s)):o&&(o.d(1),o=null)},i(l){a||(D(e.$$.fragment,l),D(n.$$.fragment,l),a=!0)},o(l){I(e.$$.fragment,l),I(n.$$.fragment,l),a=!1},d(l){$(e,l),l&&U(t),$(n,l),l&&U(i),o&&o.d(l),l&&U(s)}}}function Va(r){let e,t;return{c(){e=z("p"),t=J(r[4]),P(e,"class","input-error")},m(n,i){B(n,e,i),E(e,t)},p(n,i){i&16&&pe(t,n[4])},d(n){n&&U(e)}}}function Kf(r){let e,t,n,i;const s=[Zf,Yf],a=[];function o(l,c){return l[3]?1:0}return t=o(r),n=a[t]=s[t](r),{c(){e=z("div"),n.c()},m(l,c){B(l,e,c),a[t].m(e,null),i=!0},p(l,[c]){let u=t;t=o(l),t===u?a[t].p(l,c):(De(),I(a[u],1,1,()=>{a[u]=null}),Re(),n=a[t],n?n.p(l,c):(n=a[t]=s[t](l),n.c()),D(n,1),n.m(e,null))},i(l){i||(D(n),i=!0)},o(l){I(n),i=!1},d(l){l&&U(e),a[t].d()}}}function Jf(r,e,t){let{localeConsts:n}=e,i="",s=!0,a=!1,o="";function l(){t(2,s=i.trim()===""||i.includes(" "))}async function c(){t(3,a=!0);const f=i.split(",");if(f.length!==3)return t(4,o=n.enter_coords_error_msg),t(3,a=!1),o;for(let p=0;p<f.length;p++)if(f[p].split(".").length!==2)return t(4,o=n.coords_decimal_error_msg),t(3,a=!1),o;const d={xcoord:f[0],ycoord:f[1],zcoord:f[2]};await Pe("teleportcoords",d),t(3,a=!1),t(1,i=""),t(4,o="")}const u=f=>{t(1,i=f.detail),l()};return r.$$set=f=>{"localeConsts"in f&&t(0,n=f.localeConsts)},[n,i,s,a,o,l,c,u]}class Qf extends Xe{constructor(e){super(),We(this,e,Jf,Kf,He,{localeConsts:0})}}function $f(r){let e,t,n,i,s,a,o,l;return{c(){e=z("p"),t=J(r[2]),n=J(":"),i=Z(),s=z("input"),P(e,"class","block txt-sm panel-labels"),P(s,"id",r[3]),P(s,"type","number"),P(s,"placeholder",r[1]),P(s,"style","width=auto;"),P(s,"class",a="panel-inputs "+r[4])},m(c,u){B(c,e,u),E(e,t),E(e,n),B(c,i,u),B(c,s,u),Nt(s,r[0]),o||(l=[ze(s,"input",r[10]),ze(s,"keyup",r[5])],o=!0)},p(c,[u]){u&4&&pe(t,c[2]),u&8&&P(s,"id",c[3]),u&2&&P(s,"placeholder",c[1]),u&16&&a!==(a="panel-inputs "+c[4])&&P(s,"class",a),u&1&&Ic(s.value)!==c[0]&&Nt(s,c[0])},i:_e,o:_e,d(c){c&&U(e),c&&U(i),c&&U(s),o=!1,xt(l)}}}function ed(r,e,t){let{placeholder:n="",label:i="",inputId:s,inputValue:a,className:o="block",width:l="90%",pattern:c="",step:u="",min:f=""}=e;const d=ln();ct(()=>{const h=document.getElementById(s);h.style.width=l,c.trim()!==""&&h.setAttribute("pattern",c),u.trim()!==""&&h.setAttribute("step",u),f.trim()!==""&&h.setAttribute("min",u)});function p(){d("input-value-update",a)}function m(){a=Ic(this.value),t(0,a)}return r.$$set=h=>{"placeholder"in h&&t(1,n=h.placeholder),"label"in h&&t(2,i=h.label),"inputId"in h&&t(3,s=h.inputId),"inputValue"in h&&t(0,a=h.inputValue),"className"in h&&t(4,o=h.className),"width"in h&&t(6,l=h.width),"pattern"in h&&t(7,c=h.pattern),"step"in h&&t(8,u=h.step),"min"in h&&t(9,f=h.min)},[a,n,i,s,o,p,l,c,u,f,m]}class Oi extends Xe{constructor(e){super(),We(this,e,ed,$f,He,{placeholder:1,label:2,inputId:3,inputValue:0,className:4,width:6,pattern:7,step:8,min:9})}}function td(r){let e,t;return e=new dt({}),{c(){ee(e.$$.fragment)},m(n,i){Q(e,n,i),t=!0},p:_e,i(n){t||(D(e.$$.fragment,n),t=!0)},o(n){I(e.$$.fragment,n),t=!1},d(n){$(e,n)}}}function nd(r){let e,t,n,i,s,a,o,l;return e=new bn({props:{ddLabel:r[0].player,dropdownList:r[3],ddId:"give-money-player-dd-input",placeholder:r[0].player_placeholder,selectedValue:r[4]}}),e.$on("searchable-dd-selected-value",r[19]),n=new bn({props:{ddLabel:r[9],dropdownList:r[6],ddId:"give-money-item-dd-input",placeholder:r[0].search_placeholder,selectedValue:r[7]}}),n.$on("searchable-dd-selected-value",r[20]),s=new Oi({props:{label:r[0].amount,inputId:"give-money-input",inputValue:r[11],className:"small-panel-inputs txt-sm p-1",width:"40%",step:"1",min:"1"}}),s.$on("input-value-update",r[21]),o=new bt({props:{buttonLabel:r[10],btnDisabled:r[5]||r[8]||r[12],btnId:"submit-btn-give-money"}}),o.$on("button-clicked",r[17]),{c(){ee(e.$$.fragment),t=Z(),ee(n.$$.fragment),i=Z(),ee(s.$$.fragment),a=Z(),ee(o.$$.fragment)},m(c,u){Q(e,c,u),B(c,t,u),Q(n,c,u),B(c,i,u),Q(s,c,u),B(c,a,u),Q(o,c,u),l=!0},p(c,u){const f={};u&1&&(f.ddLabel=c[0].player),u&8&&(f.dropdownList=c[3]),u&1&&(f.placeholder=c[0].player_placeholder),u&16&&(f.selectedValue=c[4]),e.$set(f);const d={};u&512&&(d.ddLabel=c[9]),u&64&&(d.dropdownList=c[6]),u&1&&(d.placeholder=c[0].search_placeholder),u&128&&(d.selectedValue=c[7]),n.$set(d);const p={};u&1&&(p.label=c[0].amount),u&2048&&(p.inputValue=c[11]),s.$set(p);const m={};u&1024&&(m.buttonLabel=c[10]),u&4384&&(m.btnDisabled=c[5]||c[8]||c[12]),o.$set(m)},i(c){l||(D(e.$$.fragment,c),D(n.$$.fragment,c),D(s.$$.fragment,c),D(o.$$.fragment,c),l=!0)},o(c){I(e.$$.fragment,c),I(n.$$.fragment,c),I(s.$$.fragment,c),I(o.$$.fragment,c),l=!1},d(c){$(e,c),c&&U(t),$(n,c),c&&U(i),$(s,c),c&&U(a),$(o,c)}}}function id(r){let e,t,n,i;const s=[nd,td],a=[];function o(l,c){return!l[1]&&!l[2]?0:1}return t=o(r),n=a[t]=s[t](r),{c(){e=z("div"),n.c()},m(l,c){B(l,e,c),a[t].m(e,null),i=!0},p(l,[c]){let u=t;t=o(l),t===u?a[t].p(l,c):(De(),I(a[u],1,1,()=>{a[u]=null}),Re(),n=a[t],n?n.p(l,c):(n=a[t]=s[t](l),n.c()),D(n,1),n.m(e,null))},i(l){i||(D(n),i=!0)},o(l){I(n),i=!1},d(l){l&&U(e),a[t].d()}}}function rd(r,e,t){let n,{title:i,localeConsts:s}=e,{isDev:a}=yt;ft(r,a,R=>t(22,n=R));let o=!1,l=!1,c=[],u="",f=!0,d=[],p="",m=!0,h="",_="",g,v=!0;ct(async()=>{t(2,l=!0),n?t(3,c=[{id:1,name:"Sakshi"},{id:2,name:"Pushkar"},{id:3,name:"Monu"},{id:4,name:"Chinu"},{id:5,name:"Vaishnavi"},{id:6,name:"Anvi"},{id:7,name:"Lalla"}]):t(3,c=await Pe("getPlayerList")),i==s.Give_Item?(t(6,d=await Pe("getAllItems")),t(9,h=s.itemLabel),t(10,_=s.give_item_btn)):(t(6,d=[{id:"cash",name:"Cash"},{id:"bank",name:"Bank"}]),t(9,h=s.money_type),t(10,_=s.give_money_btn)),t(2,l=!1)});function b(R){t(4,u=R.detail),u!==""&&t(5,f=!1)}function w(R){t(7,p=R.detail),p!==""&&t(8,m=!1)}function y(){t(12,v=!Number.isInteger(g)||g<=0)}async function x(){t(1,o=!0);const R={selectedPlayer:u,selectedItem:p,amount:g};i==s.Give_Item?await Pe("giveitem",R):(await Pe("giveMoney",R),t(5,f=!0),t(8,m=!0),t(4,u=""),t(7,p=""),t(11,g="")),t(1,o=!1)}const S=R=>b(R),M=R=>w(R),T=R=>{t(11,g=R.detail),y()};return r.$$set=R=>{"title"in R&&t(18,i=R.title),"localeConsts"in R&&t(0,s=R.localeConsts)},[s,o,l,c,u,f,d,p,m,h,_,g,v,a,b,w,y,x,i,S,M,T]}class sd extends Xe{constructor(e){super(),We(this,e,rd,id,He,{title:18,localeConsts:0})}}function ad(r){let e,t;return e=new dt({}),{c(){ee(e.$$.fragment)},m(n,i){Q(e,n,i),t=!0},p:_e,i(n){t||(D(e.$$.fragment,n),t=!0)},o(n){I(e.$$.fragment,n),t=!1},d(n){$(e,n)}}}function od(r){let e,t,n,i,s,a;e=new Tn({props:{placeholder:r[0].max_8_chars,label:r[0].plate_number,inputId:"change-plate-input",inputValue:r[1]}}),e.$on("input-value-update",r[7]),n=new bt({props:{buttonLabel:r[0].submit,btnDisabled:r[2],btnId:"submit-btn-change-plate"}}),n.$on("button-clicked",r[6]);let o=r[4]!==""&&Ga(r);return{c(){ee(e.$$.fragment),t=Z(),ee(n.$$.fragment),i=Z(),o&&o.c(),s=Ft()},m(l,c){Q(e,l,c),B(l,t,c),Q(n,l,c),B(l,i,c),o&&o.m(l,c),B(l,s,c),a=!0},p(l,c){const u={};c&1&&(u.placeholder=l[0].max_8_chars),c&1&&(u.label=l[0].plate_number),c&2&&(u.inputValue=l[1]),e.$set(u);const f={};c&1&&(f.buttonLabel=l[0].submit),c&4&&(f.btnDisabled=l[2]),n.$set(f),l[4]!==""?o?o.p(l,c):(o=Ga(l),o.c(),o.m(s.parentNode,s)):o&&(o.d(1),o=null)},i(l){a||(D(e.$$.fragment,l),D(n.$$.fragment,l),a=!0)},o(l){I(e.$$.fragment,l),I(n.$$.fragment,l),a=!1},d(l){$(e,l),l&&U(t),$(n,l),l&&U(i),o&&o.d(l),l&&U(s)}}}function Ga(r){let e,t;return{c(){e=z("p"),t=J(r[4]),P(e,"class","input-error")},m(n,i){B(n,e,i),E(e,t)},p(n,i){i&16&&pe(t,n[4])},d(n){n&&U(e)}}}function ld(r){let e,t,n,i;const s=[od,ad],a=[];function o(l,c){return l[3]?1:0}return t=o(r),n=a[t]=s[t](r),{c(){e=z("div"),n.c()},m(l,c){B(l,e,c),a[t].m(e,null),i=!0},p(l,[c]){let u=t;t=o(l),t===u?a[t].p(l,c):(De(),I(a[u],1,1,()=>{a[u]=null}),Re(),n=a[t],n?n.p(l,c):(n=a[t]=s[t](l),n.c()),D(n,1),n.m(e,null))},i(l){i||(D(n),i=!0)},o(l){I(n),i=!1},d(l){l&&U(e),a[t].d()}}}function cd(r,e,t){let{localeConsts:n}=e,i="",s=!0,a=!1,o="";function l(){i.trim().length>8?t(4,o=n.plate_less_than_8):/^[A-Za-z0-9]*$/.test(i)?t(4,o=""):t(4,o=n.plate_no_spl_chars),t(2,s=i.trim()===""||o!=="")}async function c(){t(3,a=!0),await Pe("changePlate",{plateNumber:i}),t(3,a=!1),t(1,i="")}const u=f=>{t(1,i=f.detail),l()};return r.$$set=f=>{"localeConsts"in f&&t(0,n=f.localeConsts)},[n,i,s,a,o,l,c,u]}class ud extends Xe{constructor(e){super(),We(this,e,cd,ld,He,{localeConsts:0})}}function fd(r){let e,t;return e=new dt({}),{c(){ee(e.$$.fragment)},m(n,i){Q(e,n,i),t=!0},p:_e,i(n){t||(D(e.$$.fragment,n),t=!0)},o(n){I(e.$$.fragment,n),t=!1},d(n){$(e,n)}}}function dd(r){let e,t,n,i;return e=new Tn({props:{placeholder:r[0].object_placeholder,label:r[0].object_label,inputId:"spawn-object-input",inputValue:r[1]}}),e.$on("input-value-update",r[6]),n=new bt({props:{buttonLabel:r[0].submit,btnDisabled:r[2],btnId:"submit-btn-spawn-objects"}}),n.$on("button-clicked",r[5]),{c(){ee(e.$$.fragment),t=Z(),ee(n.$$.fragment)},m(s,a){Q(e,s,a),B(s,t,a),Q(n,s,a),i=!0},p(s,a){const o={};a&1&&(o.placeholder=s[0].object_placeholder),a&1&&(o.label=s[0].object_label),a&2&&(o.inputValue=s[1]),e.$set(o);const l={};a&1&&(l.buttonLabel=s[0].submit),a&4&&(l.btnDisabled=s[2]),n.$set(l)},i(s){i||(D(e.$$.fragment,s),D(n.$$.fragment,s),i=!0)},o(s){I(e.$$.fragment,s),I(n.$$.fragment,s),i=!1},d(s){$(e,s),s&&U(t),$(n,s)}}}function hd(r){let e,t,n,i;const s=[dd,fd],a=[];function o(l,c){return l[3]?1:0}return t=o(r),n=a[t]=s[t](r),{c(){e=z("div"),n.c()},m(l,c){B(l,e,c),a[t].m(e,null),i=!0},p(l,[c]){let u=t;t=o(l),t===u?a[t].p(l,c):(De(),I(a[u],1,1,()=>{a[u]=null}),Re(),n=a[t],n?n.p(l,c):(n=a[t]=s[t](l),n.c()),D(n,1),n.m(e,null))},i(l){i||(D(n),i=!0)},o(l){I(n),i=!1},d(l){l&&U(e),a[t].d()}}}function pd(r,e,t){let{localeConsts:n}=e,i="",s=!0,a=!1;function o(){t(2,s=i.trim()===""||i.includes(" "))}async function l(){t(3,a=!0),await Pe("spawnObject",{objectName:i}),t(3,a=!1),t(1,i="")}const c=u=>{t(1,i=u.detail),o()};return r.$$set=u=>{"localeConsts"in u&&t(0,n=u.localeConsts)},[n,i,s,a,o,l,c]}class md extends Xe{constructor(e){super(),We(this,e,pd,hd,He,{localeConsts:0})}}function _d(r){let e,t;return e=new dt({}),{c(){ee(e.$$.fragment)},m(n,i){Q(e,n,i),t=!0},p:_e,i(n){t||(D(e.$$.fragment,n),t=!0)},o(n){I(e.$$.fragment,n),t=!1},d(n){$(e,n)}}}function gd(r){let e,t,n,i,s,a,o,l,c,u,f,d,p;return e=new bn({props:{ddLabel:r[9],dropdownList:r[2],ddId:"create-stashes-dd-input",placeholder:r[0].search_placeholder,selectedValue:r[5]}}),e.$on("searchable-dd-selected-value",r[16]),i=new Oi({props:{label:r[0].size,inputId:"create-stashes-size-input",inputValue:r[6],className:"small-panel-inputs txt-sm p-1",width:"40%",pattern:"^[-/d]/d*$",step:"1"}}),i.$on("input-value-update",r[17]),o=new Oi({props:{label:r[0].slots,inputId:"create-stashes-slots-input",inputValue:r[7],className:"small-panel-inputs txt-sm p-1",width:"40%",pattern:"^[-/d]/d*$",step:"1"}}),o.$on("input-value-update",r[18]),u=new Tn({props:{placeholder:"prop_container_03mb",label:r[0].prop_override,inputId:"prop-container-input",inputValue:r[10]}}),u.$on("input-value-update",r[19]),d=new bt({props:{buttonLabel:r[8],btnDisabled:r[4],btnId:"submit-btn-create-stashes"}}),d.$on("button-clicked",r[13]),{c(){ee(e.$$.fragment),t=Z(),n=z("div"),ee(i.$$.fragment),s=Z(),a=z("div"),ee(o.$$.fragment),l=Z(),c=z("div"),ee(u.$$.fragment),f=Z(),ee(d.$$.fragment),P(n,"class","mtop-1"),P(a,"class","mtop-1 mbot-3"),P(c,"class","mtop-1")},m(m,h){Q(e,m,h),B(m,t,h),B(m,n,h),Q(i,n,null),B(m,s,h),B(m,a,h),Q(o,a,null),B(m,l,h),B(m,c,h),Q(u,c,null),B(m,f,h),Q(d,m,h),p=!0},p(m,h){const _={};h&512&&(_.ddLabel=m[9]),h&4&&(_.dropdownList=m[2]),h&1&&(_.placeholder=m[0].search_placeholder),h&32&&(_.selectedValue=m[5]),e.$set(_);const g={};h&1&&(g.label=m[0].size),h&64&&(g.inputValue=m[6]),i.$set(g);const v={};h&1&&(v.label=m[0].slots),h&128&&(v.inputValue=m[7]),o.$set(v);const b={};h&1&&(b.label=m[0].prop_override),h&1024&&(b.inputValue=m[10]),u.$set(b);const w={};h&256&&(w.buttonLabel=m[8]),h&16&&(w.btnDisabled=m[4]),d.$set(w)},i(m){p||(D(e.$$.fragment,m),D(i.$$.fragment,m),D(o.$$.fragment,m),D(u.$$.fragment,m),D(d.$$.fragment,m),p=!0)},o(m){I(e.$$.fragment,m),I(i.$$.fragment,m),I(o.$$.fragment,m),I(u.$$.fragment,m),I(d.$$.fragment,m),p=!1},d(m){$(e,m),m&&U(t),m&&U(n),$(i),m&&U(s),m&&U(a),$(o),m&&U(l),m&&U(c),$(u),m&&U(f),$(d,m)}}}function bd(r){let e,t,n,i;const s=[gd,_d],a=[];function o(l,c){return!l[1]&&!l[3]?0:1}return t=o(r),n=a[t]=s[t](r),{c(){e=z("div"),n.c()},m(l,c){B(l,e,c),a[t].m(e,null),i=!0},p(l,[c]){let u=t;t=o(l),t===u?a[t].p(l,c):(De(),I(a[u],1,1,()=>{a[u]=null}),Re(),n=a[t],n?n.p(l,c):(n=a[t]=s[t](l),n.c()),D(n,1),n.m(e,null))},i(l){i||(D(n),i=!0)},o(l){I(n),i=!1},d(l){l&&U(e),a[t].d()}}}function vd(r,e,t){let n,{title:i,localeConsts:s}=e,{isDev:a}=yt;ft(r,a,k=>t(22,n=k));let o=!1,l=[],c=!1,u=!0,f="",d,p,m="",h="",_=s.submit,g=s.label,v="";ct(async()=>{t(3,c=!0),b(),n?t(2,l=[{id:1,name:"Job1"},{id:2,name:"Job2"},{id:3,name:"Job3"},{id:4,name:"Job4"},{id:5,name:"Job5"},{id:6,name:"Job6"},{id:7,name:"Job7"}]):t(2,l=await Pe(h)),t(3,c=!1)});function b(){i===s.Create_Job_Stashes?(m="setJobStash",t(9,g=s.jobLabel),h="getindividualjobs",t(8,_=s.create_job_stash_btn)):i===s.Create_Gang_Stashes&&(m="setGangStash",t(9,g=s.gangLabel),h="getIndividualGangs",t(8,_=s.create_gang_stash_btn))}function w(k){t(5,f=k.detail),x()}async function y(){t(1,o=!0),await Pe(m,{selectedValue:f,size:d,slot:p,prop_override:v}),t(4,u=!0),t(5,f=""),t(6,d=0),t(7,p=0),t(10,v=""),t(1,o=!1)}function x(){t(4,u=f===""||!Number.isInteger(p)||!Number.isInteger(d))}const S=k=>w(k),M=k=>{t(6,d=k.detail),x()},T=k=>{t(7,p=k.detail),x()},R=k=>{t(10,v=k.detail)};return r.$$set=k=>{"title"in k&&t(15,i=k.title),"localeConsts"in k&&t(0,s=k.localeConsts)},[s,o,l,c,u,f,d,p,_,g,v,a,w,y,x,i,S,M,T,R]}class yd extends Xe{constructor(e){super(),We(this,e,vd,bd,He,{title:15,localeConsts:0})}}function wd(r){let e,t;return e=new dt({}),{c(){ee(e.$$.fragment)},m(n,i){Q(e,n,i),t=!0},p:_e,i(n){t||(D(e.$$.fragment,n),t=!0)},o(n){I(e.$$.fragment,n),t=!1},d(n){$(e,n)}}}function Md(r){let e,t,n,i;const s=[Sd,xd],a=[];function o(l,c){return l[2]?1:0}return e=o(r),t=a[e]=s[e](r),{c(){t.c(),n=Ft()},m(l,c){a[e].m(l,c),B(l,n,c),i=!0},p(l,c){let u=e;e=o(l),e===u?a[e].p(l,c):(De(),I(a[u],1,1,()=>{a[u]=null}),Re(),t=a[e],t?t.p(l,c):(t=a[e]=s[e](l),t.c()),D(t,1),t.m(n.parentNode,n))},i(l){i||(D(t),i=!0)},o(l){I(t),i=!1},d(l){a[e].d(l),l&&U(n)}}}function xd(r){let e,t,n,i,s,a,o=r[1].citizen_id_label+"",l,c,u=r[3].citizenId+"",f,d,p,m,h=r[1].name_label+"",_,g,v=r[3].name+"",b,w,y,x,S=r[1].job_label+"",M,T,R=r[3].job+"",k,G,F,O,X=r[1].gang_label+"",le,ce,te=r[3].gang+"",ne,ue,be,q,ae=r[1].cash_bank_label+"",he,W,xe=r[3].cashBalance+"",ye,Ee,Ce=r[3].bankBalance+"",Ne,ke,Ge,qe;return n=new zt({props:{icon:Uc,class:"txt-2xs"}}),{c(){e=z("div"),t=z("div"),ee(n.$$.fragment),i=Z(),s=z("p"),a=z("span"),l=J(o),c=J(": "),f=J(u),d=Z(),p=z("p"),m=z("span"),_=J(h),g=J(": "),b=J(v),w=Z(),y=z("p"),x=z("span"),M=J(S),T=J(": "),k=J(R),G=Z(),F=z("p"),O=z("span"),le=J(X),ce=J(": "),ne=J(te),ue=Z(),be=z("p"),q=z("span"),he=J(ae),W=J(": "),ye=J(xe),Ee=J(" / "),Ne=J(Ce),P(t,"class","svelte-99a6q2"),P(a,"class","svelte-99a6q2"),P(s,"class","svelte-99a6q2"),P(m,"class","svelte-99a6q2"),P(p,"class","svelte-99a6q2"),P(x,"class","svelte-99a6q2"),P(y,"class","svelte-99a6q2"),P(O,"class","svelte-99a6q2"),P(F,"class","svelte-99a6q2"),P(q,"class","svelte-99a6q2"),P(be,"class","svelte-99a6q2"),P(e,"class","player-info svelte-99a6q2")},m(Ye,rt){B(Ye,e,rt),E(e,t),Q(n,t,null),E(e,i),E(e,s),E(s,a),E(a,l),E(a,c),E(s,f),E(e,d),E(e,p),E(p,m),E(m,_),E(m,g),E(p,b),E(e,w),E(e,y),E(y,x),E(x,M),E(x,T),E(y,k),E(e,G),E(e,F),E(F,O),E(O,le),E(O,ce),E(F,ne),E(e,ue),E(e,be),E(be,q),E(q,he),E(q,W),E(be,ye),E(be,Ee),E(be,Ne),ke=!0,Ge||(qe=ze(t,"click",r[14]),Ge=!0)},p(Ye,rt){(!ke||rt&2)&&o!==(o=Ye[1].citizen_id_label+"")&&pe(l,o),(!ke||rt&8)&&u!==(u=Ye[3].citizenId+"")&&pe(f,u),(!ke||rt&2)&&h!==(h=Ye[1].name_label+"")&&pe(_,h),(!ke||rt&8)&&v!==(v=Ye[3].name+"")&&pe(b,v),(!ke||rt&2)&&S!==(S=Ye[1].job_label+"")&&pe(M,S),(!ke||rt&8)&&R!==(R=Ye[3].job+"")&&pe(k,R),(!ke||rt&2)&&X!==(X=Ye[1].gang_label+"")&&pe(le,X),(!ke||rt&8)&&te!==(te=Ye[3].gang+"")&&pe(ne,te),(!ke||rt&2)&&ae!==(ae=Ye[1].cash_bank_label+"")&&pe(he,ae),(!ke||rt&8)&&xe!==(xe=Ye[3].cashBalance+"")&&pe(ye,xe),(!ke||rt&8)&&Ce!==(Ce=Ye[3].bankBalance+"")&&pe(Ne,Ce)},i(Ye){ke||(D(n.$$.fragment,Ye),ke=!0)},o(Ye){I(n.$$.fragment,Ye),ke=!1},d(Ye){Ye&&U(e),$(n),Ge=!1,qe()}}}function Sd(r){let e,t,n,i,s,a,o,l;e=new bn({props:{ddLabel:r[10],dropdownList:r[5],ddId:"player-dd-input",placeholder:r[1].search,selectedValue:r[7]}}),e.$on("searchable-dd-selected-value",r[17]),n=new bt({props:{className:"inline-block panel-btns txt-xs",buttonLabel:r[9],btnDisabled:r[8],btnId:"submit-btn-player-list-dd-main"}}),n.$on("button-clicked",r[13]);const c=[Td,Cd],u=[];function f(d,p){return d[0]===d[1].Bring_Player?0:d[0]===d[1].Show_Props?1:-1}return~(s=f(r))&&(a=u[s]=c[s](r)),{c(){ee(e.$$.fragment),t=Z(),ee(n.$$.fragment),i=Z(),a&&a.c(),o=Ft()},m(d,p){Q(e,d,p),B(d,t,p),Q(n,d,p),B(d,i,p),~s&&u[s].m(d,p),B(d,o,p),l=!0},p(d,p){const m={};p&1024&&(m.ddLabel=d[10]),p&32&&(m.dropdownList=d[5]),p&2&&(m.placeholder=d[1].search),p&128&&(m.selectedValue=d[7]),e.$set(m);const h={};p&512&&(h.buttonLabel=d[9]),p&256&&(h.btnDisabled=d[8]),n.$set(h);let _=s;s=f(d),s===_?~s&&u[s].p(d,p):(a&&(De(),I(u[_],1,1,()=>{u[_]=null}),Re()),~s?(a=u[s],a?a.p(d,p):(a=u[s]=c[s](d),a.c()),D(a,1),a.m(o.parentNode,o)):a=null)},i(d){l||(D(e.$$.fragment,d),D(n.$$.fragment,d),D(a),l=!0)},o(d){I(e.$$.fragment,d),I(n.$$.fragment,d),I(a),l=!1},d(d){$(e,d),d&&U(t),$(n,d),d&&U(i),~s&&u[s].d(d),d&&U(o)}}}function Cd(r){let e,t;return e=new bt({props:{className:"inline-block panel-btns txt-xs",buttonLabel:r[1].teleport_btn,btnDisabled:r[8],btnId:"submit-btn-player-list-dd-teleport"}}),e.$on("button-clicked",r[16]),{c(){ee(e.$$.fragment)},m(n,i){Q(e,n,i),t=!0},p(n,i){const s={};i&2&&(s.buttonLabel=n[1].teleport_btn),i&256&&(s.btnDisabled=n[8]),e.$set(s)},i(n){t||(D(e.$$.fragment,n),t=!0)},o(n){I(e.$$.fragment,n),t=!1},d(n){$(e,n)}}}function Td(r){let e,t;return e=new bt({props:{className:"inline-block panel-btns txt-xs",buttonLabel:r[1].send_back_btn,btnDisabled:r[8],btnId:"submit-btn-player-list-dd-send-back"}}),e.$on("button-clicked",r[15]),{c(){ee(e.$$.fragment)},m(n,i){Q(e,n,i),t=!0},p(n,i){const s={};i&2&&(s.buttonLabel=n[1].send_back_btn),i&256&&(s.btnDisabled=n[8]),e.$set(s)},i(n){t||(D(e.$$.fragment,n),t=!0)},o(n){I(e.$$.fragment,n),t=!1},d(n){$(e,n)}}}function Ed(r){let e,t,n,i;const s=[Md,wd],a=[];function o(l,c){return!l[4]&&!l[6]?0:1}return t=o(r),n=a[t]=s[t](r),{c(){e=z("div"),n.c()},m(l,c){B(l,e,c),a[t].m(e,null),i=!0},p(l,[c]){let u=t;t=o(l),t===u?a[t].p(l,c):(De(),I(a[u],1,1,()=>{a[u]=null}),Re(),n=a[t],n?n.p(l,c):(n=a[t]=s[t](l),n.c()),D(n,1),n.m(e,null))},i(l){i||(D(n),i=!0)},o(l){I(n),i=!1},d(l){l&&U(e),a[t].d()}}}function Ld(r,e,t){let n,{title:i,localeConsts:s}=e,{isDev:a}=yt;ft(r,a,T=>t(20,n=T));let o=!1,l={citizenId:0,name:"",job:"",gang:"",cashBalance:0,bankBalance:0},c=!1,u=[],f=!1,d="",p=!0,m=s.submit,h="",_=s.player,g="getPlayerList";ct(async()=>{t(6,f=!0),v(),n?t(5,u=[{id:1,name:"Sakshi"},{id:2,name:"Pushkar"},{id:3,name:"Monu"},{id:4,name:"Chinu"},{id:5,name:"Vaishnavi"},{id:6,name:"Anvi"},{id:7,name:"Lalla"}]):t(5,u=await Pe(g)),t(6,f=!1)});function v(){i===s.Clothes_Menu?(h="giveclothes",t(9,m=s.submit)):i===s.Freeze_Player?(h="freezeplayer",t(9,m=s.freeze_btn)):i===s.Revive?(h="reviveplayer",t(9,m=s.revive_btn)):i===s.Teleport_to_Player?(h="teleporttoplayer",t(9,m=s.teleport_btn)):i===s.Open_Inventory?(h="openinventory",t(9,m=s.open_btn)):i===s.Player_Info?(h="getplayerinfo",t(9,m=s.get_info_btn)):i===s.Clear_Inventory?(h="clearInventory",t(9,m=s.clear_btn)):i===s.Bring_Player?(h="bringPlayer",t(9,m=s.bring_btn)):i===s.Spectate_Player?(h="spectatePlayer",t(9,m=s.spectate_btn)):i===s.Saved_Locations?(t(10,_=s.locations_label),g="getSavedLocations",h="sendToSavedLocation",t(9,m=s.submit)):i===s.Open_Trunk?(t(10,_=s.plate_number_label),g="getAllOwnedVehicles",h="openTrunk",t(9,m=s.submit)):i===s.Open_Glovebox?(t(10,_=s.plate_number_label),g="getAllOwnedVehicles",h="openGlovebox",t(9,m=s.submit)):i===s.Unban_Player?(t(10,_=s.player_name_label),g="getBannedPlayers",h="unbanPlayer",t(9,m=s.submit)):i==s.Show_Props?(t(10,_=s.prop_name_label),g="getProps",h="deleteProp",t(9,m=s.delete_btn)):i===s.Drunk_Player?(h="drunkPlayer",t(9,m=s.submit)):i===s.Set_Player_on_Fire?(h="firePlayer",t(9,m=s.submit)):i===s.Slap_Player_In_Sky?(h="slapSky",t(9,m=s.submit)):i===s.Send_Player_To_JailBox?(h="sendToJailBox",t(9,m=s.submit)):i===s.Change_Vehicle_State?(t(10,_=s.plate_number_label),g="getAllOutsideVehicles",h="changeVehicleState",t(9,m=s.submit)):i===s.Force_Logout_Player?(h="forceLogout",t(9,m=s.submit)):i===s.Give_Outfits?(h="giveOutfits",t(9,m=s.submit)):i===s.Damage_Player_Vehicle?(h="damagePlayerVehicle",t(9,m=s.submit)):i===s.Heal?(h="healplayer",t(9,m=s.heal_btn)):i===s.Wipe_Player?(g="getAllUniquePlayers",h="wipePlayer",t(9,m=s.wipe_btn)):i===s.Pee_Player?(h="peePlayer",t(9,m=s.submit)):i===s.Poop_Player?(h="poopPlayer",t(9,m=s.submit)):i===s.Remove_Stress&&(h="removeStress",t(9,m=s.submit))}function b(T){t(7,d=T.detail),d!==""&&t(8,p=!1)}async function w(){t(4,c=!0);const R=await Pe(h,{selectedPlayer:d});t(8,p=!0),t(7,d=""),i===s.Show_Props&&t(5,u=await Pe(g)),t(4,c=!1),i===s.Player_Info&&(t(2,o=!0),t(3,l=R))}function y(){t(2,o=!1),t(3,l={citizenId:0,name:"",job:"",gang:"",cashBalance:0,bankBalance:0})}async function x(){t(4,c=!0),await Pe("sendBackPlayer",{selectedPlayer:d}),t(8,p=!0),t(7,d=""),t(4,c=!1)}async function S(){t(4,c=!0),await Pe("teleportToProp",{selectedPlayer:d}),t(8,p=!1),t(4,c=!1)}const M=T=>b(T);return r.$$set=T=>{"title"in T&&t(0,i=T.title),"localeConsts"in T&&t(1,s=T.localeConsts)},[i,s,o,l,c,u,f,d,p,m,_,a,b,w,y,x,S,M]}class Pd extends Xe{constructor(e){super(),We(this,e,Ld,Ed,He,{title:0,localeConsts:1})}}function Ad(r){let e,t;return e=new dt({}),{c(){ee(e.$$.fragment)},m(n,i){Q(e,n,i),t=!0},p:_e,i(n){t||(D(e.$$.fragment,n),t=!0)},o(n){I(e.$$.fragment,n),t=!1},d(n){$(e,n)}}}function Dd(r){let e,t,n,i,s,a,o,l;e=new bn({props:{ddLabel:r[8],dropdownList:r[3],ddId:"one-dd-input",placeholder:r[1].searchString,selectedValue:r[6]}}),e.$on("searchable-dd-selected-value",r[16]);const c=[kd,Rd],u=[];function f(d,p){return d[0]===d[1].Open_Stash?0:1}return i=f(r),s=u[i]=c[i](r),o=new bt({props:{buttonLabel:r[10],btnDisabled:r[5],btnId:"submit-btn-one-ddone-input"}}),o.$on("button-clicked",r[14]),{c(){ee(e.$$.fragment),t=Z(),n=z("div"),s.c(),a=Z(),ee(o.$$.fragment),P(n,"class","mtop-1")},m(d,p){Q(e,d,p),B(d,t,p),B(d,n,p),u[i].m(n,null),B(d,a,p),Q(o,d,p),l=!0},p(d,p){const m={};p&256&&(m.ddLabel=d[8]),p&8&&(m.dropdownList=d[3]),p&2&&(m.placeholder=d[1].searchString),p&64&&(m.selectedValue=d[6]),e.$set(m);let h=i;i=f(d),i===h?u[i].p(d,p):(De(),I(u[h],1,1,()=>{u[h]=null}),Re(),s=u[i],s?s.p(d,p):(s=u[i]=c[i](d),s.c()),D(s,1),s.m(n,null));const _={};p&1024&&(_.buttonLabel=d[10]),p&32&&(_.btnDisabled=d[5]),o.$set(_)},i(d){l||(D(e.$$.fragment,d),D(s),D(o.$$.fragment,d),l=!0)},o(d){I(e.$$.fragment,d),I(s),I(o.$$.fragment,d),l=!1},d(d){$(e,d),d&&U(t),d&&U(n),u[i].d(),d&&U(a),$(o,d)}}}function Rd(r){let e,t;return e=new Tn({props:{placeholder:r[11],label:r[9],inputId:"one-dd-string-input",inputValue:r[7],className:"small-panel-inputs txt-sm p-1"}}),e.$on("input-value-update",r[18]),{c(){ee(e.$$.fragment)},m(n,i){Q(e,n,i),t=!0},p(n,i){const s={};i&2048&&(s.placeholder=n[11]),i&512&&(s.label=n[9]),i&128&&(s.inputValue=n[7]),e.$set(s)},i(n){t||(D(e.$$.fragment,n),t=!0)},o(n){I(e.$$.fragment,n),t=!1},d(n){$(e,n)}}}function kd(r){let e,t;return e=new Tn({props:{placeholder:r[11],label:r[9],inputId:"one-dd-string-input",inputValue:r[7],className:"small-panel-inputs txt-sm p-1"}}),e.$on("input-value-update",r[17]),{c(){ee(e.$$.fragment)},m(n,i){Q(e,n,i),t=!0},p(n,i){const s={};i&2048&&(s.placeholder=n[11]),i&512&&(s.label=n[9]),i&128&&(s.inputValue=n[7]),e.$set(s)},i(n){t||(D(e.$$.fragment,n),t=!0)},o(n){I(e.$$.fragment,n),t=!1},d(n){$(e,n)}}}function Id(r){let e,t,n,i;const s=[Dd,Ad],a=[];function o(l,c){return!l[2]&&!l[4]?0:1}return t=o(r),n=a[t]=s[t](r),{c(){e=z("div"),n.c()},m(l,c){B(l,e,c),a[t].m(e,null),i=!0},p(l,[c]){let u=t;t=o(l),t===u?a[t].p(l,c):(De(),I(a[u],1,1,()=>{a[u]=null}),Re(),n=a[t],n?n.p(l,c):(n=a[t]=s[t](l),n.c()),D(n,1),n.m(e,null))},i(l){i||(D(n),i=!0)},o(l){I(n),i=!1},d(l){l&&U(e),a[t].d()}}}function Nd(r,e,t){let n,{title:i,localeConsts:s}=e,{isDev:a}=yt;ft(r,a,R=>t(21,n=R));let o=!1,l=[],c=!1,u=!0,f="",d,p="",m="",h="",_="",g=s.submit,v=s.search_placeholder;ct(async()=>{t(4,c=!0),b(),n?t(3,l=[{id:1,name:"Job1"},{id:2,name:"Job2"},{id:3,name:"Job3"},{id:4,name:"Job4"},{id:5,name:"Job5"},{id:6,name:"Job6"},{id:7,name:"Job7"}]):t(3,l=await Pe(_)),t(4,c=!1)});function b(){i===s.Kick?(t(7,d=""),t(8,p=s.player),t(9,m=s.reason),_="getPlayerList",h="kickPlayer",t(10,g=s.kick_btn),t(11,v=s.player_placeholder)):i===s.Warn?(t(7,d=""),t(8,p=s.player),t(9,m=s.reason),_="getPlayerList",h="warnPlayer",t(10,g=s.warn_btn),t(11,v=s.player_placeholder)):i===s.DM_Player?(t(7,d=""),t(8,p=s.player),t(9,m=s.messagePlayerLabel),_="getPlayerList",h="sendDmToPlayer",t(10,g=s.messagePlayerButton),t(11,v=s.player_placeholder)):i===s.Open_Stash&&(t(7,d=""),t(8,p=s.stash_name_label),t(9,m=s.owner_stash_label),_="getStashes",h="openStash",t(10,g=s.submit))}function w(R){t(6,f=R.detail),x()}async function y(){t(2,o=!0),n||await Pe(h,{selectedValue:f,inputValue:d}),t(5,u=!0),t(6,f=""),t(7,d=""),t(2,o=!1)}function x(){i===s.Open_Stash?t(5,u=!1):t(5,u=d.trim()==="")}const S=R=>w(R),M=R=>{t(7,d=R.detail)},T=R=>{t(7,d=R.detail),x()};return r.$$set=R=>{"title"in R&&t(0,i=R.title),"localeConsts"in R&&t(1,s=R.localeConsts)},[i,s,o,l,c,u,f,d,p,m,g,v,a,w,y,x,S,M,T]}class zd extends Xe{constructor(e){super(),We(this,e,Nd,Id,He,{title:0,localeConsts:1})}}function Fd(r){let e,t;return e=new dt({}),{c(){ee(e.$$.fragment)},m(n,i){Q(e,n,i),t=!0},p:_e,i(n){t||(D(e.$$.fragment,n),t=!0)},o(n){I(e.$$.fragment,n),t=!1},d(n){$(e,n)}}}function Od(r){let e,t,n,i,s,a,o,l;e=new bn({props:{ddLabel:r[0].player,dropdownList:r[3],ddId:"two-dd-player-dd-input",placeholder:r[0].player_placeholder,selectedValue:r[4]}}),e.$on("searchable-dd-selected-value",r[19]),n=new bn({props:{ddLabel:r[10],dropdownList:r[6],ddId:"two-dd-item-dd-input",placeholder:r[0].search_placeholder,selectedValue:r[7]}}),n.$on("searchable-dd-selected-value",r[20]),s=new bt({props:{buttonLabel:r[9],btnDisabled:r[5]||r[8],btnId:"submit-btn-two-dd-player-main"}}),s.$on("button-clicked",r[16]);let c=r[11]&&Ha(r);return{c(){ee(e.$$.fragment),t=Z(),ee(n.$$.fragment),i=Z(),ee(s.$$.fragment),a=Z(),c&&c.c(),o=Ft()},m(u,f){Q(e,u,f),B(u,t,f),Q(n,u,f),B(u,i,f),Q(s,u,f),B(u,a,f),c&&c.m(u,f),B(u,o,f),l=!0},p(u,f){const d={};f&1&&(d.ddLabel=u[0].player),f&8&&(d.dropdownList=u[3]),f&1&&(d.placeholder=u[0].player_placeholder),f&16&&(d.selectedValue=u[4]),e.$set(d);const p={};f&1024&&(p.ddLabel=u[10]),f&64&&(p.dropdownList=u[6]),f&1&&(p.placeholder=u[0].search_placeholder),f&128&&(p.selectedValue=u[7]),n.$set(p);const m={};f&512&&(m.buttonLabel=u[9]),f&288&&(m.btnDisabled=u[5]||u[8]),s.$set(m),u[11]?c?(c.p(u,f),f&2048&&D(c,1)):(c=Ha(u),c.c(),D(c,1),c.m(o.parentNode,o)):c&&(De(),I(c,1,1,()=>{c=null}),Re())},i(u){l||(D(e.$$.fragment,u),D(n.$$.fragment,u),D(s.$$.fragment,u),D(c),l=!0)},o(u){I(e.$$.fragment,u),I(n.$$.fragment,u),I(s.$$.fragment,u),I(c),l=!1},d(u){$(e,u),u&&U(t),$(n,u),u&&U(i),$(s,u),u&&U(a),c&&c.d(u),u&&U(o)}}}function Ha(r){let e,t;return e=new bt({props:{buttonLabel:r[0].revert_btn,btnDisabled:r[12],btnId:"submit-btn-two-dd-player-revert"}}),e.$on("button-clicked",r[17]),{c(){ee(e.$$.fragment)},m(n,i){Q(e,n,i),t=!0},p(n,i){const s={};i&1&&(s.buttonLabel=n[0].revert_btn),i&4096&&(s.btnDisabled=n[12]),e.$set(s)},i(n){t||(D(e.$$.fragment,n),t=!0)},o(n){I(e.$$.fragment,n),t=!1},d(n){$(e,n)}}}function Ud(r){let e,t,n,i;const s=[Od,Fd],a=[];function o(l,c){return!l[1]&&!l[2]?0:1}return t=o(r),n=a[t]=s[t](r),{c(){e=z("div"),n.c()},m(l,c){B(l,e,c),a[t].m(e,null),i=!0},p(l,[c]){let u=t;t=o(l),t===u?a[t].p(l,c):(De(),I(a[u],1,1,()=>{a[u]=null}),Re(),n=a[t],n?n.p(l,c):(n=a[t]=s[t](l),n.c()),D(n,1),n.m(e,null))},i(l){i||(D(n),i=!0)},o(l){I(n),i=!1},d(l){l&&U(e),a[t].d()}}}function Bd(r,e,t){let n,{title:i,localeConsts:s}=e,{isDev:a}=yt;ft(r,a,G=>t(23,n=G));let o=!1,l=!1,c=[],u="",f=!0,d=[],p="",m=!0,h=s.submit,_="",g="",v="",b=!1,w=!0;ct(async()=>{t(2,l=!0),i==s.Change_Ped_Model&&t(11,b=!0),y(),n?t(3,c=[{id:1,name:"Sakshi"},{id:2,name:"Pushkar"},{id:3,name:"Monu"},{id:4,name:"Chinu"},{id:5,name:"Vaishnavi"},{id:6,name:"Anvi"},{id:7,name:"Lalla"}]):t(3,c=await Pe("getPlayerList")),n?t(6,d=[{id:"police",name:"Level",grade:0},{id:2,name:"Item2"},{id:3,name:"Item3"},{id:4,name:"Item4"}]):t(6,d=await Pe(g)),t(2,l=!1)});function y(){i===s.Give_Job?(_="setjob",t(10,v=s.jobLabel),g="getJobs",t(9,h=s.submit)):i===s.Give_Car?(_="givecar",t(10,v=s.vehicle),g="getAllVehicles",t(9,h=s.submit)):i===s.Change_Ped_Model?(_="setPedModel",t(10,v=s.modelLabel),g="getModels",t(9,h=s.submit)):i===s.Give_Gang?(_="setGang",t(10,v=s.gangLabel),g="getGangs",t(9,h=s.submit)):i===s.Play_Sound_On_Player?(_="playSoundPlayer",t(10,v=s.soundLabel),g="getSounds",t(9,h=s.submit)):i===s.Give_Perms&&(_="givePerms",t(10,v=s.permsLabel),g="getRoles",t(9,h=s.submit))}function x(G){t(4,u=G.detail),u!==""&&(t(5,f=!1),t(12,w=!1))}function S(G){t(7,p=G.detail),p!==""&&t(8,m=!1)}async function M(){t(1,o=!0),await Pe(_,{selectedPlayer:u,selectedItem:p}),t(5,f=!0),t(8,m=!0),t(12,w=!0),t(4,u=""),t(7,p=""),t(1,o=!1)}async function T(){t(1,o=!0),await Pe("revertClothing",{selectedPlayer:u}),t(5,f=!0),t(8,m=!0),t(12,w=!0),t(4,u=""),t(7,p=""),t(1,o=!1)}const R=G=>x(G),k=G=>S(G);return r.$$set=G=>{"title"in G&&t(18,i=G.title),"localeConsts"in G&&t(0,s=G.localeConsts)},[s,o,l,c,u,f,d,p,m,h,v,b,w,a,x,S,M,T,i,R,k]}class Vd extends Xe{constructor(e){super(),We(this,e,Bd,Ud,He,{title:18,localeConsts:0})}}function Gd(r){let e,t;return e=new dt({}),{c(){ee(e.$$.fragment)},m(n,i){Q(e,n,i),t=!0},p:_e,i(n){t||(D(e.$$.fragment,n),t=!0)},o(n){I(e.$$.fragment,n),t=!1},d(n){$(e,n)}}}function Hd(r){let e,t,n,i,s,a,o,l,c,u,f,d,p,m,h,_;t=new bt({props:{className:"inline-block panel-btns txt-xs",buttonLabel:r[0].vector2,btnDisabled:!1,btnId:"submit-btn-vector-2"}}),t.$on("button-clicked",r[4]);let g=r[2]==="getVector2"&&Wa(r);a=new bt({props:{className:"inline-block panel-btns txt-xs",buttonLabel:r[0].vector3,btnDisabled:!1,btnId:"submit-btn-vector-3"}}),a.$on("button-clicked",r[5]);let v=r[2]==="getVector3"&&Xa(r);u=new bt({props:{className:"inline-block panel-btns txt-xs",buttonLabel:r[0].vector4,btnDisabled:!1,btnId:"submit-btn-vector-4"}}),u.$on("button-clicked",r[6]);let b=r[2]==="getVector4"&&ja(r);m=new bt({props:{className:"inline-block panel-btns txt-xs",buttonLabel:r[0].copy_json,btnDisabled:!1,btnId:"submit-btn-getJson"}}),m.$on("button-clicked",r[7]);let w=r[2]==="getJson"&&qa(r);return{c(){e=z("div"),ee(t.$$.fragment),n=Z(),g&&g.c(),i=Z(),s=z("div"),ee(a.$$.fragment),o=Z(),v&&v.c(),l=Z(),c=z("div"),ee(u.$$.fragment),f=Z(),b&&b.c(),d=Z(),p=z("div"),ee(m.$$.fragment),h=Z(),w&&w.c(),P(e,"class","btn-panel svelte-fd2v0h"),P(s,"class","btn-panel svelte-fd2v0h"),P(c,"class","btn-panel svelte-fd2v0h"),P(p,"class","btn-panel svelte-fd2v0h")},m(y,x){B(y,e,x),Q(t,e,null),E(e,n),g&&g.m(e,null),B(y,i,x),B(y,s,x),Q(a,s,null),E(s,o),v&&v.m(s,null),B(y,l,x),B(y,c,x),Q(u,c,null),E(c,f),b&&b.m(c,null),B(y,d,x),B(y,p,x),Q(m,p,null),E(p,h),w&&w.m(p,null),_=!0},p(y,x){const S={};x&1&&(S.buttonLabel=y[0].vector2),t.$set(S),y[2]==="getVector2"?g?g.p(y,x):(g=Wa(y),g.c(),g.m(e,null)):g&&(g.d(1),g=null);const M={};x&1&&(M.buttonLabel=y[0].vector3),a.$set(M),y[2]==="getVector3"?v?v.p(y,x):(v=Xa(y),v.c(),v.m(s,null)):v&&(v.d(1),v=null);const T={};x&1&&(T.buttonLabel=y[0].vector4),u.$set(T),y[2]==="getVector4"?b?b.p(y,x):(b=ja(y),b.c(),b.m(c,null)):b&&(b.d(1),b=null);const R={};x&1&&(R.buttonLabel=y[0].copy_json),m.$set(R),y[2]==="getJson"?w?w.p(y,x):(w=qa(y),w.c(),w.m(p,null)):w&&(w.d(1),w=null)},i(y){_||(D(t.$$.fragment,y),D(a.$$.fragment,y),D(u.$$.fragment,y),D(m.$$.fragment,y),_=!0)},o(y){I(t.$$.fragment,y),I(a.$$.fragment,y),I(u.$$.fragment,y),I(m.$$.fragment,y),_=!1},d(y){y&&U(e),$(t),g&&g.d(),y&&U(i),y&&U(s),$(a),v&&v.d(),y&&U(l),y&&U(c),$(u),b&&b.d(),y&&U(d),y&&U(p),$(m),w&&w.d()}}}function Wa(r){let e,t=r[0].copy_to_clipboard+"",n;return{c(){e=z("p"),n=J(t),P(e,"class","inline-block svelte-fd2v0h")},m(i,s){B(i,e,s),E(e,n)},p(i,s){s&1&&t!==(t=i[0].copy_to_clipboard+"")&&pe(n,t)},d(i){i&&U(e)}}}function Xa(r){let e,t=r[0].copy_to_clipboard+"",n;return{c(){e=z("p"),n=J(t),P(e,"class","inline-block svelte-fd2v0h")},m(i,s){B(i,e,s),E(e,n)},p(i,s){s&1&&t!==(t=i[0].copy_to_clipboard+"")&&pe(n,t)},d(i){i&&U(e)}}}function ja(r){let e,t=r[0].copy_to_clipboard+"",n;return{c(){e=z("p"),n=J(t),P(e,"class","inline-block svelte-fd2v0h")},m(i,s){B(i,e,s),E(e,n)},p(i,s){s&1&&t!==(t=i[0].copy_to_clipboard+"")&&pe(n,t)},d(i){i&&U(e)}}}function qa(r){let e,t=r[0].copy_to_clipboard+"",n;return{c(){e=z("p"),n=J(t),P(e,"class","inline-block svelte-fd2v0h")},m(i,s){B(i,e,s),E(e,n)},p(i,s){s&1&&t!==(t=i[0].copy_to_clipboard+"")&&pe(n,t)},d(i){i&&U(e)}}}function Wd(r){let e,t,n,i;const s=[Hd,Gd],a=[];function o(l,c){return l[1]?1:0}return t=o(r),n=a[t]=s[t](r),{c(){e=z("div"),n.c()},m(l,c){B(l,e,c),a[t].m(e,null),i=!0},p(l,[c]){let u=t;t=o(l),t===u?a[t].p(l,c):(De(),I(a[u],1,1,()=>{a[u]=null}),Re(),n=a[t],n?n.p(l,c):(n=a[t]=s[t](l),n.c()),D(n,1),n.m(e,null))},i(l){i||(D(n),i=!0)},o(l){I(n),i=!1},d(l){l&&U(e),a[t].d()}}}function Xd(r,e,t){let{localeConsts:n}=e,i="",s=!1,a="";async function o(d){t(2,a=d),t(1,s=!0),i=await Pe(d);var p=document.createElement("textarea");document.body.appendChild(p),p.value=i,p.select(),document.execCommand("copy"),document.body.removeChild(p),t(1,s=!1)}const l=()=>o("getVector2"),c=()=>o("getVector3"),u=()=>o("getVector4"),f=()=>o("getJson");return r.$$set=d=>{"localeConsts"in d&&t(0,n=d.localeConsts)},[n,s,a,o,l,c,u,f]}class jd extends Xe{constructor(e){super(),We(this,e,Xd,Wd,He,{localeConsts:0})}}function Ya(r,e,t){const n=r.slice();return n[7]=e[t],n}function qd(r){let e=r[7][r[1]]+"",t;return{c(){t=J(e)},m(n,i){B(n,t,i)},p(n,i){i&3&&e!==(e=n[7][n[1]]+"")&&pe(t,e)},d(n){n&&U(t)}}}function Yd(r){let e,t=r[7].id+"",n,i,s=r[7][r[1]]+"",a;return{c(){e=J("("),n=J(t),i=J(") "),a=J(s)},m(o,l){B(o,e,l),B(o,n,l),B(o,i,l),B(o,a,l)},p(o,l){l&1&&t!==(t=o[7].id+"")&&pe(n,t),l&3&&s!==(s=o[7][o[1]]+"")&&pe(a,s)},d(o){o&&U(e),o&&U(n),o&&U(i),o&&U(a)}}}function Zd(r){let e=r[7]+"",t;return{c(){t=J(e)},m(n,i){B(n,t,i)},p(n,i){i&1&&e!==(e=n[7]+"")&&pe(t,e)},d(n){n&&U(t)}}}function Za(r){let e,t,n,i;function s(l,c){return c&1&&(t=null),l[3]?Zd:(t==null&&(t=!!l[7].hasOwnProperty("id")),t?Yd:qd)}let a=s(r,-1),o=a(r);return{c(){e=z("option"),o.c(),n=Z(),e.__value=i=r[1]===null?r[7]:r[7][r[1]],e.value=e.__value},m(l,c){B(l,e,c),o.m(e,null),E(e,n)},p(l,c){a===(a=s(l,c))&&o?o.p(l,c):(o.d(1),o=a(l),o&&(o.c(),o.m(e,n))),c&3&&i!==(i=l[1]===null?l[7]:l[7][l[1]])&&(e.__value=i,e.value=e.__value)},d(l){l&&U(e),o.d()}}}function Kd(r){let e,t,n,i,s=r[0],a=[];for(let o=0;o<s.length;o+=1)a[o]=Za(Ya(r,s,o));return{c(){e=z("div"),t=z("select");for(let o=0;o<a.length;o+=1)a[o].c();r[2]===void 0&&fi(()=>r[5].call(t)),P(e,"class","inline-block regular-dropdown")},m(o,l){B(o,e,l),E(e,t);for(let c=0;c<a.length;c+=1)a[c].m(t,null);Da(t,r[2]),n||(i=[ze(t,"change",r[5]),ze(t,"change",r[4])],n=!0)},p(o,[l]){if(l&11){s=o[0];let c;for(c=0;c<s.length;c+=1){const u=Ya(o,s,c);a[c]?a[c].p(u,l):(a[c]=Za(u),a[c].c(),a[c].m(t,null))}for(;c<a.length;c+=1)a[c].d(1);a.length=s.length}l&7&&Da(t,o[2])},i:_e,o:_e,d(o){o&&U(e),Pt(a,o),n=!1,xt(i)}}}function Jd(r,e,t){let{dropdownValues:n,selectKey:i=null}=e,s=i==null,a;const o=ln();function l(){o("regular-dropdown-select",a)}function c(){a=xu(this),t(2,a),t(1,i),t(0,n)}return r.$$set=u=>{"dropdownValues"in u&&t(0,n=u.dropdownValues),"selectKey"in u&&t(1,i=u.selectKey)},[n,i,a,s,l,c]}class Ui extends Xe{constructor(e){super(),We(this,e,Jd,Kd,He,{dropdownValues:0,selectKey:1})}}function Qd(r){let e,t;return e=new dt({}),{c(){ee(e.$$.fragment)},m(n,i){Q(e,n,i),t=!0},p:_e,i(n){t||(D(e.$$.fragment,n),t=!0)},o(n){I(e.$$.fragment,n),t=!1},d(n){$(e,n)}}}function $d(r){let e,t,n,i,s,a,o,l,c,u,f,d;return e=new bn({props:{ddLabel:r[0].player,dropdownList:r[3],ddId:"ban-player-dd-input",placeholder:r[0].player_placeholder,selectedValue:r[4]}}),e.$on("searchable-dd-selected-value",r[17]),n=new Oi({props:{placeholder:r[0].ban_time,label:r[0].ban_time,inputId:"ban-player-time-input",inputValue:r[8],className:"inline-block",width:"40%"}}),n.$on("input-value-update",r[18]),s=new Ui({props:{dropdownValues:r[12]}}),s.$on("regular-dropdown-select",r[19]),o=new us({props:{checkboxValue:r[6],checkboxLabel:r[0].permanent,checkboxId:r[6]}}),o.$on("checkbox-clicked",r[20]),c=new Tn({props:{placeholder:r[0].reason_placeholder,label:r[0].reason,inputId:"ban-player-reason-input",inputValue:r[7]}}),c.$on("input-value-update",r[21]),f=new bt({props:{buttonLabel:r[0].ban_btn,btnDisabled:r[5]||r[10],btnId:"submit-btn-ban-player"}}),f.$on("button-clicked",r[15]),{c(){ee(e.$$.fragment),t=Z(),ee(n.$$.fragment),i=Z(),ee(s.$$.fragment),a=Z(),ee(o.$$.fragment),l=Z(),ee(c.$$.fragment),u=Z(),ee(f.$$.fragment)},m(p,m){Q(e,p,m),B(p,t,m),Q(n,p,m),B(p,i,m),Q(s,p,m),B(p,a,m),Q(o,p,m),B(p,l,m),Q(c,p,m),B(p,u,m),Q(f,p,m),d=!0},p(p,m){const h={};m&1&&(h.ddLabel=p[0].player),m&8&&(h.dropdownList=p[3]),m&1&&(h.placeholder=p[0].player_placeholder),m&16&&(h.selectedValue=p[4]),e.$set(h);const _={};m&1&&(_.placeholder=p[0].ban_time),m&1&&(_.label=p[0].ban_time),m&256&&(_.inputValue=p[8]),n.$set(_);const g={};m&64&&(g.checkboxValue=p[6]),m&1&&(g.checkboxLabel=p[0].permanent),m&64&&(g.checkboxId=p[6]),o.$set(g);const v={};m&1&&(v.placeholder=p[0].reason_placeholder),m&1&&(v.label=p[0].reason),m&128&&(v.inputValue=p[7]),c.$set(v);const b={};m&1&&(b.buttonLabel=p[0].ban_btn),m&1056&&(b.btnDisabled=p[5]||p[10]),f.$set(b)},i(p){d||(D(e.$$.fragment,p),D(n.$$.fragment,p),D(s.$$.fragment,p),D(o.$$.fragment,p),D(c.$$.fragment,p),D(f.$$.fragment,p),d=!0)},o(p){I(e.$$.fragment,p),I(n.$$.fragment,p),I(s.$$.fragment,p),I(o.$$.fragment,p),I(c.$$.fragment,p),I(f.$$.fragment,p),d=!1},d(p){$(e,p),p&&U(t),$(n,p),p&&U(i),$(s,p),p&&U(a),$(o,p),p&&U(l),$(c,p),p&&U(u),$(f,p)}}}function eh(r){let e,t,n,i;const s=[$d,Qd],a=[];function o(l,c){return!l[1]&&!l[2]?0:1}return t=o(r),n=a[t]=s[t](r),{c(){e=z("div"),n.c()},m(l,c){B(l,e,c),a[t].m(e,null),i=!0},p(l,[c]){let u=t;t=o(l),t===u?a[t].p(l,c):(De(),I(a[u],1,1,()=>{a[u]=null}),Re(),n=a[t],n?n.p(l,c):(n=a[t]=s[t](l),n.c()),D(n,1),n.m(e,null))},i(l){i||(D(n),i=!0)},o(l){I(n),i=!1},d(l){l&&U(e),a[t].d()}}}function th(r,e,t){let n,{title:i,localeConsts:s}=e,{isDev:a}=yt;ft(r,a,F=>t(24,n=F));let o=!1,l=!1,c=[],u="",f=!0,d="",p="",m=!1,h="",_,g=["Minutes","Hours","Weeks","Months","Year"],v="Minutes",b=!0;ct(async()=>{t(2,l=!0),w(),n?t(3,c=[{id:1,name:"Sakshi"},{id:2,name:"Pushkar"},{id:3,name:"Monu"},{id:4,name:"Chinu"},{id:5,name:"Vaishnavi"},{id:6,name:"Anvi"},{id:7,name:"Lalla"}]):t(3,c=await Pe(p)),t(2,l=!1)});function w(){i===s.Ban_Player?(p="getPlayerList",d="banPlayer"):i===s.Ban_Offline_Player&&(p="getAllPlayersOffline",d="banOfflinePlayer")}function y(F){t(4,u=F.detail),u!==""&&t(5,f=!1)}function x(){let F=!1;_!==""&&_!==null&&!m&&_!==void 0&&(F=_.toString().split(".").length>1);let O=m?!1:_<=0||!Number.isInteger(_);t(10,b=O||F||h.trim()==="")}async function S(){t(1,o=!0),await Pe(d,{selectedPlayer:u,banTime:_,banOpt:v,isPermanent:m==="true"||m===!0,reason:h}),t(5,f=!0),t(4,u=""),t(6,m=!1),t(8,_=0),t(7,h=""),t(9,v="Minutes"),t(1,o=!1)}const M=F=>y(F),T=F=>{t(8,_=F.detail),x()},R=F=>t(9,v=F.detail),k=F=>{t(6,m=F.detail),x()},G=F=>{t(7,h=F.detail),x()};return r.$$set=F=>{"title"in F&&t(16,i=F.title),"localeConsts"in F&&t(0,s=F.localeConsts)},[s,o,l,c,u,f,m,h,_,v,b,a,g,y,x,S,i,M,T,R,k,G]}class nh extends Xe{constructor(e){super(),We(this,e,th,eh,He,{title:16,localeConsts:0})}}function ih(r){let e,t;return e=new dt({}),{c(){ee(e.$$.fragment)},m(n,i){Q(e,n,i),t=!0},p:_e,i(n){t||(D(e.$$.fragment,n),t=!0)},o(n){I(e.$$.fragment,n),t=!1},d(n){$(e,n)}}}function rh(r){let e,t,n,i;return e=new Oi({props:{placeholder:r[5],label:r[3],inputId:"clear-area-input",inputValue:r[2]}}),e.$on("input-value-update",r[10]),n=new bt({props:{buttonLabel:r[4],btnDisabled:r[0],btnId:"submit-btn-change-area"}}),n.$on("button-clicked",r[7]),{c(){ee(e.$$.fragment),t=Z(),ee(n.$$.fragment)},m(s,a){Q(e,s,a),B(s,t,a),Q(n,s,a),i=!0},p(s,a){const o={};a&32&&(o.placeholder=s[5]),a&8&&(o.label=s[3]),a&4&&(o.inputValue=s[2]),e.$set(o);const l={};a&16&&(l.buttonLabel=s[4]),a&1&&(l.btnDisabled=s[0]),n.$set(l)},i(s){i||(D(e.$$.fragment,s),D(n.$$.fragment,s),i=!0)},o(s){I(e.$$.fragment,s),I(n.$$.fragment,s),i=!1},d(s){$(e,s),s&&U(t),$(n,s)}}}function sh(r){let e,t,n,i;const s=[rh,ih],a=[];function o(l,c){return l[1]?1:0}return t=o(r),n=a[t]=s[t](r),{c(){e=z("div"),n.c()},m(l,c){B(l,e,c),a[t].m(e,null),i=!0},p(l,[c]){let u=t;t=o(l),t===u?a[t].p(l,c):(De(),I(a[u],1,1,()=>{a[u]=null}),Re(),n=a[t],n?n.p(l,c):(n=a[t]=s[t](l),n.c()),D(n,1),n.m(e,null))},i(l){i||(D(n),i=!0)},o(l){I(n),i=!1},d(l){l&&U(e),a[t].d()}}}function ah(r,e,t){let{title:n,localeConsts:i}=e,s=!0,a=!1,o,l="",c="",u=i.submit,f=i.search_placeholder;ct(async()=>{d()});function d(){n===i.Clear_Area_Vehicles?(t(2,o=""),i.clear_area,t(3,l=i.radius),c="clearVehicles",t(4,u=i.clear_area),t(5,f=i.enter_radius_placeholder)):n===i.Clear_Area_Peds?(t(2,o=""),i.clear_area,t(3,l=i.radius),c="clearPeds",t(4,u=i.clear_area),t(5,f=i.enter_radius_placeholder)):n===i.Clear_Area_Objects&&(t(2,o=""),i.clear_area,t(3,l=i.radius),c="clearObjects",t(4,u=i.clear_area),t(5,f=i.enter_radius_placeholder))}function p(){t(0,s=o<=0||!Number.isInteger(o))}async function m(){t(1,a=!0),await Pe(c,{radius:o}),t(0,s=!0),t(2,o=""),t(1,a=!1)}const h=_=>{t(2,o=_.detail),p()};return r.$$set=_=>{"title"in _&&t(8,n=_.title),"localeConsts"in _&&t(9,i=_.localeConsts)},[s,a,o,l,u,f,p,m,n,i,h]}class oh extends Xe{constructor(e){super(),We(this,e,ah,sh,He,{title:8,localeConsts:9})}}function lh(r){let e,t;return e=new dt({}),{c(){ee(e.$$.fragment)},m(n,i){Q(e,n,i),t=!0},p:_e,i(n){t||(D(e.$$.fragment,n),t=!0)},o(n){I(e.$$.fragment,n),t=!1},d(n){$(e,n)}}}function ch(r){let e,t,n,i,s;e=new bn({props:{ddLabel:r[8],dropdownList:r[3],ddId:"player-dd-input",placeholder:r[1].search,selectedValue:r[6]}}),e.$on("searchable-dd-selected-value",r[13]);let a=r[0]===r[1].Change_Weather&&Ka(r);return i=new bt({props:{buttonLabel:r[9],btnDisabled:r[7],btnId:"submit-btn-single-dd"}}),i.$on("button-clicked",r[12]),{c(){ee(e.$$.fragment),t=Z(),a&&a.c(),n=Z(),ee(i.$$.fragment)},m(o,l){Q(e,o,l),B(o,t,l),a&&a.m(o,l),B(o,n,l),Q(i,o,l),s=!0},p(o,l){const c={};l&256&&(c.ddLabel=o[8]),l&8&&(c.dropdownList=o[3]),l&2&&(c.placeholder=o[1].search),l&64&&(c.selectedValue=o[6]),e.$set(c),o[0]===o[1].Change_Weather?a?a.p(o,l):(a=Ka(o),a.c(),a.m(n.parentNode,n)):a&&(a.d(1),a=null);const u={};l&512&&(u.buttonLabel=o[9]),l&128&&(u.btnDisabled=o[7]),i.$set(u)},i(o){s||(D(e.$$.fragment,o),D(i.$$.fragment,o),s=!0)},o(o){I(e.$$.fragment,o),I(i.$$.fragment,o),s=!1},d(o){$(e,o),o&&U(t),a&&a.d(o),o&&U(n),$(i,o)}}}function Ka(r){let e,t=r[1].current_weather+"",n,i,s;return{c(){e=z("div"),n=J(t),i=J(": "),s=J(r[4])},m(a,o){B(a,e,o),E(e,n),E(e,i),E(e,s)},p(a,o){o&2&&t!==(t=a[1].current_weather+"")&&pe(n,t),o&16&&pe(s,a[4])},d(a){a&&U(e)}}}function uh(r){let e,t,n,i;const s=[ch,lh],a=[];function o(l,c){return!l[2]&&!l[5]?0:1}return t=o(r),n=a[t]=s[t](r),{c(){e=z("div"),n.c()},m(l,c){B(l,e,c),a[t].m(e,null),i=!0},p(l,[c]){let u=t;t=o(l),t===u?a[t].p(l,c):(De(),I(a[u],1,1,()=>{a[u]=null}),Re(),n=a[t],n?n.p(l,c):(n=a[t]=s[t](l),n.c()),D(n,1),n.m(e,null))},i(l){i||(D(n),i=!0)},o(l){I(n),i=!1},d(l){l&&U(e),a[t].d()}}}function fh(r,e,t){let n,{title:i,localeConsts:s}=e,{isDev:a}=yt;ft(r,a,y=>t(16,n=y));let o=!1,l=[],c="",u=!1,f="",d=!0,p=s.label,m=s.submit,h="",_="";ct(async()=>{t(5,u=!0),g(),n?t(3,l=[{id:1,name:"Sakshi"},{id:2,name:"Pushkar"},{id:3,name:"Monu"},{id:4,name:"Chinu"},{id:5,name:"Vaishnavi"},{id:6,name:"Anvi"},{id:7,name:"Lalla"}]):(t(3,l=await Pe(_)),t(4,c=await Pe("getCurrentWeather"))),t(5,u=!1)});function g(){i===s.Change_Weather?(t(8,p=s.weather_label),_="getWeatherList",h="setWeather",t(9,m=s.weather_btn)):i===s.Remove_Perms&&(t(8,p=s.Remove_Perms_label),_="getAdmins",h="removeRoles",t(9,m=s.submit))}function v(y){t(6,f=y.detail),f!==""&&t(7,d=!1)}async function b(){t(2,o=!0),await Pe(h,{selectedValue:f}),t(6,f=""),t(2,o=!1)}const w=y=>v(y);return r.$$set=y=>{"title"in y&&t(0,i=y.title),"localeConsts"in y&&t(1,s=y.localeConsts)},[i,s,o,l,c,u,f,d,p,m,a,v,b,w]}class dh extends Xe{constructor(e){super(),We(this,e,fh,uh,He,{title:0,localeConsts:1})}}function hh(r){let e,t;return e=new dt({}),{c(){ee(e.$$.fragment)},m(n,i){Q(e,n,i),t=!0},p:_e,i(n){t||(D(e.$$.fragment,n),t=!0)},o(n){I(e.$$.fragment,n),t=!1},d(n){$(e,n)}}}function ph(r){let e,t=r[0].time_and_period+"",n,i,s,a,o,l,c,u,f;return a=new Ui({props:{dropdownValues:r[4]}}),a.$on("regular-dropdown-select",r[7]),l=new Ui({props:{dropdownValues:r[5]}}),l.$on("regular-dropdown-select",r[8]),u=new bt({props:{buttonLabel:r[0].change_time,btnDisabled:r[2]===""||r[3]==="",btnId:"submit-btn-change-time"}}),u.$on("button-clicked",r[6]),{c(){e=z("p"),n=J(t),i=J(":"),s=Z(),ee(a.$$.fragment),o=Z(),ee(l.$$.fragment),c=Z(),ee(u.$$.fragment),P(e,"class","block txt-sm panel-labels")},m(d,p){B(d,e,p),E(e,n),E(e,i),B(d,s,p),Q(a,d,p),B(d,o,p),Q(l,d,p),B(d,c,p),Q(u,d,p),f=!0},p(d,p){(!f||p&1)&&t!==(t=d[0].time_and_period+"")&&pe(n,t);const m={};p&1&&(m.buttonLabel=d[0].change_time),p&12&&(m.btnDisabled=d[2]===""||d[3]===""),u.$set(m)},i(d){f||(D(a.$$.fragment,d),D(l.$$.fragment,d),D(u.$$.fragment,d),f=!0)},o(d){I(a.$$.fragment,d),I(l.$$.fragment,d),I(u.$$.fragment,d),f=!1},d(d){d&&U(e),d&&U(s),$(a,d),d&&U(o),$(l,d),d&&U(c),$(u,d)}}}function mh(r){let e,t,n,i;const s=[ph,hh],a=[];function o(l,c){return!l[1]&&!_h?0:1}return t=o(r),n=a[t]=s[t](r),{c(){e=z("div"),n.c()},m(l,c){B(l,e,c),a[t].m(e,null),i=!0},p(l,[c]){let u=t;t=o(l),t===u?a[t].p(l,c):(De(),I(a[u],1,1,()=>{a[u]=null}),Re(),n=a[t],n?n.p(l,c):(n=a[t]=s[t](l),n.c()),D(n,1),n.m(e,null))},i(l){i||(D(n),i=!0)},o(l){I(n),i=!1},d(l){l&&U(e),a[t].d()}}}let _h=!1;function gh(r,e,t){let{localeConsts:n}=e,i=!1,s=[1,2,3,4,5,6,7,8,9,10,11,12],a=["AM","PM"],o="",l="AM";async function c(){t(1,i=!0),await Pe("setTime",{selectedTime:o,selectedPeriod:l}),t(2,o=""),t(3,l="AM"),t(1,i=!1)}const u=d=>t(2,o=d.detail),f=d=>t(3,l=d.detail);return r.$$set=d=>{"localeConsts"in d&&t(0,n=d.localeConsts)},[n,i,o,l,s,a,c,u,f]}class bh extends Xe{constructor(e){super(),We(this,e,gh,mh,He,{localeConsts:0})}}function Ja(r,e,t){const n=r.slice();return n[18]=e[t],n[20]=t,n}function vh(r){let e,t,n,i=r[2],s=[];for(let o=0;o<i.length;o+=1)s[o]=Qa(Ja(r,i,o));const a=o=>I(s[o],1,1,()=>{s[o]=null});return t=new bt({props:{buttonLabel:r[1].submit,btnDisabled:r[4],btnId:r[0].keyName+"-submit-btn"}}),t.$on("button-clicked",r[5]),{c(){for(let o=0;o<s.length;o+=1)s[o].c();e=Z(),ee(t.$$.fragment)},m(o,l){for(let c=0;c<s.length;c+=1)s[c].m(o,l);B(o,e,l),Q(t,o,l),n=!0},p(o,l){if(l&68){i=o[2];let u;for(u=0;u<i.length;u+=1){const f=Ja(o,i,u);s[u]?(s[u].p(f,l),D(s[u],1)):(s[u]=Qa(f),s[u].c(),D(s[u],1),s[u].m(e.parentNode,e))}for(De(),u=i.length;u<s.length;u+=1)a(u);Re()}const c={};l&2&&(c.buttonLabel=o[1].submit),l&16&&(c.btnDisabled=o[4]),l&1&&(c.btnId=o[0].keyName+"-submit-btn"),t.$set(c)},i(o){if(!n){for(let l=0;l<i.length;l+=1)D(s[l]);D(t.$$.fragment,o),n=!0}},o(o){s=s.filter(Boolean);for(let l=0;l<s.length;l+=1)I(s[l]);I(t.$$.fragment,o),n=!1},d(o){Pt(s,o),o&&U(e),$(t,o)}}}function yh(r){let e,t;return e=new dt({}),{c(){ee(e.$$.fragment)},m(n,i){Q(e,n,i),t=!0},p:_e,i(n){t||(D(e.$$.fragment,n),t=!0)},o(n){I(e.$$.fragment,n),t=!1},d(n){$(e,n)}}}function wh(r){let e,t,n;function i(...s){return r[11](r[18],...s)}return t=new bn({props:{ddLabel:r[18].label,dropdownList:r[18].fetchedData,ddId:r[18].type+"-"+r[20],placeholder:r[18].placeholder,selectedValue:r[18].selectedValue}}),t.$on("searchable-dd-selected-value",i),{c(){e=z("div"),ee(t.$$.fragment),P(e,"class","svelte-1wiqead")},m(s,a){B(s,e,a),Q(t,e,null),n=!0},p(s,a){r=s;const o={};a&4&&(o.ddLabel=r[18].label),a&4&&(o.dropdownList=r[18].fetchedData),a&4&&(o.ddId=r[18].type+"-"+r[20]),a&4&&(o.placeholder=r[18].placeholder),a&4&&(o.selectedValue=r[18].selectedValue),t.$set(o)},i(s){n||(D(t.$$.fragment,s),n=!0)},o(s){I(t.$$.fragment,s),n=!1},d(s){s&&U(e),$(t)}}}function Mh(r){let e,t,n;function i(...s){return r[10](r[18],...s)}return t=new us({props:{checkboxValue:r[18].selectedValue,checkboxLabel:r[18].label,checkboxId:r[18].type+"-"+r[20]}}),t.$on("checkbox-clicked",i),{c(){e=z("div"),ee(t.$$.fragment),P(e,"class","svelte-1wiqead")},m(s,a){B(s,e,a),Q(t,e,null),n=!0},p(s,a){r=s;const o={};a&4&&(o.checkboxValue=r[18].selectedValue),a&4&&(o.checkboxLabel=r[18].label),a&4&&(o.checkboxId=r[18].type+"-"+r[20]),t.$set(o)},i(s){n||(D(t.$$.fragment,s),n=!0)},o(s){I(t.$$.fragment,s),n=!1},d(s){s&&U(e),$(t)}}}function xh(r){let e,t,n=r[18].label+"",i,s,a,o,l;function c(...u){return r[9](r[18],...u)}return o=new Ui({props:{dropdownValues:r[18].fetchedData}}),o.$on("regular-dropdown-select",c),{c(){e=z("div"),t=z("p"),i=J(n),s=J(":"),a=Z(),ee(o.$$.fragment),P(t,"class","block txt-sm panel-labels"),P(e,"class","svelte-1wiqead")},m(u,f){B(u,e,f),E(e,t),E(t,i),E(t,s),E(e,a),Q(o,e,null),l=!0},p(u,f){r=u,(!l||f&4)&&n!==(n=r[18].label+"")&&pe(i,n);const d={};f&4&&(d.dropdownValues=r[18].fetchedData),o.$set(d)},i(u){l||(D(o.$$.fragment,u),l=!0)},o(u){I(o.$$.fragment,u),l=!1},d(u){u&&U(e),$(o)}}}function Sh(r){let e,t,n;function i(...s){return r[8](r[18],...s)}return t=new Oi({props:{placeholder:r[18].placeholder,label:r[18].label,inputId:r[18].type+"-"+r[20],inputValue:r[18].selectedValue}}),t.$on("input-value-update",i),{c(){e=z("div"),ee(t.$$.fragment),P(e,"class","svelte-1wiqead")},m(s,a){B(s,e,a),Q(t,e,null),n=!0},p(s,a){r=s;const o={};a&4&&(o.placeholder=r[18].placeholder),a&4&&(o.label=r[18].label),a&4&&(o.inputId=r[18].type+"-"+r[20]),a&4&&(o.inputValue=r[18].selectedValue),t.$set(o)},i(s){n||(D(t.$$.fragment,s),n=!0)},o(s){I(t.$$.fragment,s),n=!1},d(s){s&&U(e),$(t)}}}function Ch(r){let e,t,n;function i(...s){return r[7](r[18],...s)}return t=new Tn({props:{placeholder:r[18].placeholder,label:r[18].label,inputId:r[18].type+"-"+r[20],inputValue:r[18].selectedValue}}),t.$on("input-value-update",i),{c(){e=z("div"),ee(t.$$.fragment),P(e,"class","svelte-1wiqead")},m(s,a){B(s,e,a),Q(t,e,null),n=!0},p(s,a){r=s;const o={};a&4&&(o.placeholder=r[18].placeholder),a&4&&(o.label=r[18].label),a&4&&(o.inputId=r[18].type+"-"+r[20]),a&4&&(o.inputValue=r[18].selectedValue),t.$set(o)},i(s){n||(D(t.$$.fragment,s),n=!0)},o(s){I(t.$$.fragment,s),n=!1},d(s){s&&U(e),$(t)}}}function Qa(r){let e,t,n,i;const s=[Ch,Sh,xh,Mh,wh],a=[];function o(l,c){return l[18].type==="string-input"?0:l[18].type==="number-input"?1:l[18].type==="regular-dropdown"?2:l[18].type==="checkbox-input"?3:l[18].type==="searchable-dropdown"?4:-1}return~(e=o(r))&&(t=a[e]=s[e](r)),{c(){t&&t.c(),n=Ft()},m(l,c){~e&&a[e].m(l,c),B(l,n,c),i=!0},p(l,c){let u=e;e=o(l),e===u?~e&&a[e].p(l,c):(t&&(De(),I(a[u],1,1,()=>{a[u]=null}),Re()),~e?(t=a[e],t?t.p(l,c):(t=a[e]=s[e](l),t.c()),D(t,1),t.m(n.parentNode,n)):t=null)},i(l){i||(D(t),i=!0)},o(l){I(t),i=!1},d(l){~e&&a[e].d(l),l&&U(n)}}}function Th(r){let e,t,n,i;const s=[yh,vh],a=[];function o(l,c){return l[3]?0:1}return t=o(r),n=a[t]=s[t](r),{c(){e=z("div"),n.c(),P(e,"class","custom-panel-page svelte-1wiqead")},m(l,c){B(l,e,c),a[t].m(e,null),i=!0},p(l,[c]){let u=t;t=o(l),t===u?a[t].p(l,c):(De(),I(a[u],1,1,()=>{a[u]=null}),Re(),n=a[t],n?n.p(l,c):(n=a[t]=s[t](l),n.c()),D(n,1),n.m(e,null))},i(l){i||(D(n),i=!0)},o(l){I(n),i=!1},d(l){l&&U(e),a[t].d()}}}function Eh(r,e,t){let{panelData:n,localeConsts:i}=e,s="",a=[],o=[],l={},c=!1,u=!0;ct(()=>{t(3,c=!0),s=n.cb,t(2,a=n.components),f(),o=a.filter(w=>w.fillCompulsory),d()});function f(){let w=[];l=a.reduce((x,S)=>(S.fetchDataUrl&&S.fetchDataUrl.trim()!==""&&!l.hasOwnProperty(S.fetchDataUrl)&&(x[S.fetchDataUrl]=null),x),{}),Object.keys(l).map(x=>{w.push(new Promise(async(S,M)=>{const T=await Pe(x);l[x]=T,S(l)}))}),Promise.all(w).then(x=>{a.map(S=>{S.fetchDataUrl&&l.hasOwnProperty(S.fetchDataUrl.trim())&&(S.fetchedData=l[S.fetchDataUrl.trim()]),S.selectedValue=S.type==="regular-dropdown"?S.fetchedData[0]:S.type==="checkbox-input"?!1:null}),t(3,c=!1)})}function d(){const w=y=>y.selectedValue!==null&&(typeof y.selectedValue=="string"?y.selectedValue.trim()!=="":!0);t(4,u=!o.every(w))}async function p(){t(3,c=!0);let w={};a.map(x=>{w[x.keyName]=x.selectedValue}),await Pe(s,w);let y=a.map(x=>(x.selectedValue=x.type==="regular-dropdown"?x.fetchedData[0]:x.type==="checkbox-input"?!1:null,x));t(2,a=y),d(),t(3,c=!1)}function m(w,y){y.selectedValue=w.detail,d()}const h=(w,y)=>m(y,w),_=(w,y)=>m(y,w),g=(w,y)=>m(y,w),v=(w,y)=>m(y,w),b=(w,y)=>m(y,w);return r.$$set=w=>{"panelData"in w&&t(0,n=w.panelData),"localeConsts"in w&&t(1,i=w.localeConsts)},[n,i,a,c,u,p,m,h,_,g,v,b]}class Lh extends Xe{constructor(e){super(),We(this,e,Eh,Th,He,{panelData:0,localeConsts:1})}}function Ph(r){let e,t;return e=new zt({props:{icon:Ef,class:"txt-xs"}}),{c(){ee(e.$$.fragment)},m(n,i){Q(e,n,i),t=!0},p:_e,i(n){t||(D(e.$$.fragment,n),t=!0)},o(n){I(e.$$.fragment,n),t=!1},d(n){$(e,n)}}}function Ah(r){let e,t;return e=new zt({props:{icon:xf,class:"txt-xs",color:"gold"}}),{c(){ee(e.$$.fragment)},m(n,i){Q(e,n,i),t=!0},p:_e,i(n){t||(D(e.$$.fragment,n),t=!0)},o(n){I(e.$$.fragment,n),t=!1},d(n){$(e,n)}}}function $a(r){let e,t,n;return t=new zt({props:{icon:r[3]?ls:gr,class:"txt-xs"}}),{c(){e=z("div"),ee(t.$$.fragment),P(e,"class","chevron-sign")},m(i,s){B(i,e,s),Q(t,e,null),n=!0},p(i,s){const a={};s&8&&(a.icon=i[3]?ls:gr),t.$set(a)},i(i){n||(D(t.$$.fragment,i),n=!0)},o(i){I(t.$$.fragment,i),n=!1},d(i){i&&U(e),$(t)}}}function eo(r){let e,t,n,i;const s=[r[5]];var a=r[4];function o(l){let c={};for(let u=0;u<s.length;u+=1)c=_u(c,s[u]);return{props:c}}return a&&(t=new a(o())),{c(){e=z("div"),t&&ee(t.$$.fragment),P(e,"class","open-panels")},m(l,c){B(l,e,c),t&&Q(t,e,null),i=!0},p(l,c){const u=c&32?Fu(s,[Ou(l[5])]):{};if(a!==(a=l[4])){if(t){De();const f=t;I(f.$$.fragment,1,0,()=>{$(f,1)}),Re()}a?(t=new a(o()),ee(t.$$.fragment),D(t.$$.fragment,1),Q(t,e,null)):t=null}else a&&t.$set(u)},i(l){i||(t&&D(t.$$.fragment,l),fi(()=>{n||(n=as(e,cs,{duration:400},!0)),n.run(1)}),i=!0)},o(l){t&&I(t.$$.fragment,l),n||(n=as(e,cs,{duration:400},!1)),n.run(0),i=!1},d(l){l&&U(e),t&&$(t),l&&n&&n.end()}}}function Dh(r){let e,t,n,i,s,a,o,l,c=r[0].title+"",u,f,d,p,m,h,_;const g=[Ah,Ph],v=[];function b(x,S){return x[0].isStarred==="1"?0:1}i=b(r),s=v[i]=g[i](r);let w=r[0].hasPanel&&$a(r),y=r[2]&&eo(r);return{c(){e=z("div"),t=z("div"),n=z("div"),s.c(),a=Z(),o=z("div"),l=z("p"),u=J(c),f=Z(),w&&w.c(),p=Z(),y&&y.c(),P(n,"class","cursor-pointer row-col-panel"),P(l,"class","txt-sm font-medium title"),P(o,"class","panel-title-chevron"),P(t,"id","main-panel"),P(t,"class",d="closed-panel "+r[1])},m(x,S){B(x,e,S),E(e,t),E(t,n),v[i].m(n,null),E(t,a),E(t,o),E(o,l),E(l,u),E(o,f),w&&w.m(o,null),E(e,p),y&&y.m(e,null),m=!0,h||(_=[ze(n,"click",r[7]),ze(o,"click",r[8])],h=!0)},p(x,[S]){let M=i;i=b(x),i===M?v[i].p(x,S):(De(),I(v[M],1,1,()=>{v[M]=null}),Re(),s=v[i],s?s.p(x,S):(s=v[i]=g[i](x),s.c()),D(s,1),s.m(n,null)),(!m||S&1)&&c!==(c=x[0].title+"")&&pe(u,c),x[0].hasPanel?w?(w.p(x,S),S&1&&D(w,1)):(w=$a(x),w.c(),D(w,1),w.m(o,null)):w&&(De(),I(w,1,1,()=>{w=null}),Re()),(!m||S&2&&d!==(d="closed-panel "+x[1]))&&P(t,"class",d),x[2]?y?(y.p(x,S),S&4&&D(y,1)):(y=eo(x),y.c(),D(y,1),y.m(e,null)):y&&(De(),I(y,1,1,()=>{y=null}),Re())},i(x){m||(D(s),D(w),D(y),m=!0)},o(x){I(s),I(w),I(y),m=!1},d(x){x&&U(e),v[i].d(),w&&w.d(),y&&y.d(),h=!1,xt(_)}}}function Rh(r,e,t){let n,{panelData:i,bgColor:s}=e,a=!1,o=!1,l,{locales:c}=yt;ft(r,c,_=>t(9,n=_));let u=n,f=[{component:Pd,titles:[u.Clothes_Menu,u.Player_Info,u.Revive,u.Teleport_to_Player,u.Open_Inventory,u.Freeze_Player,u.Clear_Inventory,u.Bring_Player,u.Spectate_Player,u.Saved_Locations,u.Open_Trunk,u.Open_Glovebox,u.Unban_Player,u.Show_Props,u.Drunk_Player,u.Set_Player_on_Fire,u.Slap_Player_In_Sky,u.Send_Player_To_JailBox,u.Change_Vehicle_State,u.Force_Logout_Player,u.Give_Outfits,u.Damage_Player_Vehicle,u.Heal,u.Wipe_Player,u.Pee_Player,u.Poop_Player,u.Remove_Stress]},{component:zd,titles:[u.Open_Stash,u.Kick,u.Warn,u.DM_Player]},{component:Vd,titles:[u.Give_Car,u.Give_Job,u.Give_Gang,u.Change_Ped_Model,u.Play_Sound_On_Player,u.Give_Perms]},{component:oh,titles:[u.Clear_Area_Vehicles,u.Clear_Area_Peds,u.Clear_Area_Objects]},{component:sd,titles:[u.Give_Item,u.Give_Money]},{component:yd,titles:[u.Create_Job_Stashes,u.Create_Gang_Stashes]},{component:qf,titles:[u.Announce,u.search_by_citizen_id]},{component:nh,titles:[u.Ban_Offline_Player,u.Ban_Player]},{component:Gf,titles:[u.Spawn_Car]},{component:Qf,titles:[u.Teleport_Coords]},{component:ud,titles:[u.Change_Plate]},{component:md,titles:[u.Spawn_Objects]},{component:jd,titles:[u.Copy_Coordinates]},{component:dh,titles:[u.Change_Weather,u.Remove_Perms]},{component:bh,titles:[u.Change_Time]},{component:Lh,custom:!0}],d={};ct(()=>{i.tabName==="custom"?t(5,d={panelData:i,localeConsts:u}):t(5,d={title:i.title,localeConsts:u})});const p=ln();function m(){t(0,i.isStarred=i.isStarred==="1"?"0":"1",i),localStorage.setItem(i.title,i.isStarred),p("star",{panelData:i})}function h(){i.hasPanel?(f.filter(_=>{(i.tabName==="custom"&&_.hasOwnProperty("custom")&&_.custom||_.hasOwnProperty("titles")&&_.titles.includes(i.title))&&t(4,l=_.component)}),t(3,o=!o),t(2,a=!a)):p("panelClicked",{panelData:i})}return r.$$set=_=>{"panelData"in _&&t(0,i=_.panelData),"bgColor"in _&&t(1,s=_.bgColor)},[i,s,a,o,l,d,c,m,h]}class kh extends Xe{constructor(e){super(),We(this,e,Rh,Dh,He,{panelData:0,bgColor:1})}}function Ih(r){let e,t,n=r[0].choose_theme_label+"",i,s,a,o,l,c,u=r[0].save_btn+"",f,d,p,m;return o=new Ui({props:{dropdownValues:r[2]}}),o.$on("regular-dropdown-select",r[4]),{c(){e=z("div"),t=z("p"),i=J(n),s=J(":"),a=Z(),ee(o.$$.fragment),l=Z(),c=z("button"),f=J(u),P(t,"class","heading svelte-y55mif"),P(c,"class","block change-theme-btn txt-sm"),P(e,"class","main-body svelte-y55mif")},m(h,_){B(h,e,_),E(e,t),E(t,i),E(t,s),E(e,a),Q(o,e,null),E(e,l),E(e,c),E(c,f),d=!0,p||(m=ze(c,"click",r[3]),p=!0)},p(h,[_]){(!d||_&1)&&n!==(n=h[0].choose_theme_label+"")&&pe(i,n),(!d||_&1)&&u!==(u=h[0].save_btn+"")&&pe(f,u)},i(h){d||(D(o.$$.fragment,h),d=!0)},o(h){I(o.$$.fragment,h),d=!1},d(h){h&&U(e),$(o),p=!1,m()}}}function Nh(r,e,t){let{localeConsts:n}=e,i=["Original","Dark","Project Sloth by Stone","QBCore by Stone","Surge by rust1co","VLT by Ryder","Vice By NRP","Svein By NRP","Notorious By NRP","NP theme by Jakobe"],s="";const a=ln();ct(()=>{t(1,s=localStorage.getItem("theme-chosen")?localStorage.getItem("theme-chosen"):i[0]),o()});function o(){localStorage.setItem("theme-chosen",s),a("theme-changed")}const l=c=>t(1,s=c.detail);return r.$$set=c=>{"localeConsts"in c&&t(0,n=c.localeConsts)},[n,s,i,o,l]}class zh extends Xe{constructor(e){super(),We(this,e,Nh,Ih,He,{localeConsts:0})}}const Fh=()=>{const r={filterAndSort(e,t,n,i,s,a){let o=r.filterArray(e,t,n);return i==="alpha"?r.alphabeticalSort(o,s):r.numericSort(o,s,a)},filterArray(e,t,n){return e.filter(i=>{if(i[t].toLocaleLowerCase().includes(n.toLocaleLowerCase()))return i})},toggleToolTip(e){const t=document.getElementById(e);t.style.visibility=t.style.visibility==="visible"?"hidden":"visible"},alphabeticalSort(e,t){return e.sort((n,i)=>n[t].localeCompare(i[t]))},numericSort(e,t,n){return n==="asc"?e.sort((i,s)=>i[t]-s[t]):e.sort((i,s)=>s[t]-i[t])},booleanSort(e,t,n){return n==="asc"?e.sort((i,s)=>Number(s[t])-Number(i[t])):e.sort((i,s)=>Number(i[t])-Number(s[t]))},upperCaseFirstLetter(e){return e.charAt(0).toUpperCase()+e.slice(1)},changeTimeBasedOnTimeZone(e,t){return e.map(n=>{var i=new Date(n[t]*1e3);let s=Intl.DateTimeFormat().resolvedOptions().timeZone,a=i.toLocaleString("en-US",{timeZone:s});return n.formattedTime=a,n})},copyToClipboard(e){const t=document.createElement("textarea");t.value=e,document.body.appendChild(t),t.select(),document.execCommand("copy"),document.body.removeChild(t)}};return{...r}},tt=Fh();function to(r,e,t){const n=r.slice();return n[17]=e[t],n}function no(r,e,t){const n=r.slice();return n[20]=e[t],n}function io(r){let e,t=[],n=new Map,i,s=r[0];const a=o=>o[20];for(let o=0;o<s.length;o+=1){let l=no(r,s,o),c=a(l);n.set(c,t[o]=ro(c,l))}return{c(){e=z("div");for(let o=0;o<t.length;o+=1)t[o].c();P(e,"id","selected-tabs-id"),P(e,"class","selected-tabs svelte-1pl8bk8")},m(o,l){B(o,e,l);for(let c=0;c<t.length;c+=1)t[c].m(e,null);i=!0},p(o,l){if(l&513){s=o[0],De();for(let c=0;c<t.length;c+=1)t[c].r();t=xr(t,l,a,1,o,s,n,e,hs,ro,null,no);for(let c=0;c<t.length;c+=1)t[c].a();Re()}},i(o){if(!i){for(let l=0;l<s.length;l+=1)D(t[l]);i=!0}},o(o){for(let l=0;l<t.length;l+=1)I(t[l]);i=!1},d(o){o&&U(e);for(let l=0;l<t.length;l+=1)t[l].d()}}}function ro(r,e){let t,n=e[20]+"",i,s,a,o,l,c=_e,u,f,d;o=new zt({props:{icon:Uc,class:"txt-2xs hover:text-gray"}});function p(){return e[12](e[20])}return{key:r,first:null,c(){t=z("div"),i=J(n),s=Z(),a=z("div"),ee(o.$$.fragment),P(a,"class","admin-settings-chip-cross"),P(t,"class","txt-sm admin-settings-chip"),this.first=t},m(m,h){B(m,t,h),E(t,i),E(t,s),E(t,a),Q(o,a,null),u=!0,f||(d=ze(a,"click",p),f=!0)},p(m,h){e=m,(!u||h&1)&&n!==(n=e[20]+"")&&pe(i,n)},r(){l=t.getBoundingClientRect()},f(){Mr(t),c()},a(){c(),c=wr(t,l,Sr,{duration:1200})},i(m){u||(D(o.$$.fragment,m),u=!0)},o(m){I(o.$$.fragment,m),u=!1},d(m){m&&U(t),$(o),f=!1,d()}}}function Oh(r){let e,t,n,i,s,a,o=r[2].save_btn+"",l,c,u;return{c(){e=z("input"),n=Z(),i=z("div"),s=z("div"),a=z("button"),l=J(o),P(e,"type","text"),P(e,"placeholder",t=r[2].search_placeholder),P(e,"class","inline-block"),P(a,"class","admin-settings-save-btn txt-sm"),P(s,"class","admin-settings-save"),P(i,"class","inline-block float-right")},m(f,d){B(f,e,d),Nt(e,r[4]),B(f,n,d),B(f,i,d),E(i,s),E(s,a),E(a,l),c||(u=[ze(e,"input",r[13]),ze(e,"keyup",r[8]),ze(a,"click",r[10])],c=!0)},p(f,d){d&4&&t!==(t=f[2].search_placeholder)&&P(e,"placeholder",t),d&16&&e.value!==f[4]&&Nt(e,f[4]),d&4&&o!==(o=f[2].save_btn+"")&&pe(l,o)},d(f){f&&U(e),f&&U(n),f&&U(i),c=!1,xt(u)}}}function Uh(r){let e,t=r[2].search_panels_placeholder+"",n;return{c(){e=z("p"),n=J(t),P(e,"class","txt-sm")},m(i,s){B(i,e,s),E(e,n)},p(i,s){s&4&&t!==(t=i[2].search_panels_placeholder+"")&&pe(n,t)},d(i){i&&U(e)}}}function so(r){let e,t=[],n=new Map,i=r[5];const s=a=>a[17];for(let a=0;a<i.length;a+=1){let o=to(r,i,a),l=s(o);n.set(l,t[a]=ao(l,o))}return{c(){e=z("div");for(let a=0;a<t.length;a+=1)t[a].c();P(e,"id","dropdownmenu"),P(e,"class","admin-settings-show-drop-down")},m(a,o){B(a,e,o);for(let l=0;l<t.length;l+=1)t[l].m(e,null)},p(a,o){if(o&160){i=a[5];for(let l=0;l<t.length;l+=1)t[l].r();t=xr(t,o,s,1,a,i,n,e,zu,ao,null,to);for(let l=0;l<t.length;l+=1)t[l].a()}},d(a){a&&U(e);for(let o=0;o<t.length;o+=1)t[o].d()}}}function ao(r,e){let t,n=e[17].title+"",i,s,a=_e,o,l;function c(){return e[14](e[17])}return{key:r,first:null,c(){t=z("p"),i=J(n),this.first=t},m(u,f){B(u,t,f),E(t,i),o||(l=ze(t,"click",c),o=!0)},p(u,f){e=u,f&32&&n!==(n=e[17].title+"")&&pe(i,n)},r(){s=t.getBoundingClientRect()},f(){Mr(t),a()},a(){a(),a=wr(t,s,Sr,{duration:500})},d(u){u&&U(t),o=!1,l()}}}function Bh(r){let e,t,n=r[2].choose_options_for_role_access_text+"",i,s,a,o,l,c,u,f,d,p,m,h,_=r[0].length>0&&io(r);function g(y,x){return y[0].length===0&&!y[3]?Uh:Oh}let v=g(r),b=v(r),w=r[3]&&so(r);return{c(){e=z("div"),t=z("div"),i=J(n),s=Z(),a=J(r[1]),o=J(":"),l=Z(),_&&_.c(),c=Z(),u=z("div"),b.c(),d=Z(),w&&w.c(),P(t,"class","txt-md heading svelte-1pl8bk8"),P(u,"class",f="admin-settings-search-bar "+(r[0].length===0&&!r[3]?"mtop-2":"")),P(u,"id","search"),P(e,"id","main-setting-body-id"),P(e,"class","main-body-2 svelte-1pl8bk8")},m(y,x){B(y,e,x),E(e,t),E(t,i),E(t,s),E(t,a),E(t,o),E(e,l),_&&_.m(e,null),E(e,c),E(e,u),b.m(u,null),E(e,d),w&&w.m(e,null),p=!0,m||(h=ze(u,"click",r[6]),m=!0)},p(y,[x]){(!p||x&4)&&n!==(n=y[2].choose_options_for_role_access_text+"")&&pe(i,n),(!p||x&2)&&pe(a,y[1]),y[0].length>0?_?(_.p(y,x),x&1&&D(_,1)):(_=io(y),_.c(),D(_,1),_.m(e,c)):_&&(De(),I(_,1,1,()=>{_=null}),Re()),v===(v=g(y))&&b?b.p(y,x):(b.d(1),b=v(y),b&&(b.c(),b.m(u,null))),(!p||x&9&&f!==(f="admin-settings-search-bar "+(y[0].length===0&&!y[3]?"mtop-2":"")))&&P(u,"class",f),y[3]?w?w.p(y,x):(w=so(y),w.c(),w.m(e,null)):w&&(w.d(1),w=null)},i(y){p||(D(_),p=!0)},o(y){I(_),p=!1},d(y){y&&U(e),_&&_.d(),b.d(),w&&w.d(),m=!1,h()}}}function Vh(r,e,t){let{dropdownMenu:n}=e,{selectedValues:i=[]}=e,{role:s,localeConsts:a}=e,o=!1,l="",c=[];ct(()=>{t(5,c=u()),t(5,c=tt.alphabeticalSort(c,"title"))});function u(){return t(5,c=n.filter(b=>{if(!i.includes(b.title))return b})),c}function f(){t(3,o=!0),t(5,c=u()),t(5,c=tt.alphabeticalSort(c,"title"))}function d(b){i.push(b.title),t(0,i),t(5,c=u()),p(),i.length>0&&(document.getElementById("selected-tabs-id"),document.getElementById("main-setting-body-id"),document.getElementById("search"),document.getElementById("dropdownmenu"))}function p(){u();let b=c.filter(w=>{if(w.title.toLocaleLowerCase().includes(l.toLocaleLowerCase()))return w});t(5,c=tt.alphabeticalSort(b,"title"))}function m(b){const w=i.indexOf(b);i.splice(w,1),t(0,i),p()}async function h(){await Pe("saveModeratorCommands",{role:s,selectedValues:i})}const _=b=>m(b);function g(){l=this.value,t(4,l)}const v=b=>d(b);return r.$$set=b=>{"dropdownMenu"in b&&t(11,n=b.dropdownMenu),"selectedValues"in b&&t(0,i=b.selectedValues),"role"in b&&t(1,s=b.role),"localeConsts"in b&&t(2,a=b.localeConsts)},[i,s,a,o,l,c,f,d,p,m,h,n,_,g,v]}class Gh extends Xe{constructor(e){super(),We(this,e,Vh,Bh,He,{dropdownMenu:11,selectedValues:0,role:1,localeConsts:2})}}function Hh(r){let e,t,n,i,s,a;e=new Ui({props:{dropdownValues:r[2]}}),e.$on("regular-dropdown-select",r[9]);const o=[jh,Xh],l=[];function c(u,f){return u[6]?0:1}return n=c(r),i=l[n]=o[n](r),{c(){ee(e.$$.fragment),t=Z(),i.c(),s=Ft()},m(u,f){Q(e,u,f),B(u,t,f),l[n].m(u,f),B(u,s,f),a=!0},p(u,f){const d={};f&4&&(d.dropdownValues=u[2]),e.$set(d);let p=n;n=c(u),n===p?l[n].p(u,f):(De(),I(l[p],1,1,()=>{l[p]=null}),Re(),i=l[n],i?i.p(u,f):(i=l[n]=o[n](u),i.c()),D(i,1),i.m(s.parentNode,s))},i(u){a||(D(e.$$.fragment,u),D(i),a=!0)},o(u){I(e.$$.fragment,u),I(i),a=!1},d(u){$(e,u),u&&U(t),l[n].d(u),u&&U(s)}}}function Wh(r){let e,t;return e=new dt({}),{c(){ee(e.$$.fragment)},m(n,i){Q(e,n,i),t=!0},p:_e,i(n){t||(D(e.$$.fragment,n),t=!0)},o(n){I(e.$$.fragment,n),t=!1},d(n){$(e,n)}}}function Xh(r){let e,t;return e=new Gh({props:{dropdownMenu:r[0],selectedValues:r[4],role:r[3],localeConsts:r[1]}}),{c(){ee(e.$$.fragment)},m(n,i){Q(e,n,i),t=!0},p(n,i){const s={};i&1&&(s.dropdownMenu=n[0]),i&16&&(s.selectedValues=n[4]),i&8&&(s.role=n[3]),i&2&&(s.localeConsts=n[1]),e.$set(s)},i(n){t||(D(e.$$.fragment,n),t=!0)},o(n){I(e.$$.fragment,n),t=!1},d(n){$(e,n)}}}function jh(r){let e,t;return e=new dt({}),{c(){ee(e.$$.fragment)},m(n,i){Q(e,n,i),t=!0},p:_e,i(n){t||(D(e.$$.fragment,n),t=!0)},o(n){I(e.$$.fragment,n),t=!1},d(n){$(e,n)}}}function qh(r){let e,t,n=r[1].choose_role_for_panel_visibility+"",i,s,a,o,l,c;const u=[Wh,Hh],f=[];function d(p,m){return p[5]?0:1}return o=d(r),l=f[o]=u[o](r),{c(){e=z("div"),t=z("p"),i=J(n),s=J(":"),a=Z(),l.c(),P(t,"class","heading svelte-18n19w0"),P(e,"class","main-body svelte-18n19w0")},m(p,m){B(p,e,m),E(e,t),E(t,i),E(t,s),E(e,a),f[o].m(e,null),c=!0},p(p,[m]){(!c||m&2)&&n!==(n=p[1].choose_role_for_panel_visibility+"")&&pe(i,n);let h=o;o=d(p),o===h?f[o].p(p,m):(De(),I(f[h],1,1,()=>{f[h]=null}),Re(),l=f[o],l?l.p(p,m):(l=f[o]=u[o](p),l.c()),D(l,1),l.m(e,null))},i(p){c||(D(l),c=!0)},o(p){I(l),c=!1},d(p){p&&U(e),f[o].d()}}}function Yh(r,e,t){let n,{panels:i,localeConsts:s}=e,{isDev:a}=yt;ft(r,a,m=>t(10,n=m));let o=[],l="",c=[],u=!1,f=!1;ct(async()=>{t(5,u=!0),n?t(2,o=["Moderator","Admin"]):t(2,o=await Pe("getAllRoles")),await d(o[0]),t(5,u=!1),i.push({title:s.side_panel_player_list}),i.push({title:s.dev_mode_side_panel}),i.push({title:s.debug_mode_side_panel}),i.push({title:s.resources_side_panel})});async function d(m){t(6,f=!0),t(3,l=m);const h={role:l};let _=[];n?_=["Admin Car","Announce"]:_=await Pe("getRoleWisePanels",h),t(4,c=_),t(6,f=!1)}const p=m=>d(m.detail);return r.$$set=m=>{"panels"in m&&t(0,i=m.panels),"localeConsts"in m&&t(1,s=m.localeConsts)},[i,s,o,l,c,u,f,a,d,p]}class Zh extends Xe{constructor(e){super(),We(this,e,Yh,qh,He,{panels:0,localeConsts:1})}}const Kh=()=>({...{canSendMessage(e,t){return e.key==="Enter"&&t!==""},scrollToTop(e,t){setTimeout(()=>{let n=document.getElementById(e);n.scrollTop=n.scrollHeight},t)}}}),On=Kh();function oo(r,e,t){const n=r.slice();return n[11]=e[t],n}function Jh(r){let e,t,n,i,s,a,o,l,c,u,f=r[1],d=[];for(let p=0;p<f.length;p+=1)d[p]=lo(oo(r,f,p));return o=new zt({props:{icon:Mf}}),{c(){e=z("div");for(let p=0;p<d.length;p+=1)d[p].c();t=Z(),n=z("div"),i=z("textarea"),s=Z(),a=z("div"),ee(o.$$.fragment),P(e,"id","chat-display"),P(e,"class","display-chats svelte-6tspht"),P(i,"class","send-message-input"),P(a,"class","send-msg-icon"),P(n,"class","sending-message-wrapper")},m(p,m){B(p,e,m);for(let h=0;h<d.length;h+=1)d[h].m(e,null);B(p,t,m),B(p,n,m),E(n,i),Nt(i,r[3]),E(n,s),E(n,a),Q(o,a,null),l=!0,c||(u=[ze(i,"input",r[9]),ze(a,"click",r[6]),ze(n,"keypress",r[8])],c=!0)},p(p,m){if(m&6){f=p[1];let h;for(h=0;h<f.length;h+=1){const _=oo(p,f,h);d[h]?d[h].p(_,m):(d[h]=lo(_),d[h].c(),d[h].m(e,null))}for(;h<d.length;h+=1)d[h].d(1);d.length=f.length}m&8&&Nt(i,p[3])},i(p){l||(D(o.$$.fragment,p),l=!0)},o(p){I(o.$$.fragment,p),l=!1},d(p){p&&U(e),Pt(d,p),p&&U(t),p&&U(n),$(o),c=!1,xt(u)}}}function Qh(r){let e,t;return e=new dt({props:{isBig:!0}}),{c(){ee(e.$$.fragment)},m(n,i){Q(e,n,i),t=!0},p:_e,i(n){t||(D(e.$$.fragment,n),t=!0)},o(n){I(e.$$.fragment,n),t=!1},d(n){$(e,n)}}}function lo(r){let e,t=r[11].msg+"",n,i,s,a,o=r[11].name+"",l,c;return{c(){e=z("div"),n=J(t),s=Z(),a=z("small"),l=J(o),P(e,"class",i="chat-panel "+(r[2]===r[11].name?"adjust-border-self even-pane-panel-bg":"adjust-border-others")+" svelte-6tspht"),P(a,"class",c="txt-2xs "+(r[2]===r[11].name?"adjust-border-self":"adjust-border-others")+" svelte-6tspht")},m(u,f){B(u,e,f),E(e,n),B(u,s,f),B(u,a,f),E(a,l)},p(u,f){f&2&&t!==(t=u[11].msg+"")&&pe(n,t),f&6&&i!==(i="chat-panel "+(u[2]===u[11].name?"adjust-border-self even-pane-panel-bg":"adjust-border-others")+" svelte-6tspht")&&P(e,"class",i),f&2&&o!==(o=u[11].name+"")&&pe(l,o),f&6&&c!==(c="txt-2xs "+(u[2]===u[11].name?"adjust-border-self":"adjust-border-others")+" svelte-6tspht")&&P(a,"class",c)},d(u){u&&U(e),u&&U(s),u&&U(a)}}}function $h(r){let e,t,n,i,s=r[0].admin_menu_chat_heading+"",a,o,l,c,u,f,d,p,m,h;c=new zt({props:{icon:sf,class:"txt-sm"}});const _=[Qh,Jh],g=[];function v(b,w){return b[4]?0:1}return f=v(r),d=g[f]=_[f](r),{c(){e=z("div"),t=z("div"),n=z("div"),i=z("p"),a=J(s),o=Z(),l=z("div"),ee(c.$$.fragment),u=Z(),d.c(),P(n,"class","heading"),P(l,"class","refresh"),P(t,"class","chat-header"),P(e,"class","main-body svelte-6tspht")},m(b,w){B(b,e,w),E(e,t),E(t,n),E(n,i),E(i,a),E(t,o),E(t,l),Q(c,l,null),E(e,u),g[f].m(e,null),p=!0,m||(h=ze(l,"click",r[7]),m=!0)},p(b,[w]){(!p||w&1)&&s!==(s=b[0].admin_menu_chat_heading+"")&&pe(a,s);let y=f;f=v(b),f===y?g[f].p(b,w):(De(),I(g[y],1,1,()=>{g[y]=null}),Re(),d=g[f],d?d.p(b,w):(d=g[f]=_[f](b),d.c()),D(d,1),d.m(e,null))},i(b){p||(D(c.$$.fragment,b),D(d),p=!0)},o(b){I(c.$$.fragment,b),I(d),p=!1},d(b){b&&U(e),$(c),g[f].d(),m=!1,h()}}}function ep(r,e,t){let n,{localeConsts:i}=e,{isDev:s}=yt;ft(r,s,m=>t(10,n=m));let a=[],o="",l="",c=!1;ct(async()=>{t(4,c=!0);let m={};n?m={chats:[{id:1,name:"name1#1234",msg:"Hey whatsup",time:1670784600},{id:2,name:"Sakshi",msg:"hello",time:1670784600},{id:3,name:"Pushkar",msg:"hi",time:1670784600},{id:4,name:"Sakshi",msg:"hi, im good. what is this nonsense",time:1670784600},{id:5,name:"Monu",msg:"well",time:1670784600},{id:6,name:"Pushkar",msg:"how are you",time:1670784600},{id:7,name:"Monu",msg:"where are you whereare you?? where are you ewwwrweffsdfdsgskhgskjfjksfksfkjsdgkdskjdsnvkjsndjvkngsjkfnjsknvkjnskj",time:1670784600},{id:8,name:"Sakshi",msg:"sad",time:1670784600}],currUserName:"Sakshi"}:m=await Pe("getAdminChats"),t(1,a=tt.numericSort(m.chats,"id","asc")),t(2,o=m.currUserName),t(4,c=!1)});async function u(){if(t(4,c=!0),l!==""){const m={userName:o,message:l};let h={};n?h={chats:[{id:1,name:"name1#1234",msg:"Hey whatsup",time:1670784600},{id:2,name:"Sakshi",msg:"hello",time:1670784600},{id:3,name:"Pushkar",msg:"hi",time:1670784600},{id:4,name:"Sakshi",msg:"hi, im good. what is this nonsense",time:1670784600},{id:5,name:"Monu",msg:"well",time:1670784600},{id:6,name:"Pushkar",msg:"how are you",time:1670784600},{id:7,name:"Monu",msg:"where are you whereare you?? where are you ewwwrweffsdfdsgskhgskjfjksfksfkjsdgkdskjdsnvkjsndjvkngsjkfnjsknvkjnskj",time:1670784600},{id:8,name:"Sakshi",msg:"sad",time:1670784600}],currUserName:"Sakshi"}:h=await Pe("adminMessageSent",m),t(1,a=tt.numericSort(h.chats,"id","asc"))}t(3,l=""),t(4,c=!1),On.scrollToTop("chat-display",100)}async function f(){t(4,c=!0);let m={};n?m={chats:[{id:1,name:"name1#1234",msg:"Hey whatsup",time:1670784600},{id:2,name:"Sakshi",msg:"hello",time:1670784600},{id:3,name:"Pushkar",msg:"hi",time:1670784600},{id:4,name:"Sakshi",msg:"hi, im good. what is this nonsense",time:1670784600},{id:5,name:"Monu",msg:"well",time:1670784600},{id:6,name:"Pushkar",msg:"how are you",time:1670784600},{id:7,name:"Monu",msg:"where are you whereare you?? where are you ewwwrweffsdfdsgskhgskjfjksfksfkjsdgkdskjdsnvkjsndjvkngsjkfnjsknvkjnskj",time:1670784600},{id:8,name:"Sakshi",msg:"sad",time:1670784600}],currUserName:"Sakshi"}:m=await Pe("refreshChats"),t(1,a=tt.numericSort(m.chats,"id","asc")),t(4,c=!1),On.scrollToTop("chat-display",100)}function d(m){On.canSendMessage(m,l)&&u()}function p(){l=this.value,t(3,l)}return r.$$set=m=>{"localeConsts"in m&&t(0,i=m.localeConsts)},[i,a,o,l,c,s,u,f,d,p]}class tp extends Xe{constructor(e){super(),We(this,e,ep,$h,He,{localeConsts:0})}}function co(r){let e,t,n,i,s,a,o,l=r[1].report_confirm_label+"",c,u,f,d=r[1].report_cancel_label+"",p,m,h;return{c(){e=z("div"),t=z("p"),n=J(r[0]),i=J("?"),s=Z(),a=z("div"),o=z("button"),c=J(l),u=Z(),f=z("button"),p=J(d),P(t,"class","txt-md"),P(o,"class","small-modal-btns txt-md confirm-btn"),P(f,"class","small-modal-btns txt-md cancel-btn"),P(a,"class","block"),P(e,"class","modal-body small-modal-body")},m(_,g){B(_,e,g),E(e,t),E(t,n),E(t,i),E(e,s),E(e,a),E(a,o),E(o,c),E(a,u),E(a,f),E(f,p),m||(h=[ze(o,"click",r[4]),ze(f,"click",r[3])],m=!0)},p(_,g){g&1&&pe(n,_[0]),g&2&&l!==(l=_[1].report_confirm_label+"")&&pe(c,l),g&2&&d!==(d=_[1].report_cancel_label+"")&&pe(p,d)},d(_){_&&U(e),m=!1,xt(h)}}}function uo(r){let e,t;return e=new dt({}),{c(){ee(e.$$.fragment)},m(n,i){Q(e,n,i),t=!0},i(n){t||(D(e.$$.fragment,n),t=!0)},o(n){I(e.$$.fragment,n),t=!1},d(n){$(e,n)}}}function np(r){let e,t,n,i,s,a=!r[2]&&co(r),o=r[2]&&uo();return{c(){e=z("div"),t=z("div"),n=z("div"),a&&a.c(),i=Z(),o&&o.c(),P(n,"class","modal-content small-modal-content"),P(t,"class","modal-dialog small-modal-dialog"),P(e,"class","modal small-modal"),P(e,"tabindex","-1"),P(e,"aria-hidden","true")},m(l,c){B(l,e,c),E(e,t),E(t,n),a&&a.m(n,null),E(n,i),o&&o.m(n,null),s=!0},p(l,[c]){l[2]?a&&(a.d(1),a=null):a?a.p(l,c):(a=co(l),a.c(),a.m(n,i)),l[2]?o?c&4&&D(o,1):(o=uo(),o.c(),D(o,1),o.m(n,null)):o&&(De(),I(o,1,1,()=>{o=null}),Re())},i(l){s||(D(o),s=!0)},o(l){I(o),s=!1},d(l){l&&U(e),a&&a.d(),o&&o.d()}}}function ip(r,e,t){const n=ln();let{whatToDelete:i="selected data"}=e,{localeConsts:s}=e,a=!1;function o(){n("closeModal")}function l(){t(2,a=!0),n("confirmModalAction"),t(2,a=!1)}return r.$$set=c=>{"whatToDelete"in c&&t(0,i=c.whatToDelete),"localeConsts"in c&&t(1,s=c.localeConsts)},[i,s,a,o,l]}class rp extends Xe{constructor(e){super(),We(this,e,ip,np,He,{whatToDelete:0,localeConsts:1})}}function fo(r,e,t){const n=r.slice();return n[24]=e[t],n}function ho(r,e,t){const n=r.slice();return n[27]=e[t],n}function sp(r){let e,t,n,i=r[0].id+"",s,a,o=r[0].name+"",l,c,u,f,d,p,m,h,_,g,v,b,w,y=r[15],x=[];for(let k=0;k<y.length;k+=1)x[k]=po(ho(r,y,k));const S=k=>I(x[k],1,1,()=>{x[k]=null});p=new zt({props:{icon:lf}});const M=[lp,op],T=[];function R(k,G){return k[2]?0:1}return h=R(r),_=T[h]=M[h](r),{c(){e=z("div"),t=z("div"),n=J("("),s=J(i),a=J(") "),l=J(o),c=Z(),u=z("div");for(let k=0;k<x.length;k+=1)x[k].c();f=Z(),d=z("div"),ee(p.$$.fragment),m=Z(),_.c(),g=Ft(),P(t,"class","txt-sm"),P(d,"class","close-icon txt-sm"),P(u,"class","report-children-icons"),P(e,"class","report-info")},m(k,G){B(k,e,G),E(e,t),E(t,n),E(t,s),E(t,a),E(t,l),E(e,c),E(e,u);for(let F=0;F<x.length;F+=1)x[F].m(u,null);E(u,f),E(u,d),Q(p,d,null),B(k,m,G),T[h].m(k,G),B(k,g,G),v=!0,b||(w=ze(d,"click",r[9]),b=!0)},p(k,G){if((!v||G&1)&&i!==(i=k[0].id+"")&&pe(s,i),(!v||G&1)&&o!==(o=k[0].name+"")&&pe(l,o),G&33794){y=k[15];let O;for(O=0;O<y.length;O+=1){const X=ho(k,y,O);x[O]?(x[O].p(X,G),D(x[O],1)):(x[O]=po(X),x[O].c(),D(x[O],1),x[O].m(u,f))}for(De(),O=y.length;O<x.length;O+=1)S(O);Re()}let F=h;h=R(k),h===F?T[h].p(k,G):(De(),I(T[F],1,1,()=>{T[F]=null}),Re(),_=T[h],_?_.p(k,G):(_=T[h]=M[h](k),_.c()),D(_,1),_.m(g.parentNode,g))},i(k){if(!v){for(let G=0;G<y.length;G+=1)D(x[G]);D(p.$$.fragment,k),D(_),v=!0}},o(k){x=x.filter(Boolean);for(let G=0;G<x.length;G+=1)I(x[G]);I(p.$$.fragment,k),I(_),v=!1},d(k){k&&U(e),Pt(x,k),$(p),k&&U(m),T[h].d(k),k&&U(g),b=!1,w()}}}function ap(r){let e,t;return e=new rp({props:{whatToDelete:r[7],localeConsts:r[1]}}),e.$on("closeModal",r[16]),e.$on("confirmModalAction",r[11]),{c(){ee(e.$$.fragment)},m(n,i){Q(e,n,i),t=!0},p(n,i){const s={};i&128&&(s.whatToDelete=n[7]),i&2&&(s.localeConsts=n[1]),e.$set(s)},i(n){t||(D(e.$$.fragment,n),t=!0)},o(n){I(e.$$.fragment,n),t=!1},d(n){$(e,n)}}}function po(r){let e,t,n,i,s=r[1][r[27].localConstKey]+"",a,o,l,c;t=new zt({props:{icon:r[27].icon}});function u(){return r[17](r[27])}function f(){return r[18](r[27])}function d(){return r[19](r[27])}return{c(){e=z("div"),ee(t.$$.fragment),n=Z(),i=z("span"),a=J(s),P(i,"id",r[27].id),P(i,"class","tool-tip-text-top-report"),P(e,"class","close-icon txt-sm")},m(p,m){B(p,e,m),Q(t,e,null),E(e,n),E(e,i),E(i,a),o=!0,l||(c=[ze(e,"click",u),ze(e,"mouseenter",f),ze(e,"mouseleave",d)],l=!0)},p(p,m){r=p,(!o||m&2)&&s!==(s=r[1][r[27].localConstKey]+"")&&pe(a,s)},i(p){o||(D(t.$$.fragment,p),o=!0)},o(p){I(t.$$.fragment,p),o=!1},d(p){p&&U(e),$(t),l=!1,xt(c)}}}function op(r){let e,t,n,i,s,a,o,l=r[1].close_btn+"",c,u,f,d=r[1].send_btn+"",p,m,h,_,g=r[3],v=[];for(let b=0;b<g.length;b+=1)v[b]=mo(fo(r,g,b));return{c(){e=z("div");for(let b=0;b<v.length;b+=1)v[b].c();t=Z(),n=z("div"),i=z("textarea"),s=Z(),a=z("div"),o=z("button"),c=J(l),u=Z(),f=z("button"),p=J(d),P(e,"id","chat-display"),P(e,"class","report-display-message-wrapper svelte-15b8wcv"),P(i,"class","report-send-message-input"),P(o,"class","txt-xs report-admin-btns-close"),P(f,"class",m="txt-xs report-admin-btns-send "+(r[5].trim()===""?"disable-icon":"report-admin-btns-send-enabled")+" svelte-15b8wcv"),P(a,"class","report-admin-btns"),P(n,"class","report-send-message-wrapper")},m(b,w){B(b,e,w);for(let y=0;y<v.length;y+=1)v[y].m(e,null);B(b,t,w),B(b,n,w),E(n,i),Nt(i,r[5]),E(n,s),E(n,a),E(a,o),E(o,c),E(a,u),E(a,f),E(f,p),h||(_=[ze(i,"input",r[20]),ze(o,"click",r[12]),ze(f,"click",r[21]),ze(n,"keypress",r[14])],h=!0)},p(b,w){if(w&24){g=b[3];let y;for(y=0;y<g.length;y+=1){const x=fo(b,g,y);v[y]?v[y].p(x,w):(v[y]=mo(x),v[y].c(),v[y].m(e,null))}for(;y<v.length;y+=1)v[y].d(1);v.length=g.length}w&32&&Nt(i,b[5]),w&2&&l!==(l=b[1].close_btn+"")&&pe(c,l),w&2&&d!==(d=b[1].send_btn+"")&&pe(p,d),w&32&&m!==(m="txt-xs report-admin-btns-send "+(b[5].trim()===""?"disable-icon":"report-admin-btns-send-enabled")+" svelte-15b8wcv")&&P(f,"class",m)},i:_e,o:_e,d(b){b&&U(e),Pt(v,b),b&&U(t),b&&U(n),h=!1,xt(_)}}}function lp(r){let e,t;return e=new dt({}),{c(){ee(e.$$.fragment)},m(n,i){Q(e,n,i),t=!0},p:_e,i(n){t||(D(e.$$.fragment,n),t=!0)},o(n){I(e.$$.fragment,n),t=!1},d(n){$(e,n)}}}function mo(r){let e,t,n=r[24].message+"",i,s,a,o,l=(r[4]===r[24].sender?"You":r[24].sender)+"",c,u,f=r[24].formattedTime+"",d,p,m;return{c(){e=z("div"),t=z("div"),i=J(n),a=Z(),o=z("small"),c=J(l),u=J(", "),d=J(f),m=Z(),P(t,"class",s="report-chat-panel "+(r[4]===r[24].sender?"adjust-border-self even-pane-panel-bg":"adjust-border-others")+" svelte-15b8wcv"),P(o,"class",p="sender-info-display "+(r[4]===r[24].sender?"adjust-border-self":"adjust-border-others")+" svelte-15b8wcv"),P(e,"class","report-chat-body svelte-15b8wcv")},m(h,_){B(h,e,_),E(e,t),E(t,i),E(e,a),E(e,o),E(o,c),E(o,u),E(o,d),E(e,m)},p(h,_){_&8&&n!==(n=h[24].message+"")&&pe(i,n),_&24&&s!==(s="report-chat-panel "+(h[4]===h[24].sender?"adjust-border-self even-pane-panel-bg":"adjust-border-others")+" svelte-15b8wcv")&&P(t,"class",s),_&24&&l!==(l=(h[4]===h[24].sender?"You":h[24].sender)+"")&&pe(c,l),_&8&&f!==(f=h[24].formattedTime+"")&&pe(d,f),_&24&&p!==(p="sender-info-display "+(h[4]===h[24].sender?"adjust-border-self":"adjust-border-others")+" svelte-15b8wcv")&&P(o,"class",p)},d(h){h&&U(e)}}}function cp(r){let e,t,n,i;const s=[ap,sp],a=[];function o(l,c){return l[6]?0:1}return t=o(r),n=a[t]=s[t](r),{c(){e=z("div"),n.c(),P(e,"class","main-body svelte-15b8wcv")},m(l,c){B(l,e,c),a[t].m(e,null),i=!0},p(l,[c]){let u=t;t=o(l),t===u?a[t].p(l,c):(De(),I(a[u],1,1,()=>{a[u]=null}),Re(),n=a[t],n?n.p(l,c):(n=a[t]=s[t](l),n.c()),D(n,1),n.m(e,null))},i(l){i||(D(n),i=!0)},o(l){I(n),i=!1},d(l){l&&U(e),a[t].d()}}}function up(r,e,t){let n;const i=ln();let{selectedPlayer:s,localeConsts:a}=e,{isDev:o}=yt;ft(r,o,k=>t(22,n=k));let l=!1,c=[],u="",f="",d=!1,p="";ct(async()=>{t(2,l=!0);const k={playerId:s.name};let G={};n?G={currentUser:"Monu",chats:[{sender:"sakshi#1234",message:"Hey whatsup",time:1670784600},{sender:"sakshi#1234",message:"hello",time:1670784600},{sender:"Pushkar",message:"hi",time:1670784600},{sender:"sakshi#1234",message:"hi, im good. what is this nonsense",time:1670784600},{sender:"Monu",message:"well",time:1670784600},{sender:"Pushkar",message:"how are you",time:1670784600},{sender:"Monu",message:"where are you whereare you?? where are you ewwwrweffsdfdsgskhgskjfjksfksfkjsdgkdskjdsnvkjsndjvkngsjkfnjsknvkjnskj",time:1670784600},{sender:"sakshi#1234",message:"sad",time:1670784600},{sender:"sakshi#1234",message:"Hey whatsup",time:1670784600},{sender:"sakshi#1234",message:"hello",time:1670784600},{sender:"Pushkar",message:"hi",time:1670784600},{sender:"sakshi#1234",message:"hi, im good. what is this nonsense",time:1670784600},{sender:"Monu",message:"well",time:1670784600},{sender:"Pushkar",message:"how are you",time:1670784600}]}:G=await Pe("getPlayerChats",k),t(3,c=G.chats),t(4,u=G.currentUser),t(3,c=tt.changeTimeBasedOnTimeZone(c,"time")),t(2,l=!1),On.scrollToTop("chat-display",100)});function m(){i("closePage")}function h(k){const G={playerId:s.id};let F="";k=="teleport"?F="teleportToPlayerReport":k=="spectate"?F="spectatePlayerReport":k=="bring"?F="bringPlayerReport":k=="sendback"?F="sendBackReport":k=="copyIdentifier"&&tt.copyToClipboard(s.identifier),Pe(F,G)}async function _(){const k={playerId:s.id,playerName:s.name};await Pe("closeTicket",k),i("closePage")}function g(){t(6,d=!0),t(7,p=a.delete_modal_message+" "+s.name)}async function v(){if(t(2,l=!0),f!==""){const k={sender:u,message:f,playerId:s.name},G=await Pe("sendMessageFromAdmin",k);t(3,c=G.chats),t(3,c=tt.changeTimeBasedOnTimeZone(c,"time"))}t(5,f=""),t(7,p=""),t(2,l=!1),On.scrollToTop("chat-display",100)}function b(k){On.canSendMessage(k,f)&&v()}let w=[{id:"copy-id",actionValue:"copyIdentifier",icon:cf,localConstKey:"copy_identifier_tooltip"},{id:"spectate-id",actionValue:"spectate",icon:Tf,localConstKey:"spectate_tooltip"},{id:"bring-id",actionValue:"bring",icon:vf,localConstKey:"bring_tooltip"},{id:"send-back-id",actionValue:"sendback",icon:gf,localConstKey:"send_back_tooltip"},{id:"teleport-id",actionValue:"teleport",icon:yf,localConstKey:"teleport_tooltip"}];const y=()=>t(6,d=!1),x=k=>h(k.actionValue),S=k=>tt.toggleToolTip(k.id),M=k=>tt.toggleToolTip(k.id);function T(){f=this.value,t(5,f)}const R=()=>v();return r.$$set=k=>{"selectedPlayer"in k&&t(0,s=k.selectedPlayer),"localeConsts"in k&&t(1,a=k.localeConsts)},[s,a,l,c,u,f,d,p,o,m,h,_,g,v,b,w,y,x,S,M,T,R]}class fp extends Xe{constructor(e){super(),We(this,e,up,cp,He,{selectedPlayer:0,localeConsts:1})}}function dp(r){let e,t,n,i;return{c(){e=z("div"),t=z("input"),P(t,"placeholder",r[0]),P(e,"class","search-bar txt-xs")},m(s,a){B(s,e,a),E(e,t),Nt(t,r[1]),n||(i=[ze(t,"keyup",r[2]),ze(t,"input",r[3])],n=!0)},p(s,[a]){a&1&&P(t,"placeholder",s[0]),a&2&&t.value!==s[1]&&Nt(t,s[1])},i:_e,o:_e,d(s){s&&U(e),n=!1,xt(i)}}}function hp(r,e,t){let{placeholder:n}=e;const i=ln();let s="";function a(){i("search-value-update",s)}function o(){s=this.value,t(1,s)}return r.$$set=l=>{"placeholder"in l&&t(0,n=l.placeholder)},[n,s,a,o]}class ps extends Xe{constructor(e){super(),We(this,e,hp,dp,He,{placeholder:0})}}function _o(r,e,t){const n=r.slice();return n[14]=e[t],n}function pp(r){let e,t,n,i;e=new ps({props:{placeholder:r[0].search_placeholder}}),e.$on("search-value-update",r[9]);let s=r[3],a=[];for(let o=0;o<s.length;o+=1)a[o]=go(_o(r,s,o));return{c(){ee(e.$$.fragment),t=Z();for(let o=0;o<a.length;o+=1)a[o].c();n=Ft()},m(o,l){Q(e,o,l),B(o,t,l);for(let c=0;c<a.length;c+=1)a[c].m(o,l);B(o,n,l),i=!0},p(o,l){const c={};if(l&1&&(c.placeholder=o[0].search_placeholder),e.$set(c),l&89){s=o[3];let u;for(u=0;u<s.length;u+=1){const f=_o(o,s,u);a[u]?a[u].p(f,l):(a[u]=go(f),a[u].c(),a[u].m(n.parentNode,n))}for(;u<a.length;u+=1)a[u].d(1);a.length=s.length}},i(o){i||(D(e.$$.fragment,o),i=!0)},o(o){I(e.$$.fragment,o),i=!1},d(o){$(e,o),o&&U(t),Pt(a,o),o&&U(n)}}}function mp(r){let e,t;return e=new fp({props:{selectedPlayer:r[4],localeConsts:r[0]}}),e.$on("closePage",r[8]),{c(){ee(e.$$.fragment)},m(n,i){Q(e,n,i),t=!0},p(n,i){const s={};i&16&&(s.selectedPlayer=n[4]),i&1&&(s.localeConsts=n[0]),e.$set(s)},i(n){t||(D(e.$$.fragment,n),t=!0)},o(n){I(e.$$.fragment,n),t=!1},d(n){$(e,n)}}}function _p(r){let e,t;return e=new dt({}),{c(){ee(e.$$.fragment)},m(n,i){Q(e,n,i),t=!0},p:_e,i(n){t||(D(e.$$.fragment,n),t=!0)},o(n){I(e.$$.fragment,n),t=!1},d(n){$(e,n)}}}function go(r){let e,t,n=r[14].id+"",i,s,a=r[14].name+"",o,l,c,u=r[0].last_updated+"",f,d,p=r[6](r[14].time)+"",m,h,_,g;function v(){return r[10](r[14])}return{c(){e=z("div"),t=J("("),i=J(n),s=J(") "),o=J(a),l=Z(),c=z("div"),f=J(u),d=Z(),m=J(p),h=Z(),P(c,"class","report-time-wrapper"),P(e,"class","reports-wrapper txt-md")},m(b,w){B(b,e,w),E(e,t),E(e,i),E(e,s),E(e,o),E(e,l),E(e,c),E(c,f),E(c,d),E(c,m),E(e,h),_||(g=ze(e,"click",v),_=!0)},p(b,w){r=b,w&8&&n!==(n=r[14].id+"")&&pe(i,n),w&8&&a!==(a=r[14].name+"")&&pe(o,a),w&1&&u!==(u=r[0].last_updated+"")&&pe(f,u),w&8&&p!==(p=r[6](r[14].time)+"")&&pe(m,p)},d(b){b&&U(e),_=!1,g()}}}function gp(r){let e,t,n,i,s=r[0].reports_heading+"",a,o,l,c,u,f;const d=[_p,mp,pp],p=[];function m(h,_){return h[1]?0:h[4]!==""?1:2}return c=m(r),u=p[c]=d[c](r),{c(){e=z("div"),t=z("div"),n=z("div"),i=z("p"),a=J(s),o=Z(),l=z("div"),u.c(),P(n,"class","heading"),P(t,"class","chat-header"),P(l,"class","report-body svelte-1wsh5b6"),P(e,"class","main-body svelte-1wsh5b6")},m(h,_){B(h,e,_),E(e,t),E(t,n),E(n,i),E(i,a),E(e,o),E(e,l),p[c].m(l,null),f=!0},p(h,[_]){(!f||_&1)&&s!==(s=h[0].reports_heading+"")&&pe(a,s);let g=c;c=m(h),c===g?p[c].p(h,_):(De(),I(p[g],1,1,()=>{p[g]=null}),Re(),u=p[c],u?u.p(h,_):(u=p[c]=d[c](h),u.c()),D(u,1),u.m(l,null))},i(h){f||(D(u),f=!0)},o(h){I(u),f=!1},d(h){h&&U(e),p[c].d()}}}function bp(r,e,t){let n,{localeConsts:i}=e,{isDev:s}=yt;ft(r,s,g=>t(13,n=g));let a=!1,o=[],l="",c=[],u="",f="";ct(async()=>{t(1,a=!0);let g={};n?g={players:[{id:1,name:"sakshi#1234",time:1670784600,identifier:"Test"}],currentUser:"pushkar@3445"}:g=await Pe("getAllUserNameWithReports"),o=g.players,t(3,c=tt.numericSort(o,"time","desc")),t(1,a=!1)});function d(g){var v=new Date(g*1e3);let b=Intl.DateTimeFormat().resolvedOptions().timeZone;return f=v.toLocaleString("en-US",{timeZone:b}),f}function p(){t(3,c=tt.filterAndSort(o,"name",l,"alpha","name"))}async function m(){t(1,a=!0);let g={};n?g={playerIds:[{id:1,name:"sakshi#1234"},"pushkar@3445"]}:g=await Pe("getAllUserNameWithReports"),o=g.players,t(3,c=tt.numericSort(o,"time","desc")),t(1,a=!1),t(4,u="")}const h=g=>{t(2,l=g.detail),p()},_=g=>{t(4,u=g)};return r.$$set=g=>{"localeConsts"in g&&t(0,i=g.localeConsts)},[i,a,l,c,u,s,d,p,m,h,_]}class vp extends Xe{constructor(e){super(),We(this,e,bp,gp,He,{localeConsts:0})}}function bo(r,e,t){const n=r.slice();return n[11]=e[t],n}function vo(r,e,t){const n=r.slice();return n[14]=e[t],n}function yp(r){let e,t=r[1].formattedTime+"",n;return{c(){e=z("p"),n=J(t)},m(i,s){B(i,e,s),E(e,n)},p(i,s){s&2&&t!==(t=i[1].formattedTime+"")&&pe(n,t)},i:_e,o:_e,d(i){i&&U(e)}}}function wp(r){let e,t,n;return t=new zt({props:{icon:r[5]?ls:gr,class:"txt-xs"}}),{c(){e=z("div"),ee(t.$$.fragment),P(e,"class","chevron-sign")},m(i,s){B(i,e,s),Q(t,e,null),n=!0},p(i,s){const a={};s&32&&(a.icon=i[5]?ls:gr),t.$set(a)},i(i){n||(D(t.$$.fragment,i),n=!0)},o(i){I(t.$$.fragment,i),n=!1},d(i){i&&U(e),$(t)}}}function yo(r){let e,t,n,i,s,a,o,l=r[0].citizen_id_label+"",c,u,f=r[1].info.citizenId+"",d,p,m,h,_=r[0].name_label+"",g,v,b=r[1].info.name+"",w,y,x,S,M=r[0].job_label+"",T,R,k=r[1].info.job+"",G,F,O,X,le=r[0].gang_label+"",ce,te,ne=r[1].info.gang+"",ue,be,q,ae,he=r[0].cash_label+"",W,xe,ye=r[1].info.cashBalance+"",Ee,Ce,Ne=r[0].bank_label+"",ke,Ge,qe=r[1].info.bankBalance+"",Ye,rt,wt,gt,at=r[0].radio_channel_label+"",ot,Ht,fe=r[1].info.radio+"",L,C,K,de,me=r[0].phone_number_label+"",we,Oe,Se=r[1].info.phone+"",oe,Be,Le,Fe,Me,Ie=r[1].licenses,Ve=[];for(let N=0;N<Ie.length;N+=1)Ve[N]=wo(vo(r,Ie,N));let st=r[6],nt=[];for(let N=0;N<st.length;N+=1)nt[N]=xo(bo(r,st,N));return{c(){e=z("div"),t=z("div"),n=z("div");for(let N=0;N<Ve.length;N+=1)Ve[N].c();i=Z(),s=z("div"),a=z("p"),o=z("span"),c=J(l),u=J(": "),d=J(f),p=Z(),m=z("p"),h=z("span"),g=J(_),v=J(": "),w=J(b),y=Z(),x=z("p"),S=z("span"),T=J(M),R=J(": "),G=J(k),F=Z(),O=z("p"),X=z("span"),ce=J(le),te=J(": "),ue=J(ne),be=Z(),q=z("p"),ae=z("span"),W=J(he),xe=J(" : "),Ee=J(ye),Ce=J(" / "),ke=J(Ne),Ge=J(" : "),Ye=J(qe),rt=Z(),wt=z("p"),gt=z("span"),ot=J(at),Ht=J(": "),L=J(fe),C=Z(),K=z("p"),de=z("span"),we=J(me),Oe=J(": "),oe=J(Se),Be=Z(),Le=z("div");for(let N=0;N<nt.length;N+=1)nt[N].c();P(s,"class","player-info"),P(n,"class","values"),P(t,"class","open-panel-row"),P(Le,"class","open-panel-row open-panel-row-buttons"),P(e,"class","player-panel-open-panels")},m(N,Y){B(N,e,Y),E(e,t),E(t,n);for(let ie=0;ie<Ve.length;ie+=1)Ve[ie].m(n,null);E(n,i),E(n,s),E(s,a),E(a,o),E(o,c),E(o,u),E(a,d),E(s,p),E(s,m),E(m,h),E(h,g),E(h,v),E(m,w),E(s,y),E(s,x),E(x,S),E(S,T),E(S,R),E(x,G),E(s,F),E(s,O),E(O,X),E(X,ce),E(X,te),E(O,ue),E(s,be),E(s,q),E(q,ae),E(ae,W),E(ae,xe),E(ae,Ee),E(ae,Ce),E(ae,ke),E(ae,Ge),E(ae,Ye),E(s,rt),E(s,wt),E(wt,gt),E(gt,ot),E(gt,Ht),E(wt,L),E(s,C),E(s,K),E(K,de),E(de,we),E(de,Oe),E(K,oe),E(e,Be),E(e,Le);for(let ie=0;ie<nt.length;ie+=1)nt[ie].m(Le,null);Me=!0},p(N,Y){if(Y&2){Ie=N[1].licenses;let ie;for(ie=0;ie<Ie.length;ie+=1){const ve=vo(N,Ie,ie);Ve[ie]?Ve[ie].p(ve,Y):(Ve[ie]=wo(ve),Ve[ie].c(),Ve[ie].m(n,i))}for(;ie<Ve.length;ie+=1)Ve[ie].d(1);Ve.length=Ie.length}if((!Me||Y&1)&&l!==(l=N[0].citizen_id_label+"")&&pe(c,l),(!Me||Y&2)&&f!==(f=N[1].info.citizenId+"")&&pe(d,f),(!Me||Y&1)&&_!==(_=N[0].name_label+"")&&pe(g,_),(!Me||Y&2)&&b!==(b=N[1].info.name+"")&&pe(w,b),(!Me||Y&1)&&M!==(M=N[0].job_label+"")&&pe(T,M),(!Me||Y&2)&&k!==(k=N[1].info.job+"")&&pe(G,k),(!Me||Y&1)&&le!==(le=N[0].gang_label+"")&&pe(ce,le),(!Me||Y&2)&&ne!==(ne=N[1].info.gang+"")&&pe(ue,ne),(!Me||Y&1)&&he!==(he=N[0].cash_label+"")&&pe(W,he),(!Me||Y&2)&&ye!==(ye=N[1].info.cashBalance+"")&&pe(Ee,ye),(!Me||Y&1)&&Ne!==(Ne=N[0].bank_label+"")&&pe(ke,Ne),(!Me||Y&2)&&qe!==(qe=N[1].info.bankBalance+"")&&pe(Ye,qe),(!Me||Y&1)&&at!==(at=N[0].radio_channel_label+"")&&pe(ot,at),(!Me||Y&2)&&fe!==(fe=N[1].info.radio+"")&&pe(L,fe),(!Me||Y&1)&&me!==(me=N[0].phone_number_label+"")&&pe(we,me),(!Me||Y&2)&&Se!==(Se=N[1].info.phone+"")&&pe(oe,Se),Y&337){st=N[6];let ie;for(ie=0;ie<st.length;ie+=1){const ve=bo(N,st,ie);nt[ie]?nt[ie].p(ve,Y):(nt[ie]=xo(ve),nt[ie].c(),nt[ie].m(Le,null))}for(;ie<nt.length;ie+=1)nt[ie].d(1);nt.length=st.length}},i(N){Me||(fi(()=>{Fe||(Fe=as(e,cs,{duration:400},!0)),Fe.run(1)}),Me=!0)},o(N){Fe||(Fe=as(e,cs,{duration:400},!1)),Fe.run(0),Me=!1},d(N){N&&U(e),Pt(Ve,N),Pt(nt,N),N&&Fe&&Fe.end()}}}function wo(r){let e,t=r[14]+"",n,i,s;function a(){return r[9](r[14])}return{c(){e=z("p"),n=J(t),P(e,"class","value")},m(o,l){B(o,e,l),E(e,n),i||(s=ze(e,"click",a),i=!0)},p(o,l){r=o,l&2&&t!==(t=r[14]+"")&&pe(n,t)},d(o){o&&U(e),i=!1,s()}}}function Mo(r){let e,t=r[0][r[11].buttonName+"_btn"]+"",n,i,s;function a(){return r[10](r[11])}return{c(){e=z("button"),n=J(t)},m(o,l){B(o,e,l),E(e,n),i||(s=ze(e,"click",a),i=!0)},p(o,l){r=o,l&1&&t!==(t=r[0][r[11].buttonName+"_btn"]+"")&&pe(n,t)},d(o){o&&U(e),i=!1,s()}}}function xo(r){let e=r[4].includes(r[11].panel),t,n=e&&Mo(r);return{c(){n&&n.c(),t=Ft()},m(i,s){n&&n.m(i,s),B(i,t,s)},p(i,s){s&16&&(e=i[4].includes(i[11].panel)),e?n?n.p(i,s):(n=Mo(i),n.c(),n.m(t.parentNode,t)):n&&(n.d(1),n=null)},d(i){n&&n.d(i),i&&U(t)}}}function Mp(r){let e,t,n,i,s,a=r[1].id+"",o,l,c=r[1].name+"",u,f,d,p,m,h,_,g,v;const b=[wp,yp],w=[];function y(S,M){return S[3]?0:1}d=y(r),p=w[d]=b[d](r);let x=r[5]&&yo(r);return{c(){e=z("div"),t=z("div"),n=z("div"),i=z("p"),s=J("("),o=J(a),l=J(") "),u=J(c),f=Z(),p.c(),h=Z(),x&&x.c(),P(i,"class","txt-sm font-medium title"),P(n,"class","player-panel-width panel-title-chevron"),P(t,"id","main-panel"),P(t,"class",m="closed-panel "+r[2])},m(S,M){B(S,e,M),E(e,t),E(t,n),E(n,i),E(i,s),E(i,o),E(i,l),E(i,u),E(n,f),w[d].m(n,null),E(e,h),x&&x.m(e,null),_=!0,g||(v=ze(t,"click",r[7]),g=!0)},p(S,[M]){(!_||M&2)&&a!==(a=S[1].id+"")&&pe(o,a),(!_||M&2)&&c!==(c=S[1].name+"")&&pe(u,c);let T=d;d=y(S),d===T?w[d].p(S,M):(De(),I(w[T],1,1,()=>{w[T]=null}),Re(),p=w[d],p?p.p(S,M):(p=w[d]=b[d](S),p.c()),D(p,1),p.m(n,null)),(!_||M&4&&m!==(m="closed-panel "+S[2]))&&P(t,"class",m),S[5]?x?(x.p(S,M),M&32&&D(x,1)):(x=yo(S),x.c(),D(x,1),x.m(e,null)):x&&(De(),I(x,1,1,()=>{x=null}),Re())},i(S){_||(D(p),D(x),_=!0)},o(S){I(p),I(x),_=!1},d(S){S&&U(e),w[d].d(),x&&x.d(),g=!1,v()}}}function xp(r,e,t){let{localeConsts:n,panelData:i,bgColor:s,canOpenPanel:a=!1}=e,{showingPanels:o}=e,l=!1,c=[{buttonName:"teleport",panel:n.Teleport_to_Player},{buttonName:"bring",panel:n.Bring_Player},{buttonName:"spectate",panel:n.Spectate_Player},{buttonName:"freeze",panel:n.Freeze_Player},{buttonName:"send_back",panel:n.Bring_Player}];function u(){a&&t(5,l=!l)}async function f(m){const h={playerId:i.id,action:m};await Pe("playerListActions",h)}const d=m=>tt.copyToClipboard(m),p=m=>f(m.buttonName);return r.$$set=m=>{"localeConsts"in m&&t(0,n=m.localeConsts),"panelData"in m&&t(1,i=m.panelData),"bgColor"in m&&t(2,s=m.bgColor),"canOpenPanel"in m&&t(3,a=m.canOpenPanel),"showingPanels"in m&&t(4,o=m.showingPanels)},[n,i,s,a,o,l,c,u,f,d,p]}class Sp extends Xe{constructor(e){super(),We(this,e,xp,Mp,He,{localeConsts:0,panelData:1,bgColor:2,canOpenPanel:3,showingPanels:4})}}function So(r,e,t){const n=r.slice();return n[14]=e[t],n[16]=t,n}function Co(r,e,t){const n=r.slice();return n[17]=e[t],n}function Cp(r){let e,t,n,i,s,a,o=[],l=new Map,c,u=r[8],f=[];for(let m=0;m<u.length;m+=1)f[m]=To(Co(r,u,m));n=new ps({props:{placeholder:r[0].player_placeholder}}),n.$on("search-value-update",r[12]);let d=r[5];const p=m=>m[14].id;for(let m=0;m<d.length;m+=1){let h=So(r,d,m),_=p(h);l.set(_,o[m]=Eo(_,h))}return{c(){e=z("div");for(let m=0;m<f.length;m+=1)f[m].c();t=Z(),ee(n.$$.fragment),i=Z(),s=z("div"),a=z("div");for(let m=0;m<o.length;m+=1)o[m].c();P(e,"class","players-horizontal-tab"),P(a,"class","nav-body"),P(s,"class","item-rows")},m(m,h){B(m,e,h);for(let _=0;_<f.length;_+=1)f[_].m(e,null);B(m,t,h),Q(n,m,h),B(m,i,h),B(m,s,h),E(s,a);for(let _=0;_<o.length;_+=1)o[_].m(a,null);c=!0},p(m,h){if(h&1349){u=m[8];let g;for(g=0;g<u.length;g+=1){const v=Co(m,u,g);f[g]?f[g].p(v,h):(f[g]=To(v),f[g].c(),f[g].m(e,null))}for(;g<f.length;g+=1)f[g].d(1);f.length=u.length}const _={};if(h&1&&(_.placeholder=m[0].player_placeholder),n.$set(_),h&39){d=m[5],De();for(let g=0;g<o.length;g+=1)o[g].r();o=xr(o,h,p,1,m,d,l,a,hs,Eo,null,So);for(let g=0;g<o.length;g+=1)o[g].a();Re()}},i(m){if(!c){D(n.$$.fragment,m);for(let h=0;h<d.length;h+=1)D(o[h]);c=!0}},o(m){I(n.$$.fragment,m);for(let h=0;h<o.length;h+=1)I(o[h]);c=!1},d(m){m&&U(e),Pt(f,m),m&&U(t),$(n,m),m&&U(i),m&&U(s);for(let h=0;h<o.length;h+=1)o[h].d()}}}function Tp(r){let e,t;return e=new dt({}),{c(){ee(e.$$.fragment)},m(n,i){Q(e,n,i),t=!0},p:_e,i(n){t||(D(e.$$.fragment,n),t=!0)},o(n){I(e.$$.fragment,n),t=!1},d(n){$(e,n)}}}function Ep(r){let e,t=r[6].online.length+"",n,i;return{c(){e=J("("),n=J(t),i=J(")")},m(s,a){B(s,e,a),B(s,n,a),B(s,i,a)},p(s,a){a&64&&t!==(t=s[6].online.length+"")&&pe(n,t)},d(s){s&&U(e),s&&U(n),s&&U(i)}}}function To(r){let e,t=tt.upperCaseFirstLetter(r[0][r[17]+"_tab_name"])+"",n,i,s,a,o,l,c=r[17]==="online"&&Ep(r);function u(){return r[11](r[17])}return{c(){e=z("button"),n=J(t),i=Z(),c&&c.c(),s=Z(),P(e,"id",r[17]),P(e,"class",a="tablinks "+(r[2]===r[17]?"active-horizontal-tab-link":""))},m(f,d){B(f,e,d),E(e,n),E(e,i),c&&c.m(e,null),E(e,s),o||(l=ze(e,"click",u),o=!0)},p(f,d){r=f,d&1&&t!==(t=tt.upperCaseFirstLetter(r[0][r[17]+"_tab_name"])+"")&&pe(n,t),r[17]==="online"&&c.p(r,d),d&4&&a!==(a="tablinks "+(r[2]===r[17]?"active-horizontal-tab-link":""))&&P(e,"class",a)},d(f){f&&U(e),c&&c.d(),o=!1,l()}}}function Eo(r,e){let t,n,i,s,a=_e,o;return n=new Sp({props:{localeConsts:e[0],showingPanels:e[1],panelData:e[14],bgColor:e[14].isAdmin?"admin-player-resource-bg":"even-pane-panel-bg",canOpenPanel:e[2]==="online"}}),{key:r,first:null,c(){t=z("div"),ee(n.$$.fragment),i=Z(),this.first=t},m(l,c){B(l,t,c),Q(n,t,null),E(t,i),o=!0},p(l,c){e=l;const u={};c&1&&(u.localeConsts=e[0]),c&2&&(u.showingPanels=e[1]),c&32&&(u.panelData=e[14]),c&32&&(u.bgColor=e[14].isAdmin?"admin-player-resource-bg":"even-pane-panel-bg"),c&4&&(u.canOpenPanel=e[2]==="online"),n.$set(u)},r(){s=t.getBoundingClientRect()},f(){Mr(t),a()},a(){a(),a=wr(t,s,Sr,{duration:400})},i(l){o||(D(n.$$.fragment,l),o=!0)},o(l){I(n.$$.fragment,l),o=!1},d(l){l&&U(t),$(n)}}}function Lp(r){let e,t,n=r[0].players_page_heading+"",i,s,a,o,l,c;const u=[Tp,Cp],f=[];function d(p,m){return p[3]?0:1}return o=d(r),l=f[o]=u[o](r),{c(){e=z("div"),t=z("div"),i=J(n),s=Z(),a=z("div"),l.c(),P(t,"class","heading"),P(a,"class","body-wrapper"),P(e,"class","main-body")},m(p,m){B(p,e,m),E(e,t),E(t,i),E(e,s),E(e,a),f[o].m(a,null),c=!0},p(p,[m]){(!c||m&1)&&n!==(n=p[0].players_page_heading+"")&&pe(i,n);let h=o;o=d(p),o===h?f[o].p(p,m):(De(),I(f[h],1,1,()=>{f[h]=null}),Re(),l=f[o],l?l.p(p,m):(l=f[o]=u[o](p),l.c()),D(l,1),l.m(a,null))},i(p){c||(D(l),c=!0)},o(p){I(l),c=!1},d(p){p&&U(e),f[o].d()}}}function Pp(r,e,t){let n,{localeConsts:i}=e,{showingPanels:s}=e,{isDev:a}=yt;ft(r,a,g=>t(13,n=g));let o="online",l=["online","offline"],c=!1,u="",f=[],d={online:[],offline:[]};ct(async()=>{t(3,c=!0);let g={};n?g={onlinePlayers:[{id:2,name:"Sakshi",licenses:["Driving","Cooking"]},{id:1,name:"Pushkar",licenses:["Driving","Chutyap"]}],offlinePlayers:[{id:3,name:"Shruti",timeOfDisconnect:1670784600},{id:4,name:"Vaishnavi",timeOfDisconnect:1670784600}]}:g=await Pe("getPlayerDataForList"),t(6,d.online=g.onlinePlayers,d),t(6,d.offline=tt.changeTimeBasedOnTimeZone(g.offlinePlayers,"timeOfDisconnect"),d),p(),t(3,c=!1)});function p(){t(5,f=tt.filterAndSort(d[o],"name",u,"num","id","asc"))}function m(g){t(2,o=g),p()}const h=g=>m(g),_=g=>{t(4,u=g.detail),p()};return r.$$set=g=>{"localeConsts"in g&&t(0,i=g.localeConsts),"showingPanels"in g&&t(1,s=g.showingPanels)},[i,s,o,c,u,f,d,a,l,p,m,h,_]}class Ap extends Xe{constructor(e){super(),We(this,e,Pp,Lp,He,{localeConsts:0,showingPanels:1})}}function Dp(r){let e,t,n,i,s,a,o,l;return t=new zt({props:{icon:Sf,class:"txt-xs stop"}}),s=new zt({props:{icon:nf,class:"txt-xs replay"}}),{c(){e=z("div"),ee(t.$$.fragment),n=Z(),i=z("div"),ee(s.$$.fragment)},m(c,u){B(c,e,u),Q(t,e,null),B(c,n,u),B(c,i,u),Q(s,i,null),a=!0,o||(l=[ze(e,"click",r[4]),ze(i,"click",r[5])],o=!0)},p:_e,i(c){a||(D(t.$$.fragment,c),D(s.$$.fragment,c),a=!0)},o(c){I(t.$$.fragment,c),I(s.$$.fragment,c),a=!1},d(c){c&&U(e),$(t),c&&U(n),c&&U(i),$(s),o=!1,xt(l)}}}function Rp(r){let e,t,n,i,s;return t=new zt({props:{icon:wf,class:"txt-xs start"}}),{c(){e=z("div"),ee(t.$$.fragment)},m(a,o){B(a,e,o),Q(t,e,null),n=!0,i||(s=ze(e,"click",r[3]),i=!0)},p:_e,i(a){n||(D(t.$$.fragment,a),n=!0)},o(a){I(t.$$.fragment,a),n=!1},d(a){a&&U(e),$(t),i=!1,s()}}}function kp(r){let e,t,n,i,s,a=r[0].name+"",o,l,c,u,f,d,p;const m=[Rp,Dp],h=[];function _(g,v){return g[0].state===0?0:1}return u=_(r),f=h[u]=m[u](r),{c(){e=z("div"),t=z("div"),n=z("div"),i=z("div"),s=z("p"),o=J(a),l=Z(),c=z("div"),f.c(),P(s,"class","txt-sm font-medium title"),P(i,"class","resource-name"),P(c,"class","resource_button_icons"),P(n,"class","player-panel-width panel-title-chevron"),P(t,"id","main-panel"),P(t,"class",d="closed-panel "+r[1])},m(g,v){B(g,e,v),E(e,t),E(t,n),E(n,i),E(i,s),E(s,o),E(n,l),E(n,c),h[u].m(c,null),p=!0},p(g,[v]){(!p||v&1)&&a!==(a=g[0].name+"")&&pe(o,a);let b=u;u=_(g),u===b?h[u].p(g,v):(De(),I(h[b],1,1,()=>{h[b]=null}),Re(),f=h[u],f?f.p(g,v):(f=h[u]=m[u](g),f.c()),D(f,1),f.m(c,null)),(!p||v&2&&d!==(d="closed-panel "+g[1]))&&P(t,"class",d)},i(g){p||(D(f),p=!0)},o(g){I(f),p=!1},d(g){g&&U(e),h[u].d()}}}function Ip(r,e,t){const n=ln();let{panelData:i,bgColor:s}=e;function a(u){n("perform-resource-action",{panelData:i,action:u})}const o=()=>a("start"),l=()=>a("stop"),c=()=>a("restart");return r.$$set=u=>{"panelData"in u&&t(0,i=u.panelData),"bgColor"in u&&t(1,s=u.bgColor)},[i,s,a,o,l,c]}class Np extends Xe{constructor(e){super(),We(this,e,Ip,kp,He,{panelData:0,bgColor:1})}}function Lo(r,e,t){const n=r.slice();return n[15]=e[t],n[17]=t,n}function Po(r,e,t){const n=r.slice();return n[18]=e[t],n}function zp(r){let e,t,n,i,s,a,o=[],l=new Map,c,u=r[6],f=[];for(let m=0;m<u.length;m+=1)f[m]=Ao(Po(r,u,m));n=new ps({props:{placeholder:r[0].resources_search_placeholder}}),n.$on("search-value-update",r[11]);let d=r[3];const p=m=>m[15].id;for(let m=0;m<d.length;m+=1){let h=Lo(r,d,m),_=p(h);l.set(_,o[m]=Do(_,h))}return{c(){e=z("div");for(let m=0;m<f.length;m+=1)f[m].c();t=Z(),ee(n.$$.fragment),i=Z(),s=z("div"),a=z("div");for(let m=0;m<o.length;m+=1)o[m].c();P(e,"class","players-horizontal-tab"),P(a,"class","nav-body"),P(s,"class","item-rows")},m(m,h){B(m,e,h);for(let _=0;_<f.length;_+=1)f[_].m(e,null);B(m,t,h),Q(n,m,h),B(m,i,h),B(m,s,h),E(s,a);for(let _=0;_<o.length;_+=1)o[_].m(a,null);c=!0},p(m,h){if(h&209){u=m[6];let g;for(g=0;g<u.length;g+=1){const v=Po(m,u,g);f[g]?f[g].p(v,h):(f[g]=Ao(v),f[g].c(),f[g].m(e,null))}for(;g<f.length;g+=1)f[g].d(1);f.length=u.length}const _={};if(h&1&&(_.placeholder=m[0].resources_search_placeholder),n.$set(_),h&520){d=m[3],De();for(let g=0;g<o.length;g+=1)o[g].r();o=xr(o,h,p,1,m,d,l,a,hs,Do,null,Lo);for(let g=0;g<o.length;g+=1)o[g].a();Re()}},i(m){if(!c){D(n.$$.fragment,m);for(let h=0;h<d.length;h+=1)D(o[h]);c=!0}},o(m){I(n.$$.fragment,m);for(let h=0;h<o.length;h+=1)I(o[h]);c=!1},d(m){m&&U(e),Pt(f,m),m&&U(t),$(n,m),m&&U(i),m&&U(s);for(let h=0;h<o.length;h+=1)o[h].d()}}}function Fp(r){let e,t;return e=new dt({}),{c(){ee(e.$$.fragment)},m(n,i){Q(e,n,i),t=!0},p:_e,i(n){t||(D(e.$$.fragment,n),t=!0)},o(n){I(e.$$.fragment,n),t=!1},d(n){$(e,n)}}}function Ao(r){let e,t=tt.upperCaseFirstLetter(r[0]["resources_"+r[18]+"_tab_name"])+"",n,i,s,a,o;function l(){return r[10](r[18])}return{c(){e=z("button"),n=J(t),i=Z(),P(e,"id",r[18]),P(e,"class",s="tablinks "+(r[4]===r[18]?"active-horizontal-tab-link":""))},m(c,u){B(c,e,u),E(e,n),E(e,i),a||(o=ze(e,"click",l),a=!0)},p(c,u){r=c,u&1&&t!==(t=tt.upperCaseFirstLetter(r[0]["resources_"+r[18]+"_tab_name"])+"")&&pe(n,t),u&16&&s!==(s="tablinks "+(r[4]===r[18]?"active-horizontal-tab-link":""))&&P(e,"class",s)},d(c){c&&U(e),a=!1,o()}}}function Do(r,e){let t,n,i,s,a=_e,o;return n=new Np({props:{panelData:e[15],bgColor:"odd-pane-panel"}}),n.$on("perform-resource-action",e[9]),{key:r,first:null,c(){t=z("div"),ee(n.$$.fragment),i=Z(),this.first=t},m(l,c){B(l,t,c),Q(n,t,null),E(t,i),o=!0},p(l,c){e=l;const u={};c&8&&(u.panelData=e[15]),n.$set(u)},r(){s=t.getBoundingClientRect()},f(){Mr(t),a()},a(){a(),a=wr(t,s,Sr,{duration:400})},i(l){o||(D(n.$$.fragment,l),o=!0)},o(l){I(n.$$.fragment,l),o=!1},d(l){l&&U(t),$(n)}}}function Op(r){let e,t,n=r[0].resources_page_heading+"",i,s,a,o,l,c;const u=[Fp,zp],f=[];function d(p,m){return p[1]?0:1}return o=d(r),l=f[o]=u[o](r),{c(){e=z("div"),t=z("div"),i=J(n),s=Z(),a=z("div"),l.c(),P(t,"class","heading"),P(a,"class","body-wrapper"),P(e,"class","main-body")},m(p,m){B(p,e,m),E(e,t),E(t,i),E(e,s),E(e,a),f[o].m(a,null),c=!0},p(p,[m]){(!c||m&1)&&n!==(n=p[0].resources_page_heading+"")&&pe(i,n);let h=o;o=d(p),o===h?f[o].p(p,m):(De(),I(f[h],1,1,()=>{f[h]=null}),Re(),l=f[o],l?l.p(p,m):(l=f[o]=u[o](p),l.c()),D(l,1),l.m(a,null))},i(p){c||(D(l),c=!0)},o(p){I(l),c=!1},d(p){p&&U(e),f[o].d()}}}function Up(r,e,t){let n,{localeConsts:i}=e,{isDev:s}=yt;ft(r,s,v=>t(13,n=v));let a=!1,o="",l=[],c=["active","inactive"],u="active",f={active:[],inactive:[]};ct(async()=>{t(1,a=!0),await d(),t(1,a=!1)});async function d(){let v={};n?v={resources:[{id:1,name:"Resource XYZ",state:0},{id:2,name:"Resource DEF",state:1}]}:v=await Pe("getResourceList"),f.active=v.resources.filter(b=>b.state===1),f.inactive=v.resources.filter(b=>b.state===0),m()}function p(v){t(4,u=v),m()}function m(){t(3,l=tt.filterAndSort(f[u],"name",o,"alpha","name"))}async function h(v){let b=v.detail.action,w=v.detail.panelData;t(1,a=!0);const y=b==="start"?"startResource":b==="stop"?"stopResource":"restartResource",x={name:w.name};let S="";n?S="ok":S=await Pe(y,x),S==="ok"&&await d(),t(1,a=!1)}const _=v=>p(v),g=v=>{t(2,o=v.detail),m()};return r.$$set=v=>{"localeConsts"in v&&t(0,i=v.localeConsts)},[i,a,o,l,u,s,c,p,m,h,_,g]}class Bp extends Xe{constructor(e){super(),We(this,e,Up,Op,He,{localeConsts:0})}}function Vp(r){let e,t,n,i,s=r[1][r[0].localConstKey]+"",a,o,l,c,u;return t=new zt({props:{icon:r[0].icon,class:"txt-md "+r[2]}}),{c(){e=z("div"),ee(t.$$.fragment),n=Z(),i=z("span"),a=J(s),P(i,"id",o=r[0].id),P(i,"class","tool-tip-text-top"),P(e,"class","inner-icon")},m(f,d){B(f,e,d),Q(t,e,null),E(e,n),E(e,i),E(i,a),l=!0,c||(u=[ze(e,"click",r[4]),ze(e,"mouseenter",r[5]),ze(e,"mouseleave",r[6])],c=!0)},p(f,[d]){const p={};d&1&&(p.icon=f[0].icon),d&4&&(p.class="txt-md "+f[2]),t.$set(p),(!l||d&3)&&s!==(s=f[1][f[0].localConstKey]+"")&&pe(a,s),(!l||d&1&&o!==(o=f[0].id))&&P(i,"id",o)},i(f){l||(D(t.$$.fragment,f),l=!0)},o(f){I(t.$$.fragment,f),l=!1},d(f){f&&U(e),$(t),c=!1,xt(u)}}}function Gp(r,e,t){const n=ln();let{menuItem:i,localeConsts:s,extraClassNames:a=""}=e;function o(f){n("showSideBarPage",f)}const l=()=>{o(i.showPageKey)},c=()=>tt.toggleToolTip(i.id),u=()=>tt.toggleToolTip(i.id);return r.$$set=f=>{"menuItem"in f&&t(0,i=f.menuItem),"localeConsts"in f&&t(1,s=f.localeConsts),"extraClassNames"in f&&t(2,a=f.extraClassNames)},[i,s,a,o,l,c,u]}class Wi extends Xe{constructor(e){super(),We(this,e,Gp,Vp,He,{menuItem:0,localeConsts:1,extraClassNames:2})}}function Ro(r,e,t){const n=r.slice();return n[55]=e[t],n[57]=t,n}function ko(r,e,t){const n=r.slice();return n[58]=e[t],n}function Io(r,e,t){const n=r.slice();return n[61]=e[t],n}function No(r,e,t){const n=r.slice();return n[64]=e[t],n}function zo(r,e,t){const n=r.slice();return n[61]=e[t],n}function Fo(r,e,t){const n=r.slice();return n[61]=e[t],n}function Oo(r,e,t){const n=r.slice();return n[64]=e[t],n}function Uo(r,e,t){const n=r.slice();return n[73]=e[t],n}function Hp(r){let e,t,n,i,s,a,o,l,c,u,f,d=r[30],p=[];for(let S=0;S<d.length;S+=1)p[S]=Bo(Uo(r,d,S));const m=S=>I(p[S],1,1,()=>{p[S]=null});let h=r[7]&&Vo(r),_=r[8]&&Ho(r),g=r[9]&&Xo(r),v=r[10]&&qo(r),b=r[14]&&Zo(r);const w=[Jp,Kp,Zp,Yp,qp,jp,Xp],y=[];function x(S,M){return S[12].showGodModeAdminPage?0:S[12].showThemePage?1:S[12].showChat?2:S[12].showReportsPage?3:S[12].showPlayersPage?4:S[12].showResourcesPage?5:!S[12].showGodModeAdminPage&&!S[12].showThemePage&&!S[12].showChat&&!S[12].showPlayersPage&&!S[12].showResourcesPage?6:-1}return~(c=x(r))&&(u=y[c]=w[c](r)),{c(){e=z("div");for(let S=0;S<p.length;S+=1)p[S].c();t=Z(),h&&h.c(),n=Z(),_&&_.c(),i=Z(),g&&g.c(),s=Z(),v&&v.c(),a=Z(),b&&b.c(),o=Z(),l=z("div"),u&&u.c(),P(e,"class","vertical-menu"),P(l,"id","inner_div_id"),P(l,"class","inner bg-dark-900/50")},m(S,M){B(S,e,M);for(let T=0;T<p.length;T+=1)p[T].m(e,null);E(e,t),h&&h.m(e,null),E(e,n),_&&_.m(e,null),E(e,i),g&&g.m(e,null),E(e,s),v&&v.m(e,null),E(e,a),b&&b.m(e,null),B(S,o,M),B(S,l,M),~c&&y[c].m(l,null),f=!0},p(S,M){if(M[0]&1346371584){d=S[30];let R;for(R=0;R<d.length;R+=1){const k=Uo(S,d,R);p[R]?(p[R].p(k,M),D(p[R],1)):(p[R]=Bo(k),p[R].c(),D(p[R],1),p[R].m(e,t))}for(De(),R=d.length;R<p.length;R+=1)m(R);Re()}S[7]?h?(h.p(S,M),M[0]&128&&D(h,1)):(h=Vo(S),h.c(),D(h,1),h.m(e,n)):h&&(De(),I(h,1,1,()=>{h=null}),Re()),S[8]?_?(_.p(S,M),M[0]&256&&D(_,1)):(_=Ho(S),_.c(),D(_,1),_.m(e,i)):_&&(De(),I(_,1,1,()=>{_=null}),Re()),S[9]?g?(g.p(S,M),M[0]&512&&D(g,1)):(g=Xo(S),g.c(),D(g,1),g.m(e,s)):g&&(De(),I(g,1,1,()=>{g=null}),Re()),S[10]?v?(v.p(S,M),M[0]&1024&&D(v,1)):(v=qo(S),v.c(),D(v,1),v.m(e,a)):v&&(De(),I(v,1,1,()=>{v=null}),Re()),S[14]?b?(b.p(S,M),M[0]&16384&&D(b,1)):(b=Zo(S),b.c(),D(b,1),b.m(e,null)):b&&(De(),I(b,1,1,()=>{b=null}),Re());let T=c;c=x(S),c===T?~c&&y[c].p(S,M):(u&&(De(),I(y[T],1,1,()=>{y[T]=null}),Re()),~c?(u=y[c],u?u.p(S,M):(u=y[c]=w[c](S),u.c()),D(u,1),u.m(l,null)):u=null)},i(S){if(!f){for(let M=0;M<d.length;M+=1)D(p[M]);D(h),D(_),D(g),D(v),D(b),D(u),f=!0}},o(S){p=p.filter(Boolean);for(let M=0;M<p.length;M+=1)I(p[M]);I(h),I(_),I(g),I(v),I(b),I(u),f=!1},d(S){S&&U(e),Pt(p,S),h&&h.d(),_&&_.d(),g&&g.d(),v&&v.d(),b&&b.d(),S&&U(o),S&&U(l),~c&&y[c].d()}}}function Wp(r){let e,t;return e=new dt({props:{marginLeft:"45%"}}),{c(){ee(e.$$.fragment)},m(n,i){Q(e,n,i),t=!0},p:_e,i(n){t||(D(e.$$.fragment,n),t=!0)},o(n){I(e.$$.fragment,n),t=!1},d(n){$(e,n)}}}function Bo(r){let e,t;return e=new Wi({props:{menuItem:r[73],localeConsts:r[22]}}),e.$on("showSideBarPage",r[37]),{c(){ee(e.$$.fragment)},m(n,i){Q(e,n,i),t=!0},p:_e,i(n){t||(D(e.$$.fragment,n),t=!0)},o(n){I(e.$$.fragment,n),t=!1},d(n){$(e,n)}}}function Vo(r){let e,t,n=r[31],i=[];for(let a=0;a<n.length;a+=1)i[a]=Go(Oo(r,n,a));const s=a=>I(i[a],1,1,()=>{i[a]=null});return{c(){for(let a=0;a<i.length;a+=1)i[a].c();e=Ft()},m(a,o){for(let l=0;l<i.length;l+=1)i[l].m(a,o);B(a,e,o),t=!0},p(a,o){if(o[0]&272629760|o[1]&1){n=a[31];let l;for(l=0;l<n.length;l+=1){const c=Oo(a,n,l);i[l]?(i[l].p(c,o),D(i[l],1)):(i[l]=Go(c),i[l].c(),D(i[l],1),i[l].m(e.parentNode,e))}for(De(),l=n.length;l<i.length;l+=1)s(l);Re()}},i(a){if(!t){for(let o=0;o<n.length;o+=1)D(i[o]);t=!0}},o(a){i=i.filter(Boolean);for(let o=0;o<i.length;o+=1)I(i[o]);t=!1},d(a){Pt(i,a),a&&U(e)}}}function Go(r){let e,t;return e=new Wi({props:{menuItem:r[64],localeConsts:r[22]}}),e.$on("showSideBarPage",r[38]),{c(){ee(e.$$.fragment)},m(n,i){Q(e,n,i),t=!0},p:_e,i(n){t||(D(e.$$.fragment,n),t=!0)},o(n){I(e.$$.fragment,n),t=!1},d(n){$(e,n)}}}function Ho(r){let e,t,n=r[33],i=[];for(let a=0;a<n.length;a+=1)i[a]=Wo(Fo(r,n,a));const s=a=>I(i[a],1,1,()=>{i[a]=null});return{c(){for(let a=0;a<i.length;a+=1)i[a].c();e=Ft()},m(a,o){for(let l=0;l<i.length;l+=1)i[l].m(a,o);B(a,e,o),t=!0},p(a,o){if(o[0]&272728064|o[1]&4){n=a[33];let l;for(l=0;l<n.length;l+=1){const c=Fo(a,n,l);i[l]?(i[l].p(c,o),D(i[l],1)):(i[l]=Wo(c),i[l].c(),D(i[l],1),i[l].m(e.parentNode,e))}for(De(),l=n.length;l<i.length;l+=1)s(l);Re()}},i(a){if(!t){for(let o=0;o<n.length;o+=1)D(i[o]);t=!0}},o(a){i=i.filter(Boolean);for(let o=0;o<i.length;o+=1)I(i[o]);t=!1},d(a){Pt(i,a),a&&U(e)}}}function Wo(r){let e,t;return e=new Wi({props:{menuItem:r[61],localeConsts:r[22],extraClassNames:r[61].id==="debug-id"&&r[16]||r[61].id==="dev-mode-id"&&r[15]?"clicked-icon":""}}),e.$on("showSideBarPage",r[39]),{c(){ee(e.$$.fragment)},m(n,i){Q(e,n,i),t=!0},p(n,i){const s={};i[0]&98304&&(s.extraClassNames=n[61].id==="debug-id"&&n[16]||n[61].id==="dev-mode-id"&&n[15]?"clicked-icon":""),e.$set(s)},i(n){t||(D(e.$$.fragment,n),t=!0)},o(n){I(e.$$.fragment,n),t=!1},d(n){$(e,n)}}}function Xo(r){let e,t,n=r[34],i=[];for(let a=0;a<n.length;a+=1)i[a]=jo(zo(r,n,a));const s=a=>I(i[a],1,1,()=>{i[a]=null});return{c(){for(let a=0;a<i.length;a+=1)i[a].c();e=Ft()},m(a,o){for(let l=0;l<i.length;l+=1)i[l].m(a,o);B(a,e,o),t=!0},p(a,o){if(o[0]&272728064|o[1]&8){n=a[34];let l;for(l=0;l<n.length;l+=1){const c=zo(a,n,l);i[l]?(i[l].p(c,o),D(i[l],1)):(i[l]=jo(c),i[l].c(),D(i[l],1),i[l].m(e.parentNode,e))}for(De(),l=n.length;l<i.length;l+=1)s(l);Re()}},i(a){if(!t){for(let o=0;o<n.length;o+=1)D(i[o]);t=!0}},o(a){i=i.filter(Boolean);for(let o=0;o<i.length;o+=1)I(i[o]);t=!1},d(a){Pt(i,a),a&&U(e)}}}function jo(r){let e,t;return e=new Wi({props:{menuItem:r[61],localeConsts:r[22],extraClassNames:r[61].id==="debug-id"&&r[16]||r[61].id==="dev-mode-id"&&r[15]?"clicked-icon":""}}),e.$on("showSideBarPage",r[40]),{c(){ee(e.$$.fragment)},m(n,i){Q(e,n,i),t=!0},p(n,i){const s={};i[0]&98304&&(s.extraClassNames=n[61].id==="debug-id"&&n[16]||n[61].id==="dev-mode-id"&&n[15]?"clicked-icon":""),e.$set(s)},i(n){t||(D(e.$$.fragment,n),t=!0)},o(n){I(e.$$.fragment,n),t=!1},d(n){$(e,n)}}}function qo(r){let e,t,n=r[32],i=[];for(let a=0;a<n.length;a+=1)i[a]=Yo(No(r,n,a));const s=a=>I(i[a],1,1,()=>{i[a]=null});return{c(){for(let a=0;a<i.length;a+=1)i[a].c();e=Ft()},m(a,o){for(let l=0;l<i.length;l+=1)i[l].m(a,o);B(a,e,o),t=!0},p(a,o){if(o[0]&272629760|o[1]&2){n=a[32];let l;for(l=0;l<n.length;l+=1){const c=No(a,n,l);i[l]?(i[l].p(c,o),D(i[l],1)):(i[l]=Yo(c),i[l].c(),D(i[l],1),i[l].m(e.parentNode,e))}for(De(),l=n.length;l<i.length;l+=1)s(l);Re()}},i(a){if(!t){for(let o=0;o<n.length;o+=1)D(i[o]);t=!0}},o(a){i=i.filter(Boolean);for(let o=0;o<i.length;o+=1)I(i[o]);t=!1},d(a){Pt(i,a),a&&U(e)}}}function Yo(r){let e,t;return e=new Wi({props:{menuItem:r[64],localeConsts:r[22]}}),e.$on("showSideBarPage",r[41]),{c(){ee(e.$$.fragment)},m(n,i){Q(e,n,i),t=!0},p:_e,i(n){t||(D(e.$$.fragment,n),t=!0)},o(n){I(e.$$.fragment,n),t=!1},d(n){$(e,n)}}}function Zo(r){let e,t,n=r[35],i=[];for(let a=0;a<n.length;a+=1)i[a]=Ko(Io(r,n,a));const s=a=>I(i[a],1,1,()=>{i[a]=null});return{c(){for(let a=0;a<i.length;a+=1)i[a].c();e=Ft()},m(a,o){for(let l=0;l<i.length;l+=1)i[l].m(a,o);B(a,e,o),t=!0},p(a,o){if(o[0]&272629760|o[1]&16){n=a[35];let l;for(l=0;l<n.length;l+=1){const c=Io(a,n,l);i[l]?(i[l].p(c,o),D(i[l],1)):(i[l]=Ko(c),i[l].c(),D(i[l],1),i[l].m(e.parentNode,e))}for(De(),l=n.length;l<i.length;l+=1)s(l);Re()}},i(a){if(!t){for(let o=0;o<n.length;o+=1)D(i[o]);t=!0}},o(a){i=i.filter(Boolean);for(let o=0;o<i.length;o+=1)I(i[o]);t=!1},d(a){Pt(i,a),a&&U(e)}}}function Ko(r){let e,t;return e=new Wi({props:{menuItem:r[61],localeConsts:r[22]}}),e.$on("showSideBarPage",r[42]),{c(){ee(e.$$.fragment)},m(n,i){Q(e,n,i),t=!0},p:_e,i(n){t||(D(e.$$.fragment,n),t=!0)},o(n){I(e.$$.fragment,n),t=!1},d(n){$(e,n)}}}function Xp(r){let e,t,n,i,s,a,o=[],l=new Map,c,u=r[36],f=[];for(let m=0;m<u.length;m+=1)f[m]=Jo(ko(r,u,m));n=new ps({props:{placeholder:r[22].search_placeholder}}),n.$on("search-value-update",r[44]);let d=r[5];const p=m=>m[55].id;for(let m=0;m<d.length;m+=1){let h=Ro(r,d,m),_=p(h);l.set(_,o[m]=Qo(_,h))}return{c(){e=z("div");for(let m=0;m<f.length;m+=1)f[m].c();t=Z(),ee(n.$$.fragment),i=Z(),s=z("div"),a=z("div");for(let m=0;m<o.length;m+=1)o[m].c();P(e,"class","horizontal-tab"),P(a,"class","nav-body"),P(s,"class","item-rows")},m(m,h){B(m,e,h);for(let _=0;_<f.length;_+=1)f[_].m(e,null);B(m,t,h),Q(n,m,h),B(m,i,h),B(m,s,h),E(s,a);for(let _=0;_<o.length;_+=1)o[_].m(a,null);c=!0},p(m,h){if(h[0]&20971536|h[1]&32){u=m[36];let _;for(_=0;_<u.length;_+=1){const g=ko(m,u,_);f[_]?f[_].p(g,h):(f[_]=Jo(g),f[_].c(),f[_].m(e,null))}for(;_<f.length;_+=1)f[_].d(1);f.length=u.length}if(h[0]&201334816){d=m[5],De();for(let _=0;_<o.length;_+=1)o[_].r();o=xr(o,h,p,1,m,d,l,a,hs,Qo,null,Ro);for(let _=0;_<o.length;_+=1)o[_].a();Re()}},i(m){if(!c){D(n.$$.fragment,m);for(let h=0;h<d.length;h+=1)D(o[h]);c=!0}},o(m){I(n.$$.fragment,m);for(let h=0;h<o.length;h+=1)I(o[h]);c=!1},d(m){m&&U(e),Pt(f,m),m&&U(t),$(n,m),m&&U(i),m&&U(s);for(let h=0;h<o.length;h+=1)o[h].d()}}}function jp(r){let e,t;return e=new Bp({props:{localeConsts:r[22]}}),{c(){ee(e.$$.fragment)},m(n,i){Q(e,n,i),t=!0},p:_e,i(n){t||(D(e.$$.fragment,n),t=!0)},o(n){I(e.$$.fragment,n),t=!1},d(n){$(e,n)}}}function qp(r){let e,t;return e=new Ap({props:{localeConsts:r[22],showingPanels:r[11]}}),{c(){ee(e.$$.fragment)},m(n,i){Q(e,n,i),t=!0},p(n,i){const s={};i[0]&2048&&(s.showingPanels=n[11]),e.$set(s)},i(n){t||(D(e.$$.fragment,n),t=!0)},o(n){I(e.$$.fragment,n),t=!1},d(n){$(e,n)}}}function Yp(r){let e,t;return e=new vp({props:{localeConsts:r[22]}}),{c(){ee(e.$$.fragment)},m(n,i){Q(e,n,i),t=!0},p:_e,i(n){t||(D(e.$$.fragment,n),t=!0)},o(n){I(e.$$.fragment,n),t=!1},d(n){$(e,n)}}}function Zp(r){let e,t;return e=new tp({props:{localeConsts:r[22]}}),{c(){ee(e.$$.fragment)},m(n,i){Q(e,n,i),t=!0},p:_e,i(n){t||(D(e.$$.fragment,n),t=!0)},o(n){I(e.$$.fragment,n),t=!1},d(n){$(e,n)}}}function Kp(r){let e,t;return e=new zh({props:{localeConsts:r[22]}}),e.$on("theme-changed",r[29]),{c(){ee(e.$$.fragment)},m(n,i){Q(e,n,i),t=!0},p:_e,i(n){t||(D(e.$$.fragment,n),t=!0)},o(n){I(e.$$.fragment,n),t=!1},d(n){$(e,n)}}}function Jp(r){let e,t;return e=new Zh({props:{panels:r[17],localeConsts:r[22]}}),{c(){ee(e.$$.fragment)},m(n,i){Q(e,n,i),t=!0},p(n,i){const s={};i[0]&131072&&(s.panels=n[17]),e.$set(s)},i(n){t||(D(e.$$.fragment,n),t=!0)},o(n){I(e.$$.fragment,n),t=!1},d(n){$(e,n)}}}function Jo(r){let e,t=tt.upperCaseFirstLetter(r[22][r[58]+"_tab"])+"",n,i,s,a;function o(){return r[43](r[58])}return{c(){e=z("button"),n=J(t),P(e,"id",r[58]),P(e,"class",i="tablinks "+(r[4]===r[58]?"active-horizontal-tab-link":""))},m(l,c){B(l,e,c),E(e,n),s||(a=ze(e,"click",o),s=!0)},p(l,c){r=l,c[0]&16&&i!==(i="tablinks "+(r[4]===r[58]?"active-horizontal-tab-link":""))&&P(e,"class",i)},d(l){l&&U(e),s=!1,a()}}}function Qo(r,e){let t,n,i,s,a=_e,o;return n=new kh({props:{panelData:e[55],bgColor:e[13].includes(e[55].title)?"clicked-pane-non-panel":e[57]%2!==0?"odd-pane-panel":"even-pane-panel-bg"}}),n.$on("star",e[26]),n.$on("panelClicked",e[27]),{key:r,first:null,c(){t=z("div"),ee(n.$$.fragment),i=Z(),this.first=t},m(l,c){B(l,t,c),Q(n,t,null),E(t,i),o=!0},p(l,c){e=l;const u={};c[0]&32&&(u.panelData=e[55]),c[0]&8224&&(u.bgColor=e[13].includes(e[55].title)?"clicked-pane-non-panel":e[57]%2!==0?"odd-pane-panel":"even-pane-panel-bg"),n.$set(u)},r(){s=t.getBoundingClientRect()},f(){Mr(t),a()},a(){a(),a=wr(t,s,Sr,{duration:400})},i(l){o||(D(n.$$.fragment,l),o=!0)},o(l){I(n.$$.fragment,l),o=!1},d(l){l&&U(t),$(n)}}}function Qp(r){let e,t,n,i,s,a,o,l,c,u;n=new zt({props:{icon:r[3]?Fa:za,size:"sm",color:"white",style:"margin-top:0.6vw;margin-left:0.45vw;"}});const f=[Wp,Hp],d=[];function p(m,h){return m[2]?0:1}return a=p(r),o=d[a]=f[a](r),{c(){e=z("div"),t=z("div"),ee(n.$$.fragment),i=Z(),s=z("div"),o.c(),P(t,"id","expander"),P(t,"class","inline-block expander bg-gray-400 hover:bg-gray-600"),Bn(t,"margin-left",r[0]-1.5+"vw"),Bn(t,"margin-top",r[1]+"vw"),P(s,"id","menu_base_id"),P(s,"class","inline-block menu-base"),Bn(s,"margin-left",r[0]+"vw"),Bn(s,"margin-top",r[1]+"vw"),P(e,"class","block"),P(e,"data-theme",r[18])},m(m,h){B(m,e,h),E(e,t),Q(n,t,null),E(e,i),E(e,s),d[a].m(s,null),l=!0,c||(u=ze(t,"click",r[23]),c=!0)},p(m,h){const _={};h[0]&8&&(_.icon=m[3]?Fa:za),n.$set(_),(!l||h[0]&1)&&Bn(t,"margin-left",m[0]-1.5+"vw"),(!l||h[0]&2)&&Bn(t,"margin-top",m[1]+"vw");let g=a;a=p(m),a===g?d[a].p(m,h):(De(),I(d[g],1,1,()=>{d[g]=null}),Re(),o=d[a],o?o.p(m,h):(o=d[a]=f[a](m),o.c()),D(o,1),o.m(s,null)),(!l||h[0]&1)&&Bn(s,"margin-left",m[0]+"vw"),(!l||h[0]&2)&&Bn(s,"margin-top",m[1]+"vw"),(!l||h[0]&262144)&&P(e,"data-theme",m[18])},i(m){l||(D(n.$$.fragment,m),D(o),l=!0)},o(m){I(n.$$.fragment,m),I(o),l=!1},d(m){m&&U(e),$(n),d[a].d(),c=!1,u()}}}function $p(r,e,t){let n,i,s,{left:a=70}=e,{top:o=5}=e,{locales:l,data:c,isDev:u}=yt;ft(r,l,fe=>t(49,s=fe)),ft(r,c,fe=>t(47,n=fe)),ft(r,u,fe=>t(48,i=fe));let f=s,d=!1,p=!1,m="all",h=[],_="",g=!1,v=!1,b=!1,w=!1,y=[],x={showGodModeAdminPage:!1,showThemePage:!1,showChat:!1,showReportsPage:!1,showPlayersPage:!1,showResourcesPage:!1},S=[],M=!0,T=!1,R=!1,k=!1,G=[f.Max_Mod_Vehicle,f.Fix_Vehicle,f.Teleport_Marker,f.Revive_In_Radius,f.Bennys,f.Admin_Car,f.Refuel_Vehicle,f.Toggle_Duty,f.Give_Keys,f.Revive_All],F=[{id:1,title:f.Revive,hasPanel:!0,tabName:"player"},{id:2,title:f.NoClip,hasPanel:!1,tabName:"utility",cb:"noclip"},{id:3,title:f.Give_Item,hasPanel:!0,tabName:"player"},{id:4,title:f.Spawn_Car,hasPanel:!0,tabName:"utility"},{id:5,title:f.Fix_Vehicle,hasPanel:!1,tabName:"utility",cb:"fixvehicle"},{id:6,title:f.Clothes_Menu,hasPanel:!0,tabName:"player"},{id:7,title:f.Player_Info,hasPanel:!0,tabName:"player"},{id:8,title:f.Announce,hasPanel:!0,tabName:"utility"},{id:9,title:f.God_Mode,hasPanel:!1,tabName:"utility",cb:"godmode"},{id:10,title:f.Kick,hasPanel:!0,tabName:"player"},{id:11,title:f.Super_Jump,hasPanel:!1,tabName:"utility",cb:"superjump"},{id:12,title:f.Remove_Stress,hasPanel:!0,tabName:"utility"},{id:13,title:f.Teleport_Coords,hasPanel:!0,tabName:"utility"},{id:14,title:f.Teleport_Marker,hasPanel:!1,tabName:"utility",cb:"teleportmarker"},{id:15,title:f.Teleport_to_Player,hasPanel:!0,tabName:"player"},{id:16,title:f.Invisible,hasPanel:!1,tabName:"utility",cb:"invisible"},{id:17,title:f.Give_Money,hasPanel:!0,tabName:"player"},{id:18,title:f.Give_Car,hasPanel:!0,tabName:"player"},{id:19,title:f.Open_Inventory,hasPanel:!0,tabName:"player"},{id:20,title:f.Freeze_Player,hasPanel:!0,tabName:"player"},{id:21,title:f.Change_Plate,hasPanel:!0,tabName:"utility"},{id:22,title:f.Spawn_Objects,hasPanel:!0,tabName:"utility"},{id:23,title:f.Create_Job_Stashes,hasPanel:!0,tabName:"utility"},{id:24,title:f.Give_Job,hasPanel:!0,tabName:"player"},{id:25,title:f.Copy_Coordinates,hasPanel:!0,tabName:"utility"},{id:26,title:f.Toggle_Blips,hasPanel:!1,tabName:"utility",cb:"toggleBlips"},{id:27,title:f.Ban_Player,hasPanel:!0,tabName:"player"},{id:28,title:f.Show_Coordinates,hasPanel:!1,tabName:"utility",cb:"showCoords"},{id:29,title:f.Clear_Inventory,hasPanel:!0,tabName:"player"},{id:30,title:f.Bring_Player,hasPanel:!0,tabName:"player"},{id:31,title:f.Clear_Area_Vehicles,hasPanel:!0,tabName:"utility"},{id:32,title:f.Change_Weather,hasPanel:!0,tabName:"utility"},{id:33,title:f.Change_Time,hasPanel:!0,tabName:"utility"},{id:34,title:f.Create_Gang_Stashes,hasPanel:!0,tabName:"utility"},{id:35,title:f.Spectate_Player,hasPanel:!0,tabName:"player"},{id:36,title:f.Saved_Locations,hasPanel:!0,tabName:"utility"},{id:37,title:f.Revive_In_Radius,hasPanel:!1,tabName:"utility",cb:"reviveRadius"},{id:38,title:f.Show_Props,hasPanel:!0,tabName:"utility"},{id:39,title:f.Toggle_Names,hasPanel:!1,tabName:"utility",cb:"toggleNames"},{id:40,title:f.Bennys,hasPanel:!1,tabName:"utility",cb:"toggleBennys"},{id:41,title:f.Admin_Car,hasPanel:!1,tabName:"utility",cb:"addAdminCar"},{id:42,title:f.Refuel_Vehicle,hasPanel:!1,tabName:"utility",cb:"refuelVehicle"},{id:43,title:f.Toggle_Duty,hasPanel:!1,tabName:"player",cb:"toggleDuty"},{id:44,title:f.Open_Stash,hasPanel:!0,tabName:"player"},{id:45,title:f.Open_Trunk,hasPanel:!0,tabName:"player"},{id:46,title:f.Open_Glovebox,hasPanel:!0,tabName:"player"},{id:47,title:f.Unban_Player,hasPanel:!0,tabName:"player"},{id:48,title:f.Change_Ped_Model,hasPanel:!0,tabName:"player"},{id:49,title:f.Ban_Offline_Player,hasPanel:!0,tabName:"player"},{id:50,title:f.Warn,hasPanel:!0,tabName:"player"},{id:51,title:f.Give_Gang,hasPanel:!0,tabName:"player"},{id:52,title:f.Drunk_Player,hasPanel:!0,tabName:"troll"},{id:53,title:f.Set_Player_on_Fire,hasPanel:!0,tabName:"troll"},{id:54,title:f.Play_Sound_On_Player,hasPanel:!0,tabName:"troll"},{id:55,title:f.Slap_Player_In_Sky,hasPanel:!0,tabName:"troll"},{id:56,title:f.Send_Player_To_JailBox,hasPanel:!0,tabName:"troll"},{id:57,title:f.Give_Keys,hasPanel:!1,tabName:"utility",cb:"givekeys"},{id:58,title:f.Infinite_Ammo,hasPanel:!1,tabName:"utility",cb:"infiniteAmmo"},{id:59,title:f.Change_Vehicle_State,hasPanel:!0,tabName:"utility"},{id:60,title:f.Force_Logout_Player,hasPanel:!0,tabName:"utility"},{id:61,title:f.Give_Outfits,hasPanel:!0,tabName:"player"},{id:62,title:f.DM_Player,hasPanel:!0,tabName:"utility"},{id:63,title:f.Damage_Player_Vehicle,hasPanel:!0,tabName:"troll"},{id:64,title:f.NoClip_2,hasPanel:!1,tabName:"utility",cb:"noclip2"},{id:65,title:f.Admin_Tag,hasPanel:!1,tabName:"utility",cb:"admintag"},{id:66,title:f.Toggle_Minimap,hasPanel:!1,tabName:"utility",cb:"toggleminimap"},{id:67,title:f.Revive_All,hasPanel:!1,tabName:"player",cb:"reviveall"},{id:68,title:f.Clear_Area_Peds,hasPanel:!0,tabName:"utility"},{id:69,title:f.Clear_Area_Objects,hasPanel:!0,tabName:"utility"},{id:70,title:f.Heal,hasPanel:!0,tabName:"player"},{id:71,title:f.Wipe_Player,hasPanel:!0,tabName:"player"},{id:72,title:f.Max_Mod_Vehicle,hasPanel:!1,tabName:"utility",cb:"maxmodvehicle"},{id:73,title:f.Pee_Player,hasPanel:!0,tabName:"troll"},{id:74,title:f.Poop_Player,hasPanel:!0,tabName:"troll"},{id:75,title:f.Give_Perms,hasPanel:!0,tabName:"utility"},{id:76,title:f.Remove_Perms,hasPanel:!0,tabName:"utility"}],O=localStorage.getItem("theme-chosen")?localStorage.getItem("theme-chosen"):"Original";ct(async()=>{t(2,d=!0),t(18,O=localStorage.getItem("theme-chosen")?localStorage.getItem("theme-chosen"):"Original"),i&&vu(c,n={clickedPanels:["NoClip"],userRole:"God",isTerminal:"no",canSeeReports:"yes",isESX:!0,panelsToDisplay:["Announce","Admin Car"],customPanels:[{panelTitle:"Sakshi",submitUrl:"sakshi-submit",components:[{type:"string-input",placeholder:"",fetchDataUrl:"",label:"SakshiLabel",fillCompulsory:!0,keyName:"sakshi"},{type:"number-input",placeholder:"1",fetchDataUrl:"",label:"SakshiNumberLabel",fillCompulsory:!0,keyName:"sakshinumber"},{type:"regular-dropdown",placeholder:"",fetchDataUrl:"somethingfetchurl",label:"SakshiRegDdLabel",fillCompulsory:!0,keyName:"sakshiregdd"},{type:"checkbox-input",placeholder:"",fetchDataUrl:"",label:"SakshicheckboxLabel",fillCompulsory:!1,keyName:"sakshicheckbox"},{type:"searchable-dropdown",placeholder:"",fetchDataUrl:"searchableddfetch",label:"SakshisearchableDdLabel",fillCompulsory:!0,keyName:"sakshisearchdd"}]},{panelTitle:"Pushkar",submitUrl:"pushkar-submit",components:[]}]},n),X(n.customPanels),t(13,S=n.clickedPanels),t(14,M=n.isGod),n.userRole,t(15,T=n.isTerminal==="yes"),t(16,R=n.isDebug==="yes"),k=n.isESX===!0||n.isESX==="true",M&&(t(7,g=!0),t(8,v=!0),t(9,b=!0),t(10,w=!0),t(11,y=F.map(fe=>fe.title))),le(),M||(t(11,y=n.panelsToDisplay),t(17,F=F.filter(fe=>{if(y.includes(fe.title))return fe})),y.includes(f.side_panel_player_list)&&t(7,g=!0),y.includes(f.dev_mode_side_panel)&&t(8,v=!0),y.includes(f.debug_mode_side_panel)&&t(9,b=!0),y.includes(f.resources_side_panel)&&t(10,w=!0)),t(17,F=F.filter(fe=>{if(fe.title!==f.side_panel_player_list||fe.title!==f.dev_mode_side_panel||fe.title!==f.debug_mode_side_panel||fe.title!==f.resources_side_panel)return fe})),ae(),t(2,d=!1)});function X(fe){let L=Math.max(...F.map(K=>K.id)),C=fe.map((K,de)=>(K.components.length===0&&G.push(K.panelTitle),{id:L+de+1,title:K.panelTitle,hasPanel:K.components.length>0,tabName:"custom",cb:K.submitUrl,components:K.components}));t(17,F=F.concat(C))}function le(){k&&t(17,F=F.filter(fe=>{if(fe.title!==f.Create_Gang_Stashes&&fe.title!==f.Give_Gang)return fe}))}function ce(){const fe=document.getElementById("menu_base_id"),L=document.getElementById("inner_div_id"),C=document.getElementById("expander"),K=100*(innerWidth/2)/innerWidth;if(p)fe.style.width="23vw",fe.style.transitionDuration="0.2s",fe.style.transitionTimingFunction="linear",fe.style.transform="translate(0vw)",L.style.width="20vw",C.style.transitionDuration="0.2s",C.style.transitionTimingFunction="linear",C.style.transform="translate(0vw)";else{let de=K-parseFloat(fe.style.marginLeft)-20;fe.style.width="40vw",fe.style.transitionDuration="0.2s",fe.style.transitionTimingFunction="linear",fe.style.transform=`translate(${de}vw)`,L.style.width="37vw",C.style.transitionDuration="0.2s",C.style.transitionTimingFunction="linear",C.style.transform=`translate(${de}vw)`}t(3,p=!p)}function te(fe){t(4,m=fe),ae()}function ne(fe){return tt.booleanSort(fe,"isStarred","asc")}function ue(){let fe=tt.filterAndSort(F,"title",_,"alpha","title");t(5,h=ne(fe))}function be(fe){const L=fe.detail.panelData,C=h.indexOf(L);t(5,h[C]=L,h);let K=h,de=tt.alphabeticalSort(K,"title");t(5,h=ne(de)),ae()}async function q(fe){const L=fe.detail.panelData;if(G.includes(L.title))await Pe(L.cb);else{let C=[];S.includes(L.title)?C=S.filter(de=>de!==L.title):(C=S,C.push(L.title)),t(13,S=C),ae();const K={panelsClicked:S};await Pe(L.cb,K)}}function ae(){if(m==="all"){F.forEach(L=>{L.isStarred=localStorage.getItem(L.title)?localStorage.getItem(L.title):"0"});let fe=tt.alphabeticalSort(F,"title");t(5,h=ne(fe))}else if(m==="player"){let fe=F.filter(C=>C.tabName==="player"),L=tt.alphabeticalSort(fe,"title");t(5,h=ne(L))}else if(m==="utility"){let fe=F.filter(C=>C.tabName==="utility"),L=tt.alphabeticalSort(fe,"title");t(5,h=ne(L))}else if(m==="troll"){let fe=F.filter(C=>C.tabName==="troll"),L=tt.alphabeticalSort(fe,"title");t(5,h=ne(L))}else if(m==="fav"){let fe=F.filter(C=>C.isStarred==="1"||C.isStarred===1),L=tt.alphabeticalSort(fe,"title");t(5,h=ne(L))}else if(m==="custom"){let fe=F.filter(C=>C.tabName==="custom"),L=tt.alphabeticalSort(fe,"title");t(5,h=ne(L))}}async function he(fe){fe==="clickTerminal"?(t(15,T=!T),await Pe("toggleDev")):fe==="clickDebug"?(t(16,R=!R),await Pe("toggleDebug")):Object.keys(x).forEach(L=>{L===fe?t(12,x[L]=!x[L],x):t(12,x[L]=!1,x)})}function W(){O!==localStorage.getItem("theme-chosen")&&t(18,O=localStorage.getItem("theme-chosen")?localStorage.getItem("theme-chosen"):"Original")}let xe=[{id:"theme-id",showPageKey:"showThemePage",icon:_f,localConstKey:"theme_tooltip"},{id:"chat-id",showPageKey:"showChat",icon:mf,localConstKey:"chat_tooltip"},{id:"reports-id",showPageKey:"showReportsPage",icon:df,localConstKey:"report_tooltip"}],ye=[{id:"players-id",showPageKey:"showPlayersPage",icon:bf,localConstKey:"players_tooltip"}],Ee=[{id:"resources-id",showPageKey:"showResourcesPage",icon:ff,localConstKey:"resources_tooltip"}],Ce=[{id:"dev-mode-id",showPageKey:"clickTerminal",icon:Cf,localConstKey:"dev_mode_tooltip"}],Ne=[{id:"debug-id",showPageKey:"clickDebug",icon:af,localConstKey:"debug_tooltip"}],ke=[{id:"settings-id",showPageKey:"showGodModeAdminPage",icon:pf,localConstKey:"settings_tooltip"}],Ge=["all","player","utility","troll","fav","custom"];const qe=fe=>he(fe.detail),Ye=fe=>he(fe.detail),rt=fe=>he(fe.detail),wt=fe=>he(fe.detail),gt=fe=>he(fe.detail),at=fe=>he(fe.detail),ot=fe=>te(fe),Ht=fe=>{t(6,_=fe.detail),ue()};return r.$$set=fe=>{"left"in fe&&t(0,a=fe.left),"top"in fe&&t(1,o=fe.top)},[a,o,d,p,m,h,_,g,v,b,w,y,x,S,M,T,R,F,O,l,c,u,f,ce,te,ue,be,q,he,W,xe,ye,Ee,Ce,Ne,ke,Ge,qe,Ye,rt,wt,gt,at,ot,Ht]}class em extends Xe{constructor(e){super(),We(this,e,$p,Qp,He,{left:0,top:1},null,[-1,-1,-1])}}function $o(r,e,t){const n=r.slice();return n[16]=e[t],n}function tm(r){let e,t=r[2],n=[];for(let i=0;i<t.length;i+=1)n[i]=el($o(r,t,i));return{c(){e=z("div");for(let i=0;i<n.length;i+=1)n[i].c();P(e,"id","chat-display"),P(e,"class","user-report-page-body")},m(i,s){B(i,e,s);for(let a=0;a<n.length;a+=1)n[a].m(e,null)},p(i,s){if(s&6){t=i[2];let a;for(a=0;a<t.length;a+=1){const o=$o(i,t,a);n[a]?n[a].p(o,s):(n[a]=el(o),n[a].c(),n[a].m(e,null))}for(;a<n.length;a+=1)n[a].d(1);n.length=t.length}},i:_e,o:_e,d(i){i&&U(e),Pt(n,i)}}}function nm(r){let e,t;return e=new dt({}),{c(){ee(e.$$.fragment)},m(n,i){Q(e,n,i),t=!0},p:_e,i(n){t||(D(e.$$.fragment,n),t=!0)},o(n){I(e.$$.fragment,n),t=!1},d(n){$(e,n)}}}function el(r){let e,t,n=r[16].message+"",i,s,a,o,l=r[1]===r[16].sender?"You":"Admin",c,u,f=r[16].formattedTime+"",d,p,m;return{c(){e=z("div"),t=z("div"),i=J(n),a=Z(),o=z("small"),c=J(l),u=J(", "),d=J(f),m=Z(),P(t,"class",s="txt-2sm user-report-chat-panel "+(r[1]===r[16].sender?"user-report-adjust-border-self-chat-info user-report-self-chat-panel-bg":"user-report-adjust-border-others-chat-info")),P(o,"class",p="txt-xs user-report-chat-info "+(r[1]===r[16].sender?"user-report-self-chat-info":"user-report-others-chat-info")),P(e,"class","user-report-each-chat")},m(h,_){B(h,e,_),E(e,t),E(t,i),E(e,a),E(e,o),E(o,c),E(o,u),E(o,d),E(e,m)},p(h,_){_&4&&n!==(n=h[16].message+"")&&pe(i,n),_&6&&s!==(s="txt-2sm user-report-chat-panel "+(h[1]===h[16].sender?"user-report-adjust-border-self-chat-info user-report-self-chat-panel-bg":"user-report-adjust-border-others-chat-info"))&&P(t,"class",s),_&6&&l!==(l=h[1]===h[16].sender?"You":"Admin")&&pe(c,l),_&4&&f!==(f=h[16].formattedTime+"")&&pe(d,f),_&6&&p!==(p="txt-xs user-report-chat-info "+(h[1]===h[16].sender?"user-report-self-chat-info":"user-report-others-chat-info"))&&P(o,"class",p)},d(h){h&&U(e)}}}function im(r){let e,t,n,i,s,a,o,l,c,u,f,d,p,m,h;const _=[nm,tm],g=[];function v(b,w){return b[0]?0:1}return i=v(r),s=g[i]=_[i](r),f=new zt({props:{icon:ef}}),{c(){e=z("div"),t=z("div"),t.textContent=`${r[7].reports_heading}`,n=Z(),s.c(),a=Z(),o=z("div"),l=z("textarea"),c=Z(),u=z("div"),ee(f.$$.fragment),P(t,"class","user-report-header"),P(l,"class","user-report-send-message-input txt-sm"),P(u,"class",d="user-report-send-msg-icon "+(r[4]?"user-report-send-msg-icon-disabled":"user-report-send-msg-icon-enabled")),P(o,"class","user-report-send-message-wrapper"),P(e,"class","user-report-base")},m(b,w){B(b,e,w),E(e,t),E(e,n),g[i].m(e,null),E(e,a),E(e,o),E(o,l),Nt(l,r[3]),E(o,c),E(o,u),Q(f,u,null),p=!0,m||(h=[ze(l,"input",r[11]),ze(l,"keydown",r[8]),ze(u,"click",r[9]),ze(o,"keypress",r[10])],m=!0)},p(b,[w]){let y=i;i=v(b),i===y?g[i].p(b,w):(De(),I(g[y],1,1,()=>{g[y]=null}),Re(),s=g[i],s?s.p(b,w):(s=g[i]=_[i](b),s.c()),D(s,1),s.m(e,a)),w&8&&Nt(l,b[3]),(!p||w&16&&d!==(d="user-report-send-msg-icon "+(b[4]?"user-report-send-msg-icon-disabled":"user-report-send-msg-icon-enabled")))&&P(u,"class",d)},i(b){p||(D(s),D(f.$$.fragment,b),p=!0)},o(b){I(s),I(f.$$.fragment,b),p=!1},d(b){b&&U(e),g[i].d(),$(f),m=!1,xt(h)}}}function rm(r,e,t){let n,i,s=!1,a="",o=[],{reportData:l}=_r;ft(r,l,b=>t(12,n=b));let c="",u=!0,{locales:f,data:d}=yt;ft(r,f,b=>t(13,i=b));let p=i;ct(async()=>{t(0,s=!0),t(2,o=n.chats),t(1,a=n.currentUser),m(),On.scrollToTop("chat-display",100),t(0,s=!1)});function m(){o.map(b=>{var w=new Date(b.time*1e3);let y=Intl.DateTimeFormat().resolvedOptions().timeZone,x=w.toLocaleString("en-US",{timeZone:y});return b.formattedTime=x,b})}function h(){t(4,u=c.trim()==="")}async function _(){if(!u){t(0,s=!0);const w=await Pe("sendReportMessage",{currentUser:a,newMessage:c});t(2,o=w.chats),m(),t(3,c=""),On.scrollToTop("chat-display",100),t(4,u=!0),t(0,s=!1)}}function g(b){On.canSendMessage(b,c)&&_()}function v(){c=this.value,t(3,c)}return[s,a,o,c,u,l,f,p,h,_,g,v]}class sm extends Xe{constructor(e){super(),We(this,e,rm,im,He,{})}}function am(r){let e,t,n,i,s;return i=new zt({props:{icon:uf}}),{c(){e=z("div"),t=z("div"),n=z("div"),ee(i.$$.fragment),P(n,"class","unread-report-header-close svelte-j2h0ts"),P(t,"class","unread-right svelte-j2h0ts")},m(a,o){B(a,e,o),E(e,t),E(t,n),Q(i,n,null),s=!0},p:_e,i(a){s||(D(i.$$.fragment,a),s=!0)},o(a){I(i.$$.fragment,a),s=!1},d(a){a&&U(e),$(i)}}}class om extends Xe{constructor(e){super(),We(this,e,null,am,He,{})}}/**
 * @license
 * Copyright 2010-2023 Three.js Authors
 * SPDX-License-Identifier: MIT
 */const ya="150",lm=0,tl=1,cm=2,Bc=1,um=2,ar=3,Zn=0,an=1,zn=2,Yn=0,Ni=1,nl=2,il=3,rl=4,fm=5,Ai=100,dm=101,hm=102,sl=103,al=104,pm=200,mm=201,_m=202,gm=203,Vc=204,Gc=205,bm=206,vm=207,ym=208,wm=209,Mm=210,xm=0,Sm=1,Cm=2,la=3,Tm=4,Em=5,Lm=6,Pm=7,Hc=0,Am=1,Dm=2,Un=0,Rm=1,km=2,Im=3,Nm=4,zm=5,Wc=300,Bi=301,Vi=302,ca=303,ua=304,ms=306,fa=1e3,_n=1001,da=1002,Yt=1003,ol=1004,Ts=1005,fn=1006,Fm=1007,br=1008,di=1009,Om=1010,Um=1011,Xc=1012,Bm=1013,li=1014,ci=1015,vr=1016,Vm=1017,Gm=1018,zi=1020,Hm=1021,gn=1023,Wm=1024,Xm=1025,ui=1026,Gi=1027,jm=1028,qm=1029,Ym=1030,Zm=1031,Km=1033,Es=33776,Ls=33777,Ps=33778,As=33779,ll=35840,cl=35841,ul=35842,fl=35843,Jm=36196,dl=37492,hl=37496,pl=37808,ml=37809,_l=37810,gl=37811,bl=37812,vl=37813,yl=37814,wl=37815,Ml=37816,xl=37817,Sl=37818,Cl=37819,Tl=37820,El=37821,Ds=36492,Qm=36283,Ll=36284,Pl=36285,Al=36286,hi=3e3,pt=3001,$m=3200,e_=3201,t_=0,n_=1,xn="srgb",yr="srgb-linear",jc="display-p3",Rs=7680,i_=519,Dl=35044,Rl="300 es",ha=1035;class Xi{addEventListener(e,t){this._listeners===void 0&&(this._listeners={});const n=this._listeners;n[e]===void 0&&(n[e]=[]),n[e].indexOf(t)===-1&&n[e].push(t)}hasEventListener(e,t){if(this._listeners===void 0)return!1;const n=this._listeners;return n[e]!==void 0&&n[e].indexOf(t)!==-1}removeEventListener(e,t){if(this._listeners===void 0)return;const i=this._listeners[e];if(i!==void 0){const s=i.indexOf(t);s!==-1&&i.splice(s,1)}}dispatchEvent(e){if(this._listeners===void 0)return;const n=this._listeners[e.type];if(n!==void 0){e.target=this;const i=n.slice(0);for(let s=0,a=i.length;s<a;s++)i[s].call(this,e);e.target=null}}}const Bt=["00","01","02","03","04","05","06","07","08","09","0a","0b","0c","0d","0e","0f","10","11","12","13","14","15","16","17","18","19","1a","1b","1c","1d","1e","1f","20","21","22","23","24","25","26","27","28","29","2a","2b","2c","2d","2e","2f","30","31","32","33","34","35","36","37","38","39","3a","3b","3c","3d","3e","3f","40","41","42","43","44","45","46","47","48","49","4a","4b","4c","4d","4e","4f","50","51","52","53","54","55","56","57","58","59","5a","5b","5c","5d","5e","5f","60","61","62","63","64","65","66","67","68","69","6a","6b","6c","6d","6e","6f","70","71","72","73","74","75","76","77","78","79","7a","7b","7c","7d","7e","7f","80","81","82","83","84","85","86","87","88","89","8a","8b","8c","8d","8e","8f","90","91","92","93","94","95","96","97","98","99","9a","9b","9c","9d","9e","9f","a0","a1","a2","a3","a4","a5","a6","a7","a8","a9","aa","ab","ac","ad","ae","af","b0","b1","b2","b3","b4","b5","b6","b7","b8","b9","ba","bb","bc","bd","be","bf","c0","c1","c2","c3","c4","c5","c6","c7","c8","c9","ca","cb","cc","cd","ce","cf","d0","d1","d2","d3","d4","d5","d6","d7","d8","d9","da","db","dc","dd","de","df","e0","e1","e2","e3","e4","e5","e6","e7","e8","e9","ea","eb","ec","ed","ee","ef","f0","f1","f2","f3","f4","f5","f6","f7","f8","f9","fa","fb","fc","fd","fe","ff"];let kl=1234567;const hr=Math.PI/180,fs=180/Math.PI;function ji(){const r=Math.random()*4294967295|0,e=Math.random()*4294967295|0,t=Math.random()*4294967295|0,n=Math.random()*4294967295|0;return(Bt[r&255]+Bt[r>>8&255]+Bt[r>>16&255]+Bt[r>>24&255]+"-"+Bt[e&255]+Bt[e>>8&255]+"-"+Bt[e>>16&15|64]+Bt[e>>24&255]+"-"+Bt[t&63|128]+Bt[t>>8&255]+"-"+Bt[t>>16&255]+Bt[t>>24&255]+Bt[n&255]+Bt[n>>8&255]+Bt[n>>16&255]+Bt[n>>24&255]).toLowerCase()}function $t(r,e,t){return Math.max(e,Math.min(t,r))}function wa(r,e){return(r%e+e)%e}function r_(r,e,t,n,i){return n+(r-e)*(i-n)/(t-e)}function s_(r,e,t){return r!==e?(t-r)/(e-r):0}function pr(r,e,t){return(1-t)*r+t*e}function a_(r,e,t,n){return pr(r,e,1-Math.exp(-t*n))}function o_(r,e=1){return e-Math.abs(wa(r,e*2)-e)}function l_(r,e,t){return r<=e?0:r>=t?1:(r=(r-e)/(t-e),r*r*(3-2*r))}function c_(r,e,t){return r<=e?0:r>=t?1:(r=(r-e)/(t-e),r*r*r*(r*(r*6-15)+10))}function u_(r,e){return r+Math.floor(Math.random()*(e-r+1))}function f_(r,e){return r+Math.random()*(e-r)}function d_(r){return r*(.5-Math.random())}function h_(r){r!==void 0&&(kl=r);let e=kl+=1831565813;return e=Math.imul(e^e>>>15,e|1),e^=e+Math.imul(e^e>>>7,e|61),((e^e>>>14)>>>0)/4294967296}function p_(r){return r*hr}function m_(r){return r*fs}function pa(r){return(r&r-1)===0&&r!==0}function __(r){return Math.pow(2,Math.ceil(Math.log(r)/Math.LN2))}function qc(r){return Math.pow(2,Math.floor(Math.log(r)/Math.LN2))}function g_(r,e,t,n,i){const s=Math.cos,a=Math.sin,o=s(t/2),l=a(t/2),c=s((e+n)/2),u=a((e+n)/2),f=s((e-n)/2),d=a((e-n)/2),p=s((n-e)/2),m=a((n-e)/2);switch(i){case"XYX":r.set(o*u,l*f,l*d,o*c);break;case"YZY":r.set(l*d,o*u,l*f,o*c);break;case"ZXZ":r.set(l*f,l*d,o*u,o*c);break;case"XZX":r.set(o*u,l*m,l*p,o*c);break;case"YXY":r.set(l*p,o*u,l*m,o*c);break;case"ZYZ":r.set(l*m,l*p,o*u,o*c);break;default:console.warn("THREE.MathUtils: .setQuaternionFromProperEuler() encountered an unknown order: "+i)}}function or(r,e){switch(e.constructor){case Float32Array:return r;case Uint16Array:return r/65535;case Uint8Array:return r/255;case Int16Array:return Math.max(r/32767,-1);case Int8Array:return Math.max(r/127,-1);default:throw new Error("Invalid component type.")}}function Jt(r,e){switch(e.constructor){case Float32Array:return r;case Uint16Array:return Math.round(r*65535);case Uint8Array:return Math.round(r*255);case Int16Array:return Math.round(r*32767);case Int8Array:return Math.round(r*127);default:throw new Error("Invalid component type.")}}const Ln={DEG2RAD:hr,RAD2DEG:fs,generateUUID:ji,clamp:$t,euclideanModulo:wa,mapLinear:r_,inverseLerp:s_,lerp:pr,damp:a_,pingpong:o_,smoothstep:l_,smootherstep:c_,randInt:u_,randFloat:f_,randFloatSpread:d_,seededRandom:h_,degToRad:p_,radToDeg:m_,isPowerOfTwo:pa,ceilPowerOfTwo:__,floorPowerOfTwo:qc,setQuaternionFromProperEuler:g_,normalize:Jt,denormalize:or};class lt{constructor(e=0,t=0){lt.prototype.isVector2=!0,this.x=e,this.y=t}get width(){return this.x}set width(e){this.x=e}get height(){return this.y}set height(e){this.y=e}set(e,t){return this.x=e,this.y=t,this}setScalar(e){return this.x=e,this.y=e,this}setX(e){return this.x=e,this}setY(e){return this.y=e,this}setComponent(e,t){switch(e){case 0:this.x=t;break;case 1:this.y=t;break;default:throw new Error("index is out of range: "+e)}return this}getComponent(e){switch(e){case 0:return this.x;case 1:return this.y;default:throw new Error("index is out of range: "+e)}}clone(){return new this.constructor(this.x,this.y)}copy(e){return this.x=e.x,this.y=e.y,this}add(e){return this.x+=e.x,this.y+=e.y,this}addScalar(e){return this.x+=e,this.y+=e,this}addVectors(e,t){return this.x=e.x+t.x,this.y=e.y+t.y,this}addScaledVector(e,t){return this.x+=e.x*t,this.y+=e.y*t,this}sub(e){return this.x-=e.x,this.y-=e.y,this}subScalar(e){return this.x-=e,this.y-=e,this}subVectors(e,t){return this.x=e.x-t.x,this.y=e.y-t.y,this}multiply(e){return this.x*=e.x,this.y*=e.y,this}multiplyScalar(e){return this.x*=e,this.y*=e,this}divide(e){return this.x/=e.x,this.y/=e.y,this}divideScalar(e){return this.multiplyScalar(1/e)}applyMatrix3(e){const t=this.x,n=this.y,i=e.elements;return this.x=i[0]*t+i[3]*n+i[6],this.y=i[1]*t+i[4]*n+i[7],this}min(e){return this.x=Math.min(this.x,e.x),this.y=Math.min(this.y,e.y),this}max(e){return this.x=Math.max(this.x,e.x),this.y=Math.max(this.y,e.y),this}clamp(e,t){return this.x=Math.max(e.x,Math.min(t.x,this.x)),this.y=Math.max(e.y,Math.min(t.y,this.y)),this}clampScalar(e,t){return this.x=Math.max(e,Math.min(t,this.x)),this.y=Math.max(e,Math.min(t,this.y)),this}clampLength(e,t){const n=this.length();return this.divideScalar(n||1).multiplyScalar(Math.max(e,Math.min(t,n)))}floor(){return this.x=Math.floor(this.x),this.y=Math.floor(this.y),this}ceil(){return this.x=Math.ceil(this.x),this.y=Math.ceil(this.y),this}round(){return this.x=Math.round(this.x),this.y=Math.round(this.y),this}roundToZero(){return this.x=this.x<0?Math.ceil(this.x):Math.floor(this.x),this.y=this.y<0?Math.ceil(this.y):Math.floor(this.y),this}negate(){return this.x=-this.x,this.y=-this.y,this}dot(e){return this.x*e.x+this.y*e.y}cross(e){return this.x*e.y-this.y*e.x}lengthSq(){return this.x*this.x+this.y*this.y}length(){return Math.sqrt(this.x*this.x+this.y*this.y)}manhattanLength(){return Math.abs(this.x)+Math.abs(this.y)}normalize(){return this.divideScalar(this.length()||1)}angle(){return Math.atan2(-this.y,-this.x)+Math.PI}distanceTo(e){return Math.sqrt(this.distanceToSquared(e))}distanceToSquared(e){const t=this.x-e.x,n=this.y-e.y;return t*t+n*n}manhattanDistanceTo(e){return Math.abs(this.x-e.x)+Math.abs(this.y-e.y)}setLength(e){return this.normalize().multiplyScalar(e)}lerp(e,t){return this.x+=(e.x-this.x)*t,this.y+=(e.y-this.y)*t,this}lerpVectors(e,t,n){return this.x=e.x+(t.x-e.x)*n,this.y=e.y+(t.y-e.y)*n,this}equals(e){return e.x===this.x&&e.y===this.y}fromArray(e,t=0){return this.x=e[t],this.y=e[t+1],this}toArray(e=[],t=0){return e[t]=this.x,e[t+1]=this.y,e}fromBufferAttribute(e,t){return this.x=e.getX(t),this.y=e.getY(t),this}rotateAround(e,t){const n=Math.cos(t),i=Math.sin(t),s=this.x-e.x,a=this.y-e.y;return this.x=s*n-a*i+e.x,this.y=s*i+a*n+e.y,this}random(){return this.x=Math.random(),this.y=Math.random(),this}*[Symbol.iterator](){yield this.x,yield this.y}}class Kt{constructor(){Kt.prototype.isMatrix3=!0,this.elements=[1,0,0,0,1,0,0,0,1]}set(e,t,n,i,s,a,o,l,c){const u=this.elements;return u[0]=e,u[1]=i,u[2]=o,u[3]=t,u[4]=s,u[5]=l,u[6]=n,u[7]=a,u[8]=c,this}identity(){return this.set(1,0,0,0,1,0,0,0,1),this}copy(e){const t=this.elements,n=e.elements;return t[0]=n[0],t[1]=n[1],t[2]=n[2],t[3]=n[3],t[4]=n[4],t[5]=n[5],t[6]=n[6],t[7]=n[7],t[8]=n[8],this}extractBasis(e,t,n){return e.setFromMatrix3Column(this,0),t.setFromMatrix3Column(this,1),n.setFromMatrix3Column(this,2),this}setFromMatrix4(e){const t=e.elements;return this.set(t[0],t[4],t[8],t[1],t[5],t[9],t[2],t[6],t[10]),this}multiply(e){return this.multiplyMatrices(this,e)}premultiply(e){return this.multiplyMatrices(e,this)}multiplyMatrices(e,t){const n=e.elements,i=t.elements,s=this.elements,a=n[0],o=n[3],l=n[6],c=n[1],u=n[4],f=n[7],d=n[2],p=n[5],m=n[8],h=i[0],_=i[3],g=i[6],v=i[1],b=i[4],w=i[7],y=i[2],x=i[5],S=i[8];return s[0]=a*h+o*v+l*y,s[3]=a*_+o*b+l*x,s[6]=a*g+o*w+l*S,s[1]=c*h+u*v+f*y,s[4]=c*_+u*b+f*x,s[7]=c*g+u*w+f*S,s[2]=d*h+p*v+m*y,s[5]=d*_+p*b+m*x,s[8]=d*g+p*w+m*S,this}multiplyScalar(e){const t=this.elements;return t[0]*=e,t[3]*=e,t[6]*=e,t[1]*=e,t[4]*=e,t[7]*=e,t[2]*=e,t[5]*=e,t[8]*=e,this}determinant(){const e=this.elements,t=e[0],n=e[1],i=e[2],s=e[3],a=e[4],o=e[5],l=e[6],c=e[7],u=e[8];return t*a*u-t*o*c-n*s*u+n*o*l+i*s*c-i*a*l}invert(){const e=this.elements,t=e[0],n=e[1],i=e[2],s=e[3],a=e[4],o=e[5],l=e[6],c=e[7],u=e[8],f=u*a-o*c,d=o*l-u*s,p=c*s-a*l,m=t*f+n*d+i*p;if(m===0)return this.set(0,0,0,0,0,0,0,0,0);const h=1/m;return e[0]=f*h,e[1]=(i*c-u*n)*h,e[2]=(o*n-i*a)*h,e[3]=d*h,e[4]=(u*t-i*l)*h,e[5]=(i*s-o*t)*h,e[6]=p*h,e[7]=(n*l-c*t)*h,e[8]=(a*t-n*s)*h,this}transpose(){let e;const t=this.elements;return e=t[1],t[1]=t[3],t[3]=e,e=t[2],t[2]=t[6],t[6]=e,e=t[5],t[5]=t[7],t[7]=e,this}getNormalMatrix(e){return this.setFromMatrix4(e).invert().transpose()}transposeIntoArray(e){const t=this.elements;return e[0]=t[0],e[1]=t[3],e[2]=t[6],e[3]=t[1],e[4]=t[4],e[5]=t[7],e[6]=t[2],e[7]=t[5],e[8]=t[8],this}setUvTransform(e,t,n,i,s,a,o){const l=Math.cos(s),c=Math.sin(s);return this.set(n*l,n*c,-n*(l*a+c*o)+a+e,-i*c,i*l,-i*(-c*a+l*o)+o+t,0,0,1),this}scale(e,t){return this.premultiply(ks.makeScale(e,t)),this}rotate(e){return this.premultiply(ks.makeRotation(-e)),this}translate(e,t){return this.premultiply(ks.makeTranslation(e,t)),this}makeTranslation(e,t){return this.set(1,0,e,0,1,t,0,0,1),this}makeRotation(e){const t=Math.cos(e),n=Math.sin(e);return this.set(t,-n,0,n,t,0,0,0,1),this}makeScale(e,t){return this.set(e,0,0,0,t,0,0,0,1),this}equals(e){const t=this.elements,n=e.elements;for(let i=0;i<9;i++)if(t[i]!==n[i])return!1;return!0}fromArray(e,t=0){for(let n=0;n<9;n++)this.elements[n]=e[n+t];return this}toArray(e=[],t=0){const n=this.elements;return e[t]=n[0],e[t+1]=n[1],e[t+2]=n[2],e[t+3]=n[3],e[t+4]=n[4],e[t+5]=n[5],e[t+6]=n[6],e[t+7]=n[7],e[t+8]=n[8],e}clone(){return new this.constructor().fromArray(this.elements)}}const ks=new Kt;function Yc(r){for(let e=r.length-1;e>=0;--e)if(r[e]>=65535)return!0;return!1}function ds(r){return document.createElementNS("http://www.w3.org/1999/xhtml",r)}class Zt{constructor(e=0,t=0,n=0,i=1){this.isQuaternion=!0,this._x=e,this._y=t,this._z=n,this._w=i}static slerpFlat(e,t,n,i,s,a,o){let l=n[i+0],c=n[i+1],u=n[i+2],f=n[i+3];const d=s[a+0],p=s[a+1],m=s[a+2],h=s[a+3];if(o===0){e[t+0]=l,e[t+1]=c,e[t+2]=u,e[t+3]=f;return}if(o===1){e[t+0]=d,e[t+1]=p,e[t+2]=m,e[t+3]=h;return}if(f!==h||l!==d||c!==p||u!==m){let _=1-o;const g=l*d+c*p+u*m+f*h,v=g>=0?1:-1,b=1-g*g;if(b>Number.EPSILON){const y=Math.sqrt(b),x=Math.atan2(y,g*v);_=Math.sin(_*x)/y,o=Math.sin(o*x)/y}const w=o*v;if(l=l*_+d*w,c=c*_+p*w,u=u*_+m*w,f=f*_+h*w,_===1-o){const y=1/Math.sqrt(l*l+c*c+u*u+f*f);l*=y,c*=y,u*=y,f*=y}}e[t]=l,e[t+1]=c,e[t+2]=u,e[t+3]=f}static multiplyQuaternionsFlat(e,t,n,i,s,a){const o=n[i],l=n[i+1],c=n[i+2],u=n[i+3],f=s[a],d=s[a+1],p=s[a+2],m=s[a+3];return e[t]=o*m+u*f+l*p-c*d,e[t+1]=l*m+u*d+c*f-o*p,e[t+2]=c*m+u*p+o*d-l*f,e[t+3]=u*m-o*f-l*d-c*p,e}get x(){return this._x}set x(e){this._x=e,this._onChangeCallback()}get y(){return this._y}set y(e){this._y=e,this._onChangeCallback()}get z(){return this._z}set z(e){this._z=e,this._onChangeCallback()}get w(){return this._w}set w(e){this._w=e,this._onChangeCallback()}set(e,t,n,i){return this._x=e,this._y=t,this._z=n,this._w=i,this._onChangeCallback(),this}clone(){return new this.constructor(this._x,this._y,this._z,this._w)}copy(e){return this._x=e.x,this._y=e.y,this._z=e.z,this._w=e.w,this._onChangeCallback(),this}setFromEuler(e,t){const n=e._x,i=e._y,s=e._z,a=e._order,o=Math.cos,l=Math.sin,c=o(n/2),u=o(i/2),f=o(s/2),d=l(n/2),p=l(i/2),m=l(s/2);switch(a){case"XYZ":this._x=d*u*f+c*p*m,this._y=c*p*f-d*u*m,this._z=c*u*m+d*p*f,this._w=c*u*f-d*p*m;break;case"YXZ":this._x=d*u*f+c*p*m,this._y=c*p*f-d*u*m,this._z=c*u*m-d*p*f,this._w=c*u*f+d*p*m;break;case"ZXY":this._x=d*u*f-c*p*m,this._y=c*p*f+d*u*m,this._z=c*u*m+d*p*f,this._w=c*u*f-d*p*m;break;case"ZYX":this._x=d*u*f-c*p*m,this._y=c*p*f+d*u*m,this._z=c*u*m-d*p*f,this._w=c*u*f+d*p*m;break;case"YZX":this._x=d*u*f+c*p*m,this._y=c*p*f+d*u*m,this._z=c*u*m-d*p*f,this._w=c*u*f-d*p*m;break;case"XZY":this._x=d*u*f-c*p*m,this._y=c*p*f-d*u*m,this._z=c*u*m+d*p*f,this._w=c*u*f+d*p*m;break;default:console.warn("THREE.Quaternion: .setFromEuler() encountered an unknown order: "+a)}return t!==!1&&this._onChangeCallback(),this}setFromAxisAngle(e,t){const n=t/2,i=Math.sin(n);return this._x=e.x*i,this._y=e.y*i,this._z=e.z*i,this._w=Math.cos(n),this._onChangeCallback(),this}setFromRotationMatrix(e){const t=e.elements,n=t[0],i=t[4],s=t[8],a=t[1],o=t[5],l=t[9],c=t[2],u=t[6],f=t[10],d=n+o+f;if(d>0){const p=.5/Math.sqrt(d+1);this._w=.25/p,this._x=(u-l)*p,this._y=(s-c)*p,this._z=(a-i)*p}else if(n>o&&n>f){const p=2*Math.sqrt(1+n-o-f);this._w=(u-l)/p,this._x=.25*p,this._y=(i+a)/p,this._z=(s+c)/p}else if(o>f){const p=2*Math.sqrt(1+o-n-f);this._w=(s-c)/p,this._x=(i+a)/p,this._y=.25*p,this._z=(l+u)/p}else{const p=2*Math.sqrt(1+f-n-o);this._w=(a-i)/p,this._x=(s+c)/p,this._y=(l+u)/p,this._z=.25*p}return this._onChangeCallback(),this}setFromUnitVectors(e,t){let n=e.dot(t)+1;return n<Number.EPSILON?(n=0,Math.abs(e.x)>Math.abs(e.z)?(this._x=-e.y,this._y=e.x,this._z=0,this._w=n):(this._x=0,this._y=-e.z,this._z=e.y,this._w=n)):(this._x=e.y*t.z-e.z*t.y,this._y=e.z*t.x-e.x*t.z,this._z=e.x*t.y-e.y*t.x,this._w=n),this.normalize()}angleTo(e){return 2*Math.acos(Math.abs($t(this.dot(e),-1,1)))}rotateTowards(e,t){const n=this.angleTo(e);if(n===0)return this;const i=Math.min(1,t/n);return this.slerp(e,i),this}identity(){return this.set(0,0,0,1)}invert(){return this.conjugate()}conjugate(){return this._x*=-1,this._y*=-1,this._z*=-1,this._onChangeCallback(),this}dot(e){return this._x*e._x+this._y*e._y+this._z*e._z+this._w*e._w}lengthSq(){return this._x*this._x+this._y*this._y+this._z*this._z+this._w*this._w}length(){return Math.sqrt(this._x*this._x+this._y*this._y+this._z*this._z+this._w*this._w)}normalize(){let e=this.length();return e===0?(this._x=0,this._y=0,this._z=0,this._w=1):(e=1/e,this._x=this._x*e,this._y=this._y*e,this._z=this._z*e,this._w=this._w*e),this._onChangeCallback(),this}multiply(e){return this.multiplyQuaternions(this,e)}premultiply(e){return this.multiplyQuaternions(e,this)}multiplyQuaternions(e,t){const n=e._x,i=e._y,s=e._z,a=e._w,o=t._x,l=t._y,c=t._z,u=t._w;return this._x=n*u+a*o+i*c-s*l,this._y=i*u+a*l+s*o-n*c,this._z=s*u+a*c+n*l-i*o,this._w=a*u-n*o-i*l-s*c,this._onChangeCallback(),this}slerp(e,t){if(t===0)return this;if(t===1)return this.copy(e);const n=this._x,i=this._y,s=this._z,a=this._w;let o=a*e._w+n*e._x+i*e._y+s*e._z;if(o<0?(this._w=-e._w,this._x=-e._x,this._y=-e._y,this._z=-e._z,o=-o):this.copy(e),o>=1)return this._w=a,this._x=n,this._y=i,this._z=s,this;const l=1-o*o;if(l<=Number.EPSILON){const p=1-t;return this._w=p*a+t*this._w,this._x=p*n+t*this._x,this._y=p*i+t*this._y,this._z=p*s+t*this._z,this.normalize(),this._onChangeCallback(),this}const c=Math.sqrt(l),u=Math.atan2(c,o),f=Math.sin((1-t)*u)/c,d=Math.sin(t*u)/c;return this._w=a*f+this._w*d,this._x=n*f+this._x*d,this._y=i*f+this._y*d,this._z=s*f+this._z*d,this._onChangeCallback(),this}slerpQuaternions(e,t,n){return this.copy(e).slerp(t,n)}random(){const e=Math.random(),t=Math.sqrt(1-e),n=Math.sqrt(e),i=2*Math.PI*Math.random(),s=2*Math.PI*Math.random();return this.set(t*Math.cos(i),n*Math.sin(s),n*Math.cos(s),t*Math.sin(i))}equals(e){return e._x===this._x&&e._y===this._y&&e._z===this._z&&e._w===this._w}fromArray(e,t=0){return this._x=e[t],this._y=e[t+1],this._z=e[t+2],this._w=e[t+3],this._onChangeCallback(),this}toArray(e=[],t=0){return e[t]=this._x,e[t+1]=this._y,e[t+2]=this._z,e[t+3]=this._w,e}fromBufferAttribute(e,t){return this._x=e.getX(t),this._y=e.getY(t),this._z=e.getZ(t),this._w=e.getW(t),this}_onChange(e){return this._onChangeCallback=e,this}_onChangeCallback(){}*[Symbol.iterator](){yield this._x,yield this._y,yield this._z,yield this._w}}class V{constructor(e=0,t=0,n=0){V.prototype.isVector3=!0,this.x=e,this.y=t,this.z=n}set(e,t,n){return n===void 0&&(n=this.z),this.x=e,this.y=t,this.z=n,this}setScalar(e){return this.x=e,this.y=e,this.z=e,this}setX(e){return this.x=e,this}setY(e){return this.y=e,this}setZ(e){return this.z=e,this}setComponent(e,t){switch(e){case 0:this.x=t;break;case 1:this.y=t;break;case 2:this.z=t;break;default:throw new Error("index is out of range: "+e)}return this}getComponent(e){switch(e){case 0:return this.x;case 1:return this.y;case 2:return this.z;default:throw new Error("index is out of range: "+e)}}clone(){return new this.constructor(this.x,this.y,this.z)}copy(e){return this.x=e.x,this.y=e.y,this.z=e.z,this}add(e){return this.x+=e.x,this.y+=e.y,this.z+=e.z,this}addScalar(e){return this.x+=e,this.y+=e,this.z+=e,this}addVectors(e,t){return this.x=e.x+t.x,this.y=e.y+t.y,this.z=e.z+t.z,this}addScaledVector(e,t){return this.x+=e.x*t,this.y+=e.y*t,this.z+=e.z*t,this}sub(e){return this.x-=e.x,this.y-=e.y,this.z-=e.z,this}subScalar(e){return this.x-=e,this.y-=e,this.z-=e,this}subVectors(e,t){return this.x=e.x-t.x,this.y=e.y-t.y,this.z=e.z-t.z,this}multiply(e){return this.x*=e.x,this.y*=e.y,this.z*=e.z,this}multiplyScalar(e){return this.x*=e,this.y*=e,this.z*=e,this}multiplyVectors(e,t){return this.x=e.x*t.x,this.y=e.y*t.y,this.z=e.z*t.z,this}applyEuler(e){return this.applyQuaternion(Il.setFromEuler(e))}applyAxisAngle(e,t){return this.applyQuaternion(Il.setFromAxisAngle(e,t))}applyMatrix3(e){const t=this.x,n=this.y,i=this.z,s=e.elements;return this.x=s[0]*t+s[3]*n+s[6]*i,this.y=s[1]*t+s[4]*n+s[7]*i,this.z=s[2]*t+s[5]*n+s[8]*i,this}applyNormalMatrix(e){return this.applyMatrix3(e).normalize()}applyMatrix4(e){const t=this.x,n=this.y,i=this.z,s=e.elements,a=1/(s[3]*t+s[7]*n+s[11]*i+s[15]);return this.x=(s[0]*t+s[4]*n+s[8]*i+s[12])*a,this.y=(s[1]*t+s[5]*n+s[9]*i+s[13])*a,this.z=(s[2]*t+s[6]*n+s[10]*i+s[14])*a,this}applyQuaternion(e){const t=this.x,n=this.y,i=this.z,s=e.x,a=e.y,o=e.z,l=e.w,c=l*t+a*i-o*n,u=l*n+o*t-s*i,f=l*i+s*n-a*t,d=-s*t-a*n-o*i;return this.x=c*l+d*-s+u*-o-f*-a,this.y=u*l+d*-a+f*-s-c*-o,this.z=f*l+d*-o+c*-a-u*-s,this}project(e){return this.applyMatrix4(e.matrixWorldInverse).applyMatrix4(e.projectionMatrix)}unproject(e){return this.applyMatrix4(e.projectionMatrixInverse).applyMatrix4(e.matrixWorld)}transformDirection(e){const t=this.x,n=this.y,i=this.z,s=e.elements;return this.x=s[0]*t+s[4]*n+s[8]*i,this.y=s[1]*t+s[5]*n+s[9]*i,this.z=s[2]*t+s[6]*n+s[10]*i,this.normalize()}divide(e){return this.x/=e.x,this.y/=e.y,this.z/=e.z,this}divideScalar(e){return this.multiplyScalar(1/e)}min(e){return this.x=Math.min(this.x,e.x),this.y=Math.min(this.y,e.y),this.z=Math.min(this.z,e.z),this}max(e){return this.x=Math.max(this.x,e.x),this.y=Math.max(this.y,e.y),this.z=Math.max(this.z,e.z),this}clamp(e,t){return this.x=Math.max(e.x,Math.min(t.x,this.x)),this.y=Math.max(e.y,Math.min(t.y,this.y)),this.z=Math.max(e.z,Math.min(t.z,this.z)),this}clampScalar(e,t){return this.x=Math.max(e,Math.min(t,this.x)),this.y=Math.max(e,Math.min(t,this.y)),this.z=Math.max(e,Math.min(t,this.z)),this}clampLength(e,t){const n=this.length();return this.divideScalar(n||1).multiplyScalar(Math.max(e,Math.min(t,n)))}floor(){return this.x=Math.floor(this.x),this.y=Math.floor(this.y),this.z=Math.floor(this.z),this}ceil(){return this.x=Math.ceil(this.x),this.y=Math.ceil(this.y),this.z=Math.ceil(this.z),this}round(){return this.x=Math.round(this.x),this.y=Math.round(this.y),this.z=Math.round(this.z),this}roundToZero(){return this.x=this.x<0?Math.ceil(this.x):Math.floor(this.x),this.y=this.y<0?Math.ceil(this.y):Math.floor(this.y),this.z=this.z<0?Math.ceil(this.z):Math.floor(this.z),this}negate(){return this.x=-this.x,this.y=-this.y,this.z=-this.z,this}dot(e){return this.x*e.x+this.y*e.y+this.z*e.z}lengthSq(){return this.x*this.x+this.y*this.y+this.z*this.z}length(){return Math.sqrt(this.x*this.x+this.y*this.y+this.z*this.z)}manhattanLength(){return Math.abs(this.x)+Math.abs(this.y)+Math.abs(this.z)}normalize(){return this.divideScalar(this.length()||1)}setLength(e){return this.normalize().multiplyScalar(e)}lerp(e,t){return this.x+=(e.x-this.x)*t,this.y+=(e.y-this.y)*t,this.z+=(e.z-this.z)*t,this}lerpVectors(e,t,n){return this.x=e.x+(t.x-e.x)*n,this.y=e.y+(t.y-e.y)*n,this.z=e.z+(t.z-e.z)*n,this}cross(e){return this.crossVectors(this,e)}crossVectors(e,t){const n=e.x,i=e.y,s=e.z,a=t.x,o=t.y,l=t.z;return this.x=i*l-s*o,this.y=s*a-n*l,this.z=n*o-i*a,this}projectOnVector(e){const t=e.lengthSq();if(t===0)return this.set(0,0,0);const n=e.dot(this)/t;return this.copy(e).multiplyScalar(n)}projectOnPlane(e){return Is.copy(this).projectOnVector(e),this.sub(Is)}reflect(e){return this.sub(Is.copy(e).multiplyScalar(2*this.dot(e)))}angleTo(e){const t=Math.sqrt(this.lengthSq()*e.lengthSq());if(t===0)return Math.PI/2;const n=this.dot(e)/t;return Math.acos($t(n,-1,1))}distanceTo(e){return Math.sqrt(this.distanceToSquared(e))}distanceToSquared(e){const t=this.x-e.x,n=this.y-e.y,i=this.z-e.z;return t*t+n*n+i*i}manhattanDistanceTo(e){return Math.abs(this.x-e.x)+Math.abs(this.y-e.y)+Math.abs(this.z-e.z)}setFromSpherical(e){return this.setFromSphericalCoords(e.radius,e.phi,e.theta)}setFromSphericalCoords(e,t,n){const i=Math.sin(t)*e;return this.x=i*Math.sin(n),this.y=Math.cos(t)*e,this.z=i*Math.cos(n),this}setFromCylindrical(e){return this.setFromCylindricalCoords(e.radius,e.theta,e.y)}setFromCylindricalCoords(e,t,n){return this.x=e*Math.sin(t),this.y=n,this.z=e*Math.cos(t),this}setFromMatrixPosition(e){const t=e.elements;return this.x=t[12],this.y=t[13],this.z=t[14],this}setFromMatrixScale(e){const t=this.setFromMatrixColumn(e,0).length(),n=this.setFromMatrixColumn(e,1).length(),i=this.setFromMatrixColumn(e,2).length();return this.x=t,this.y=n,this.z=i,this}setFromMatrixColumn(e,t){return this.fromArray(e.elements,t*4)}setFromMatrix3Column(e,t){return this.fromArray(e.elements,t*3)}setFromEuler(e){return this.x=e._x,this.y=e._y,this.z=e._z,this}equals(e){return e.x===this.x&&e.y===this.y&&e.z===this.z}fromArray(e,t=0){return this.x=e[t],this.y=e[t+1],this.z=e[t+2],this}toArray(e=[],t=0){return e[t]=this.x,e[t+1]=this.y,e[t+2]=this.z,e}fromBufferAttribute(e,t){return this.x=e.getX(t),this.y=e.getY(t),this.z=e.getZ(t),this}random(){return this.x=Math.random(),this.y=Math.random(),this.z=Math.random(),this}randomDirection(){const e=(Math.random()-.5)*2,t=Math.random()*Math.PI*2,n=Math.sqrt(1-e**2);return this.x=n*Math.cos(t),this.y=n*Math.sin(t),this.z=e,this}*[Symbol.iterator](){yield this.x,yield this.y,yield this.z}}const Is=new V,Il=new Zt;function Fi(r){return r<.04045?r*.0773993808:Math.pow(r*.9478672986+.0521327014,2.4)}function Ns(r){return r<.0031308?r*12.92:1.055*Math.pow(r,.41666)-.055}const b_=new Kt().fromArray([.8224621,.0331941,.0170827,.177538,.9668058,.0723974,-1e-7,1e-7,.9105199]),v_=new Kt().fromArray([1.2249401,-.0420569,-.0196376,-.2249404,1.0420571,-.0786361,1e-7,0,1.0982735]),qn=new V;function y_(r){return r.convertSRGBToLinear(),qn.set(r.r,r.g,r.b).applyMatrix3(v_),r.setRGB(qn.x,qn.y,qn.z)}function w_(r){return qn.set(r.r,r.g,r.b).applyMatrix3(b_),r.setRGB(qn.x,qn.y,qn.z).convertLinearToSRGB()}const M_={[yr]:r=>r,[xn]:r=>r.convertSRGBToLinear(),[jc]:y_},x_={[yr]:r=>r,[xn]:r=>r.convertLinearToSRGB(),[jc]:w_},jt={enabled:!1,get legacyMode(){return console.warn("THREE.ColorManagement: .legacyMode=false renamed to .enabled=true in r150."),!this.enabled},set legacyMode(r){console.warn("THREE.ColorManagement: .legacyMode=false renamed to .enabled=true in r150."),this.enabled=!r},get workingColorSpace(){return yr},set workingColorSpace(r){console.warn("THREE.ColorManagement: .workingColorSpace is readonly.")},convert:function(r,e,t){if(this.enabled===!1||e===t||!e||!t)return r;const n=M_[e],i=x_[t];if(n===void 0||i===void 0)throw new Error(`Unsupported color space conversion, "${e}" to "${t}".`);return i(n(r))},fromWorkingColorSpace:function(r,e){return this.convert(r,this.workingColorSpace,e)},toWorkingColorSpace:function(r,e){return this.convert(r,e,this.workingColorSpace)}};let gi;class Zc{static getDataURL(e){if(/^data:/i.test(e.src)||typeof HTMLCanvasElement>"u")return e.src;let t;if(e instanceof HTMLCanvasElement)t=e;else{gi===void 0&&(gi=ds("canvas")),gi.width=e.width,gi.height=e.height;const n=gi.getContext("2d");e instanceof ImageData?n.putImageData(e,0,0):n.drawImage(e,0,0,e.width,e.height),t=gi}return t.width>2048||t.height>2048?(console.warn("THREE.ImageUtils.getDataURL: Image converted to jpg for performance reasons",e),t.toDataURL("image/jpeg",.6)):t.toDataURL("image/png")}static sRGBToLinear(e){if(typeof HTMLImageElement<"u"&&e instanceof HTMLImageElement||typeof HTMLCanvasElement<"u"&&e instanceof HTMLCanvasElement||typeof ImageBitmap<"u"&&e instanceof ImageBitmap){const t=ds("canvas");t.width=e.width,t.height=e.height;const n=t.getContext("2d");n.drawImage(e,0,0,e.width,e.height);const i=n.getImageData(0,0,e.width,e.height),s=i.data;for(let a=0;a<s.length;a++)s[a]=Fi(s[a]/255)*255;return n.putImageData(i,0,0),t}else if(e.data){const t=e.data.slice(0);for(let n=0;n<t.length;n++)t instanceof Uint8Array||t instanceof Uint8ClampedArray?t[n]=Math.floor(Fi(t[n]/255)*255):t[n]=Fi(t[n]);return{data:t,width:e.width,height:e.height}}else return console.warn("THREE.ImageUtils.sRGBToLinear(): Unsupported image type. No color space conversion applied."),e}}class Kc{constructor(e=null){this.isSource=!0,this.uuid=ji(),this.data=e,this.version=0}set needsUpdate(e){e===!0&&this.version++}toJSON(e){const t=e===void 0||typeof e=="string";if(!t&&e.images[this.uuid]!==void 0)return e.images[this.uuid];const n={uuid:this.uuid,url:""},i=this.data;if(i!==null){let s;if(Array.isArray(i)){s=[];for(let a=0,o=i.length;a<o;a++)i[a].isDataTexture?s.push(zs(i[a].image)):s.push(zs(i[a]))}else s=zs(i);n.url=s}return t||(e.images[this.uuid]=n),n}}function zs(r){return typeof HTMLImageElement<"u"&&r instanceof HTMLImageElement||typeof HTMLCanvasElement<"u"&&r instanceof HTMLCanvasElement||typeof ImageBitmap<"u"&&r instanceof ImageBitmap?Zc.getDataURL(r):r.data?{data:Array.from(r.data),width:r.width,height:r.height,type:r.data.constructor.name}:(console.warn("THREE.Texture: Unable to serialize Texture."),{})}let S_=0;class on extends Xi{constructor(e=on.DEFAULT_IMAGE,t=on.DEFAULT_MAPPING,n=_n,i=_n,s=fn,a=br,o=gn,l=di,c=on.DEFAULT_ANISOTROPY,u=hi){super(),this.isTexture=!0,Object.defineProperty(this,"id",{value:S_++}),this.uuid=ji(),this.name="",this.source=new Kc(e),this.mipmaps=[],this.mapping=t,this.wrapS=n,this.wrapT=i,this.magFilter=s,this.minFilter=a,this.anisotropy=c,this.format=o,this.internalFormat=null,this.type=l,this.offset=new lt(0,0),this.repeat=new lt(1,1),this.center=new lt(0,0),this.rotation=0,this.matrixAutoUpdate=!0,this.matrix=new Kt,this.generateMipmaps=!0,this.premultiplyAlpha=!1,this.flipY=!0,this.unpackAlignment=4,this.encoding=u,this.userData={},this.version=0,this.onUpdate=null,this.isRenderTargetTexture=!1,this.needsPMREMUpdate=!1}get image(){return this.source.data}set image(e=null){this.source.data=e}updateMatrix(){this.matrix.setUvTransform(this.offset.x,this.offset.y,this.repeat.x,this.repeat.y,this.rotation,this.center.x,this.center.y)}clone(){return new this.constructor().copy(this)}copy(e){return this.name=e.name,this.source=e.source,this.mipmaps=e.mipmaps.slice(0),this.mapping=e.mapping,this.wrapS=e.wrapS,this.wrapT=e.wrapT,this.magFilter=e.magFilter,this.minFilter=e.minFilter,this.anisotropy=e.anisotropy,this.format=e.format,this.internalFormat=e.internalFormat,this.type=e.type,this.offset.copy(e.offset),this.repeat.copy(e.repeat),this.center.copy(e.center),this.rotation=e.rotation,this.matrixAutoUpdate=e.matrixAutoUpdate,this.matrix.copy(e.matrix),this.generateMipmaps=e.generateMipmaps,this.premultiplyAlpha=e.premultiplyAlpha,this.flipY=e.flipY,this.unpackAlignment=e.unpackAlignment,this.encoding=e.encoding,this.userData=JSON.parse(JSON.stringify(e.userData)),this.needsUpdate=!0,this}toJSON(e){const t=e===void 0||typeof e=="string";if(!t&&e.textures[this.uuid]!==void 0)return e.textures[this.uuid];const n={metadata:{version:4.5,type:"Texture",generator:"Texture.toJSON"},uuid:this.uuid,name:this.name,image:this.source.toJSON(e).uuid,mapping:this.mapping,repeat:[this.repeat.x,this.repeat.y],offset:[this.offset.x,this.offset.y],center:[this.center.x,this.center.y],rotation:this.rotation,wrap:[this.wrapS,this.wrapT],format:this.format,internalFormat:this.internalFormat,type:this.type,encoding:this.encoding,minFilter:this.minFilter,magFilter:this.magFilter,anisotropy:this.anisotropy,flipY:this.flipY,generateMipmaps:this.generateMipmaps,premultiplyAlpha:this.premultiplyAlpha,unpackAlignment:this.unpackAlignment};return Object.keys(this.userData).length>0&&(n.userData=this.userData),t||(e.textures[this.uuid]=n),n}dispose(){this.dispatchEvent({type:"dispose"})}transformUv(e){if(this.mapping!==Wc)return e;if(e.applyMatrix3(this.matrix),e.x<0||e.x>1)switch(this.wrapS){case fa:e.x=e.x-Math.floor(e.x);break;case _n:e.x=e.x<0?0:1;break;case da:Math.abs(Math.floor(e.x)%2)===1?e.x=Math.ceil(e.x)-e.x:e.x=e.x-Math.floor(e.x);break}if(e.y<0||e.y>1)switch(this.wrapT){case fa:e.y=e.y-Math.floor(e.y);break;case _n:e.y=e.y<0?0:1;break;case da:Math.abs(Math.floor(e.y)%2)===1?e.y=Math.ceil(e.y)-e.y:e.y=e.y-Math.floor(e.y);break}return this.flipY&&(e.y=1-e.y),e}set needsUpdate(e){e===!0&&(this.version++,this.source.needsUpdate=!0)}}on.DEFAULT_IMAGE=null;on.DEFAULT_MAPPING=Wc;on.DEFAULT_ANISOTROPY=1;class Ot{constructor(e=0,t=0,n=0,i=1){Ot.prototype.isVector4=!0,this.x=e,this.y=t,this.z=n,this.w=i}get width(){return this.z}set width(e){this.z=e}get height(){return this.w}set height(e){this.w=e}set(e,t,n,i){return this.x=e,this.y=t,this.z=n,this.w=i,this}setScalar(e){return this.x=e,this.y=e,this.z=e,this.w=e,this}setX(e){return this.x=e,this}setY(e){return this.y=e,this}setZ(e){return this.z=e,this}setW(e){return this.w=e,this}setComponent(e,t){switch(e){case 0:this.x=t;break;case 1:this.y=t;break;case 2:this.z=t;break;case 3:this.w=t;break;default:throw new Error("index is out of range: "+e)}return this}getComponent(e){switch(e){case 0:return this.x;case 1:return this.y;case 2:return this.z;case 3:return this.w;default:throw new Error("index is out of range: "+e)}}clone(){return new this.constructor(this.x,this.y,this.z,this.w)}copy(e){return this.x=e.x,this.y=e.y,this.z=e.z,this.w=e.w!==void 0?e.w:1,this}add(e){return this.x+=e.x,this.y+=e.y,this.z+=e.z,this.w+=e.w,this}addScalar(e){return this.x+=e,this.y+=e,this.z+=e,this.w+=e,this}addVectors(e,t){return this.x=e.x+t.x,this.y=e.y+t.y,this.z=e.z+t.z,this.w=e.w+t.w,this}addScaledVector(e,t){return this.x+=e.x*t,this.y+=e.y*t,this.z+=e.z*t,this.w+=e.w*t,this}sub(e){return this.x-=e.x,this.y-=e.y,this.z-=e.z,this.w-=e.w,this}subScalar(e){return this.x-=e,this.y-=e,this.z-=e,this.w-=e,this}subVectors(e,t){return this.x=e.x-t.x,this.y=e.y-t.y,this.z=e.z-t.z,this.w=e.w-t.w,this}multiply(e){return this.x*=e.x,this.y*=e.y,this.z*=e.z,this.w*=e.w,this}multiplyScalar(e){return this.x*=e,this.y*=e,this.z*=e,this.w*=e,this}applyMatrix4(e){const t=this.x,n=this.y,i=this.z,s=this.w,a=e.elements;return this.x=a[0]*t+a[4]*n+a[8]*i+a[12]*s,this.y=a[1]*t+a[5]*n+a[9]*i+a[13]*s,this.z=a[2]*t+a[6]*n+a[10]*i+a[14]*s,this.w=a[3]*t+a[7]*n+a[11]*i+a[15]*s,this}divideScalar(e){return this.multiplyScalar(1/e)}setAxisAngleFromQuaternion(e){this.w=2*Math.acos(e.w);const t=Math.sqrt(1-e.w*e.w);return t<1e-4?(this.x=1,this.y=0,this.z=0):(this.x=e.x/t,this.y=e.y/t,this.z=e.z/t),this}setAxisAngleFromRotationMatrix(e){let t,n,i,s;const l=e.elements,c=l[0],u=l[4],f=l[8],d=l[1],p=l[5],m=l[9],h=l[2],_=l[6],g=l[10];if(Math.abs(u-d)<.01&&Math.abs(f-h)<.01&&Math.abs(m-_)<.01){if(Math.abs(u+d)<.1&&Math.abs(f+h)<.1&&Math.abs(m+_)<.1&&Math.abs(c+p+g-3)<.1)return this.set(1,0,0,0),this;t=Math.PI;const b=(c+1)/2,w=(p+1)/2,y=(g+1)/2,x=(u+d)/4,S=(f+h)/4,M=(m+_)/4;return b>w&&b>y?b<.01?(n=0,i=.707106781,s=.707106781):(n=Math.sqrt(b),i=x/n,s=S/n):w>y?w<.01?(n=.707106781,i=0,s=.707106781):(i=Math.sqrt(w),n=x/i,s=M/i):y<.01?(n=.707106781,i=.707106781,s=0):(s=Math.sqrt(y),n=S/s,i=M/s),this.set(n,i,s,t),this}let v=Math.sqrt((_-m)*(_-m)+(f-h)*(f-h)+(d-u)*(d-u));return Math.abs(v)<.001&&(v=1),this.x=(_-m)/v,this.y=(f-h)/v,this.z=(d-u)/v,this.w=Math.acos((c+p+g-1)/2),this}min(e){return this.x=Math.min(this.x,e.x),this.y=Math.min(this.y,e.y),this.z=Math.min(this.z,e.z),this.w=Math.min(this.w,e.w),this}max(e){return this.x=Math.max(this.x,e.x),this.y=Math.max(this.y,e.y),this.z=Math.max(this.z,e.z),this.w=Math.max(this.w,e.w),this}clamp(e,t){return this.x=Math.max(e.x,Math.min(t.x,this.x)),this.y=Math.max(e.y,Math.min(t.y,this.y)),this.z=Math.max(e.z,Math.min(t.z,this.z)),this.w=Math.max(e.w,Math.min(t.w,this.w)),this}clampScalar(e,t){return this.x=Math.max(e,Math.min(t,this.x)),this.y=Math.max(e,Math.min(t,this.y)),this.z=Math.max(e,Math.min(t,this.z)),this.w=Math.max(e,Math.min(t,this.w)),this}clampLength(e,t){const n=this.length();return this.divideScalar(n||1).multiplyScalar(Math.max(e,Math.min(t,n)))}floor(){return this.x=Math.floor(this.x),this.y=Math.floor(this.y),this.z=Math.floor(this.z),this.w=Math.floor(this.w),this}ceil(){return this.x=Math.ceil(this.x),this.y=Math.ceil(this.y),this.z=Math.ceil(this.z),this.w=Math.ceil(this.w),this}round(){return this.x=Math.round(this.x),this.y=Math.round(this.y),this.z=Math.round(this.z),this.w=Math.round(this.w),this}roundToZero(){return this.x=this.x<0?Math.ceil(this.x):Math.floor(this.x),this.y=this.y<0?Math.ceil(this.y):Math.floor(this.y),this.z=this.z<0?Math.ceil(this.z):Math.floor(this.z),this.w=this.w<0?Math.ceil(this.w):Math.floor(this.w),this}negate(){return this.x=-this.x,this.y=-this.y,this.z=-this.z,this.w=-this.w,this}dot(e){return this.x*e.x+this.y*e.y+this.z*e.z+this.w*e.w}lengthSq(){return this.x*this.x+this.y*this.y+this.z*this.z+this.w*this.w}length(){return Math.sqrt(this.x*this.x+this.y*this.y+this.z*this.z+this.w*this.w)}manhattanLength(){return Math.abs(this.x)+Math.abs(this.y)+Math.abs(this.z)+Math.abs(this.w)}normalize(){return this.divideScalar(this.length()||1)}setLength(e){return this.normalize().multiplyScalar(e)}lerp(e,t){return this.x+=(e.x-this.x)*t,this.y+=(e.y-this.y)*t,this.z+=(e.z-this.z)*t,this.w+=(e.w-this.w)*t,this}lerpVectors(e,t,n){return this.x=e.x+(t.x-e.x)*n,this.y=e.y+(t.y-e.y)*n,this.z=e.z+(t.z-e.z)*n,this.w=e.w+(t.w-e.w)*n,this}equals(e){return e.x===this.x&&e.y===this.y&&e.z===this.z&&e.w===this.w}fromArray(e,t=0){return this.x=e[t],this.y=e[t+1],this.z=e[t+2],this.w=e[t+3],this}toArray(e=[],t=0){return e[t]=this.x,e[t+1]=this.y,e[t+2]=this.z,e[t+3]=this.w,e}fromBufferAttribute(e,t){return this.x=e.getX(t),this.y=e.getY(t),this.z=e.getZ(t),this.w=e.getW(t),this}random(){return this.x=Math.random(),this.y=Math.random(),this.z=Math.random(),this.w=Math.random(),this}*[Symbol.iterator](){yield this.x,yield this.y,yield this.z,yield this.w}}class pi extends Xi{constructor(e=1,t=1,n={}){super(),this.isWebGLRenderTarget=!0,this.width=e,this.height=t,this.depth=1,this.scissor=new Ot(0,0,e,t),this.scissorTest=!1,this.viewport=new Ot(0,0,e,t);const i={width:e,height:t,depth:1};this.texture=new on(i,n.mapping,n.wrapS,n.wrapT,n.magFilter,n.minFilter,n.format,n.type,n.anisotropy,n.encoding),this.texture.isRenderTargetTexture=!0,this.texture.flipY=!1,this.texture.generateMipmaps=n.generateMipmaps!==void 0?n.generateMipmaps:!1,this.texture.internalFormat=n.internalFormat!==void 0?n.internalFormat:null,this.texture.minFilter=n.minFilter!==void 0?n.minFilter:fn,this.depthBuffer=n.depthBuffer!==void 0?n.depthBuffer:!0,this.stencilBuffer=n.stencilBuffer!==void 0?n.stencilBuffer:!1,this.depthTexture=n.depthTexture!==void 0?n.depthTexture:null,this.samples=n.samples!==void 0?n.samples:0}setSize(e,t,n=1){(this.width!==e||this.height!==t||this.depth!==n)&&(this.width=e,this.height=t,this.depth=n,this.texture.image.width=e,this.texture.image.height=t,this.texture.image.depth=n,this.dispose()),this.viewport.set(0,0,e,t),this.scissor.set(0,0,e,t)}clone(){return new this.constructor().copy(this)}copy(e){this.width=e.width,this.height=e.height,this.depth=e.depth,this.viewport.copy(e.viewport),this.texture=e.texture.clone(),this.texture.isRenderTargetTexture=!0;const t=Object.assign({},e.texture.image);return this.texture.source=new Kc(t),this.depthBuffer=e.depthBuffer,this.stencilBuffer=e.stencilBuffer,e.depthTexture!==null&&(this.depthTexture=e.depthTexture.clone()),this.samples=e.samples,this}dispose(){this.dispatchEvent({type:"dispose"})}}class Jc extends on{constructor(e=null,t=1,n=1,i=1){super(null),this.isDataArrayTexture=!0,this.image={data:e,width:t,height:n,depth:i},this.magFilter=Yt,this.minFilter=Yt,this.wrapR=_n,this.generateMipmaps=!1,this.flipY=!1,this.unpackAlignment=1}}class C_ extends on{constructor(e=null,t=1,n=1,i=1){super(null),this.isData3DTexture=!0,this.image={data:e,width:t,height:n,depth:i},this.magFilter=Yt,this.minFilter=Yt,this.wrapR=_n,this.generateMipmaps=!1,this.flipY=!1,this.unpackAlignment=1}}class Cr{constructor(e=new V(1/0,1/0,1/0),t=new V(-1/0,-1/0,-1/0)){this.isBox3=!0,this.min=e,this.max=t}set(e,t){return this.min.copy(e),this.max.copy(t),this}setFromArray(e){let t=1/0,n=1/0,i=1/0,s=-1/0,a=-1/0,o=-1/0;for(let l=0,c=e.length;l<c;l+=3){const u=e[l],f=e[l+1],d=e[l+2];u<t&&(t=u),f<n&&(n=f),d<i&&(i=d),u>s&&(s=u),f>a&&(a=f),d>o&&(o=d)}return this.min.set(t,n,i),this.max.set(s,a,o),this}setFromBufferAttribute(e){let t=1/0,n=1/0,i=1/0,s=-1/0,a=-1/0,o=-1/0;for(let l=0,c=e.count;l<c;l++){const u=e.getX(l),f=e.getY(l),d=e.getZ(l);u<t&&(t=u),f<n&&(n=f),d<i&&(i=d),u>s&&(s=u),f>a&&(a=f),d>o&&(o=d)}return this.min.set(t,n,i),this.max.set(s,a,o),this}setFromPoints(e){this.makeEmpty();for(let t=0,n=e.length;t<n;t++)this.expandByPoint(e[t]);return this}setFromCenterAndSize(e,t){const n=$n.copy(t).multiplyScalar(.5);return this.min.copy(e).sub(n),this.max.copy(e).add(n),this}setFromObject(e,t=!1){return this.makeEmpty(),this.expandByObject(e,t)}clone(){return new this.constructor().copy(this)}copy(e){return this.min.copy(e.min),this.max.copy(e.max),this}makeEmpty(){return this.min.x=this.min.y=this.min.z=1/0,this.max.x=this.max.y=this.max.z=-1/0,this}isEmpty(){return this.max.x<this.min.x||this.max.y<this.min.y||this.max.z<this.min.z}getCenter(e){return this.isEmpty()?e.set(0,0,0):e.addVectors(this.min,this.max).multiplyScalar(.5)}getSize(e){return this.isEmpty()?e.set(0,0,0):e.subVectors(this.max,this.min)}expandByPoint(e){return this.min.min(e),this.max.max(e),this}expandByVector(e){return this.min.sub(e),this.max.add(e),this}expandByScalar(e){return this.min.addScalar(-e),this.max.addScalar(e),this}expandByObject(e,t=!1){e.updateWorldMatrix(!1,!1);const n=e.geometry;if(n!==void 0)if(t&&n.attributes!=null&&n.attributes.position!==void 0){const s=n.attributes.position;for(let a=0,o=s.count;a<o;a++)$n.fromBufferAttribute(s,a).applyMatrix4(e.matrixWorld),this.expandByPoint($n)}else n.boundingBox===null&&n.computeBoundingBox(),Fs.copy(n.boundingBox),Fs.applyMatrix4(e.matrixWorld),this.union(Fs);const i=e.children;for(let s=0,a=i.length;s<a;s++)this.expandByObject(i[s],t);return this}containsPoint(e){return!(e.x<this.min.x||e.x>this.max.x||e.y<this.min.y||e.y>this.max.y||e.z<this.min.z||e.z>this.max.z)}containsBox(e){return this.min.x<=e.min.x&&e.max.x<=this.max.x&&this.min.y<=e.min.y&&e.max.y<=this.max.y&&this.min.z<=e.min.z&&e.max.z<=this.max.z}getParameter(e,t){return t.set((e.x-this.min.x)/(this.max.x-this.min.x),(e.y-this.min.y)/(this.max.y-this.min.y),(e.z-this.min.z)/(this.max.z-this.min.z))}intersectsBox(e){return!(e.max.x<this.min.x||e.min.x>this.max.x||e.max.y<this.min.y||e.min.y>this.max.y||e.max.z<this.min.z||e.min.z>this.max.z)}intersectsSphere(e){return this.clampPoint(e.center,$n),$n.distanceToSquared(e.center)<=e.radius*e.radius}intersectsPlane(e){let t,n;return e.normal.x>0?(t=e.normal.x*this.min.x,n=e.normal.x*this.max.x):(t=e.normal.x*this.max.x,n=e.normal.x*this.min.x),e.normal.y>0?(t+=e.normal.y*this.min.y,n+=e.normal.y*this.max.y):(t+=e.normal.y*this.max.y,n+=e.normal.y*this.min.y),e.normal.z>0?(t+=e.normal.z*this.min.z,n+=e.normal.z*this.max.z):(t+=e.normal.z*this.max.z,n+=e.normal.z*this.min.z),t<=-e.constant&&n>=-e.constant}intersectsTriangle(e){if(this.isEmpty())return!1;this.getCenter(Ki),Ar.subVectors(this.max,Ki),bi.subVectors(e.a,Ki),vi.subVectors(e.b,Ki),yi.subVectors(e.c,Ki),Vn.subVectors(vi,bi),Gn.subVectors(yi,vi),ei.subVectors(bi,yi);let t=[0,-Vn.z,Vn.y,0,-Gn.z,Gn.y,0,-ei.z,ei.y,Vn.z,0,-Vn.x,Gn.z,0,-Gn.x,ei.z,0,-ei.x,-Vn.y,Vn.x,0,-Gn.y,Gn.x,0,-ei.y,ei.x,0];return!Os(t,bi,vi,yi,Ar)||(t=[1,0,0,0,1,0,0,0,1],!Os(t,bi,vi,yi,Ar))?!1:(Dr.crossVectors(Vn,Gn),t=[Dr.x,Dr.y,Dr.z],Os(t,bi,vi,yi,Ar))}clampPoint(e,t){return t.copy(e).clamp(this.min,this.max)}distanceToPoint(e){return this.clampPoint(e,$n).distanceTo(e)}getBoundingSphere(e){return this.isEmpty()?e.makeEmpty():(this.getCenter(e.center),e.radius=this.getSize($n).length()*.5),e}intersect(e){return this.min.max(e.min),this.max.min(e.max),this.isEmpty()&&this.makeEmpty(),this}union(e){return this.min.min(e.min),this.max.max(e.max),this}applyMatrix4(e){return this.isEmpty()?this:(Pn[0].set(this.min.x,this.min.y,this.min.z).applyMatrix4(e),Pn[1].set(this.min.x,this.min.y,this.max.z).applyMatrix4(e),Pn[2].set(this.min.x,this.max.y,this.min.z).applyMatrix4(e),Pn[3].set(this.min.x,this.max.y,this.max.z).applyMatrix4(e),Pn[4].set(this.max.x,this.min.y,this.min.z).applyMatrix4(e),Pn[5].set(this.max.x,this.min.y,this.max.z).applyMatrix4(e),Pn[6].set(this.max.x,this.max.y,this.min.z).applyMatrix4(e),Pn[7].set(this.max.x,this.max.y,this.max.z).applyMatrix4(e),this.setFromPoints(Pn),this)}translate(e){return this.min.add(e),this.max.add(e),this}equals(e){return e.min.equals(this.min)&&e.max.equals(this.max)}}const Pn=[new V,new V,new V,new V,new V,new V,new V,new V],$n=new V,Fs=new Cr,bi=new V,vi=new V,yi=new V,Vn=new V,Gn=new V,ei=new V,Ki=new V,Ar=new V,Dr=new V,ti=new V;function Os(r,e,t,n,i){for(let s=0,a=r.length-3;s<=a;s+=3){ti.fromArray(r,s);const o=i.x*Math.abs(ti.x)+i.y*Math.abs(ti.y)+i.z*Math.abs(ti.z),l=e.dot(ti),c=t.dot(ti),u=n.dot(ti);if(Math.max(-Math.max(l,c,u),Math.min(l,c,u))>o)return!1}return!0}const T_=new Cr,Ji=new V,Us=new V;class _s{constructor(e=new V,t=-1){this.center=e,this.radius=t}set(e,t){return this.center.copy(e),this.radius=t,this}setFromPoints(e,t){const n=this.center;t!==void 0?n.copy(t):T_.setFromPoints(e).getCenter(n);let i=0;for(let s=0,a=e.length;s<a;s++)i=Math.max(i,n.distanceToSquared(e[s]));return this.radius=Math.sqrt(i),this}copy(e){return this.center.copy(e.center),this.radius=e.radius,this}isEmpty(){return this.radius<0}makeEmpty(){return this.center.set(0,0,0),this.radius=-1,this}containsPoint(e){return e.distanceToSquared(this.center)<=this.radius*this.radius}distanceToPoint(e){return e.distanceTo(this.center)-this.radius}intersectsSphere(e){const t=this.radius+e.radius;return e.center.distanceToSquared(this.center)<=t*t}intersectsBox(e){return e.intersectsSphere(this)}intersectsPlane(e){return Math.abs(e.distanceToPoint(this.center))<=this.radius}clampPoint(e,t){const n=this.center.distanceToSquared(e);return t.copy(e),n>this.radius*this.radius&&(t.sub(this.center).normalize(),t.multiplyScalar(this.radius).add(this.center)),t}getBoundingBox(e){return this.isEmpty()?(e.makeEmpty(),e):(e.set(this.center,this.center),e.expandByScalar(this.radius),e)}applyMatrix4(e){return this.center.applyMatrix4(e),this.radius=this.radius*e.getMaxScaleOnAxis(),this}translate(e){return this.center.add(e),this}expandByPoint(e){if(this.isEmpty())return this.center.copy(e),this.radius=0,this;Ji.subVectors(e,this.center);const t=Ji.lengthSq();if(t>this.radius*this.radius){const n=Math.sqrt(t),i=(n-this.radius)*.5;this.center.addScaledVector(Ji,i/n),this.radius+=i}return this}union(e){return e.isEmpty()?this:this.isEmpty()?(this.copy(e),this):(this.center.equals(e.center)===!0?this.radius=Math.max(this.radius,e.radius):(Us.subVectors(e.center,this.center).setLength(e.radius),this.expandByPoint(Ji.copy(e.center).add(Us)),this.expandByPoint(Ji.copy(e.center).sub(Us))),this)}equals(e){return e.center.equals(this.center)&&e.radius===this.radius}clone(){return new this.constructor().copy(this)}}const An=new V,Bs=new V,Rr=new V,Hn=new V,Vs=new V,kr=new V,Gs=new V;class Ma{constructor(e=new V,t=new V(0,0,-1)){this.origin=e,this.direction=t}set(e,t){return this.origin.copy(e),this.direction.copy(t),this}copy(e){return this.origin.copy(e.origin),this.direction.copy(e.direction),this}at(e,t){return t.copy(this.origin).addScaledVector(this.direction,e)}lookAt(e){return this.direction.copy(e).sub(this.origin).normalize(),this}recast(e){return this.origin.copy(this.at(e,An)),this}closestPointToPoint(e,t){t.subVectors(e,this.origin);const n=t.dot(this.direction);return n<0?t.copy(this.origin):t.copy(this.origin).addScaledVector(this.direction,n)}distanceToPoint(e){return Math.sqrt(this.distanceSqToPoint(e))}distanceSqToPoint(e){const t=An.subVectors(e,this.origin).dot(this.direction);return t<0?this.origin.distanceToSquared(e):(An.copy(this.origin).addScaledVector(this.direction,t),An.distanceToSquared(e))}distanceSqToSegment(e,t,n,i){Bs.copy(e).add(t).multiplyScalar(.5),Rr.copy(t).sub(e).normalize(),Hn.copy(this.origin).sub(Bs);const s=e.distanceTo(t)*.5,a=-this.direction.dot(Rr),o=Hn.dot(this.direction),l=-Hn.dot(Rr),c=Hn.lengthSq(),u=Math.abs(1-a*a);let f,d,p,m;if(u>0)if(f=a*l-o,d=a*o-l,m=s*u,f>=0)if(d>=-m)if(d<=m){const h=1/u;f*=h,d*=h,p=f*(f+a*d+2*o)+d*(a*f+d+2*l)+c}else d=s,f=Math.max(0,-(a*d+o)),p=-f*f+d*(d+2*l)+c;else d=-s,f=Math.max(0,-(a*d+o)),p=-f*f+d*(d+2*l)+c;else d<=-m?(f=Math.max(0,-(-a*s+o)),d=f>0?-s:Math.min(Math.max(-s,-l),s),p=-f*f+d*(d+2*l)+c):d<=m?(f=0,d=Math.min(Math.max(-s,-l),s),p=d*(d+2*l)+c):(f=Math.max(0,-(a*s+o)),d=f>0?s:Math.min(Math.max(-s,-l),s),p=-f*f+d*(d+2*l)+c);else d=a>0?-s:s,f=Math.max(0,-(a*d+o)),p=-f*f+d*(d+2*l)+c;return n&&n.copy(this.origin).addScaledVector(this.direction,f),i&&i.copy(Bs).addScaledVector(Rr,d),p}intersectSphere(e,t){An.subVectors(e.center,this.origin);const n=An.dot(this.direction),i=An.dot(An)-n*n,s=e.radius*e.radius;if(i>s)return null;const a=Math.sqrt(s-i),o=n-a,l=n+a;return l<0?null:o<0?this.at(l,t):this.at(o,t)}intersectsSphere(e){return this.distanceSqToPoint(e.center)<=e.radius*e.radius}distanceToPlane(e){const t=e.normal.dot(this.direction);if(t===0)return e.distanceToPoint(this.origin)===0?0:null;const n=-(this.origin.dot(e.normal)+e.constant)/t;return n>=0?n:null}intersectPlane(e,t){const n=this.distanceToPlane(e);return n===null?null:this.at(n,t)}intersectsPlane(e){const t=e.distanceToPoint(this.origin);return t===0||e.normal.dot(this.direction)*t<0}intersectBox(e,t){let n,i,s,a,o,l;const c=1/this.direction.x,u=1/this.direction.y,f=1/this.direction.z,d=this.origin;return c>=0?(n=(e.min.x-d.x)*c,i=(e.max.x-d.x)*c):(n=(e.max.x-d.x)*c,i=(e.min.x-d.x)*c),u>=0?(s=(e.min.y-d.y)*u,a=(e.max.y-d.y)*u):(s=(e.max.y-d.y)*u,a=(e.min.y-d.y)*u),n>a||s>i||((s>n||isNaN(n))&&(n=s),(a<i||isNaN(i))&&(i=a),f>=0?(o=(e.min.z-d.z)*f,l=(e.max.z-d.z)*f):(o=(e.max.z-d.z)*f,l=(e.min.z-d.z)*f),n>l||o>i)||((o>n||n!==n)&&(n=o),(l<i||i!==i)&&(i=l),i<0)?null:this.at(n>=0?n:i,t)}intersectsBox(e){return this.intersectBox(e,An)!==null}intersectTriangle(e,t,n,i,s){Vs.subVectors(t,e),kr.subVectors(n,e),Gs.crossVectors(Vs,kr);let a=this.direction.dot(Gs),o;if(a>0){if(i)return null;o=1}else if(a<0)o=-1,a=-a;else return null;Hn.subVectors(this.origin,e);const l=o*this.direction.dot(kr.crossVectors(Hn,kr));if(l<0)return null;const c=o*this.direction.dot(Vs.cross(Hn));if(c<0||l+c>a)return null;const u=-o*Hn.dot(Gs);return u<0?null:this.at(u/a,s)}applyMatrix4(e){return this.origin.applyMatrix4(e),this.direction.transformDirection(e),this}equals(e){return e.origin.equals(this.origin)&&e.direction.equals(this.direction)}clone(){return new this.constructor().copy(this)}}class Lt{constructor(){Lt.prototype.isMatrix4=!0,this.elements=[1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1]}set(e,t,n,i,s,a,o,l,c,u,f,d,p,m,h,_){const g=this.elements;return g[0]=e,g[4]=t,g[8]=n,g[12]=i,g[1]=s,g[5]=a,g[9]=o,g[13]=l,g[2]=c,g[6]=u,g[10]=f,g[14]=d,g[3]=p,g[7]=m,g[11]=h,g[15]=_,this}identity(){return this.set(1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1),this}clone(){return new Lt().fromArray(this.elements)}copy(e){const t=this.elements,n=e.elements;return t[0]=n[0],t[1]=n[1],t[2]=n[2],t[3]=n[3],t[4]=n[4],t[5]=n[5],t[6]=n[6],t[7]=n[7],t[8]=n[8],t[9]=n[9],t[10]=n[10],t[11]=n[11],t[12]=n[12],t[13]=n[13],t[14]=n[14],t[15]=n[15],this}copyPosition(e){const t=this.elements,n=e.elements;return t[12]=n[12],t[13]=n[13],t[14]=n[14],this}setFromMatrix3(e){const t=e.elements;return this.set(t[0],t[3],t[6],0,t[1],t[4],t[7],0,t[2],t[5],t[8],0,0,0,0,1),this}extractBasis(e,t,n){return e.setFromMatrixColumn(this,0),t.setFromMatrixColumn(this,1),n.setFromMatrixColumn(this,2),this}makeBasis(e,t,n){return this.set(e.x,t.x,n.x,0,e.y,t.y,n.y,0,e.z,t.z,n.z,0,0,0,0,1),this}extractRotation(e){const t=this.elements,n=e.elements,i=1/wi.setFromMatrixColumn(e,0).length(),s=1/wi.setFromMatrixColumn(e,1).length(),a=1/wi.setFromMatrixColumn(e,2).length();return t[0]=n[0]*i,t[1]=n[1]*i,t[2]=n[2]*i,t[3]=0,t[4]=n[4]*s,t[5]=n[5]*s,t[6]=n[6]*s,t[7]=0,t[8]=n[8]*a,t[9]=n[9]*a,t[10]=n[10]*a,t[11]=0,t[12]=0,t[13]=0,t[14]=0,t[15]=1,this}makeRotationFromEuler(e){const t=this.elements,n=e.x,i=e.y,s=e.z,a=Math.cos(n),o=Math.sin(n),l=Math.cos(i),c=Math.sin(i),u=Math.cos(s),f=Math.sin(s);if(e.order==="XYZ"){const d=a*u,p=a*f,m=o*u,h=o*f;t[0]=l*u,t[4]=-l*f,t[8]=c,t[1]=p+m*c,t[5]=d-h*c,t[9]=-o*l,t[2]=h-d*c,t[6]=m+p*c,t[10]=a*l}else if(e.order==="YXZ"){const d=l*u,p=l*f,m=c*u,h=c*f;t[0]=d+h*o,t[4]=m*o-p,t[8]=a*c,t[1]=a*f,t[5]=a*u,t[9]=-o,t[2]=p*o-m,t[6]=h+d*o,t[10]=a*l}else if(e.order==="ZXY"){const d=l*u,p=l*f,m=c*u,h=c*f;t[0]=d-h*o,t[4]=-a*f,t[8]=m+p*o,t[1]=p+m*o,t[5]=a*u,t[9]=h-d*o,t[2]=-a*c,t[6]=o,t[10]=a*l}else if(e.order==="ZYX"){const d=a*u,p=a*f,m=o*u,h=o*f;t[0]=l*u,t[4]=m*c-p,t[8]=d*c+h,t[1]=l*f,t[5]=h*c+d,t[9]=p*c-m,t[2]=-c,t[6]=o*l,t[10]=a*l}else if(e.order==="YZX"){const d=a*l,p=a*c,m=o*l,h=o*c;t[0]=l*u,t[4]=h-d*f,t[8]=m*f+p,t[1]=f,t[5]=a*u,t[9]=-o*u,t[2]=-c*u,t[6]=p*f+m,t[10]=d-h*f}else if(e.order==="XZY"){const d=a*l,p=a*c,m=o*l,h=o*c;t[0]=l*u,t[4]=-f,t[8]=c*u,t[1]=d*f+h,t[5]=a*u,t[9]=p*f-m,t[2]=m*f-p,t[6]=o*u,t[10]=h*f+d}return t[3]=0,t[7]=0,t[11]=0,t[12]=0,t[13]=0,t[14]=0,t[15]=1,this}makeRotationFromQuaternion(e){return this.compose(E_,e,L_)}lookAt(e,t,n){const i=this.elements;return rn.subVectors(e,t),rn.lengthSq()===0&&(rn.z=1),rn.normalize(),Wn.crossVectors(n,rn),Wn.lengthSq()===0&&(Math.abs(n.z)===1?rn.x+=1e-4:rn.z+=1e-4,rn.normalize(),Wn.crossVectors(n,rn)),Wn.normalize(),Ir.crossVectors(rn,Wn),i[0]=Wn.x,i[4]=Ir.x,i[8]=rn.x,i[1]=Wn.y,i[5]=Ir.y,i[9]=rn.y,i[2]=Wn.z,i[6]=Ir.z,i[10]=rn.z,this}multiply(e){return this.multiplyMatrices(this,e)}premultiply(e){return this.multiplyMatrices(e,this)}multiplyMatrices(e,t){const n=e.elements,i=t.elements,s=this.elements,a=n[0],o=n[4],l=n[8],c=n[12],u=n[1],f=n[5],d=n[9],p=n[13],m=n[2],h=n[6],_=n[10],g=n[14],v=n[3],b=n[7],w=n[11],y=n[15],x=i[0],S=i[4],M=i[8],T=i[12],R=i[1],k=i[5],G=i[9],F=i[13],O=i[2],X=i[6],le=i[10],ce=i[14],te=i[3],ne=i[7],ue=i[11],be=i[15];return s[0]=a*x+o*R+l*O+c*te,s[4]=a*S+o*k+l*X+c*ne,s[8]=a*M+o*G+l*le+c*ue,s[12]=a*T+o*F+l*ce+c*be,s[1]=u*x+f*R+d*O+p*te,s[5]=u*S+f*k+d*X+p*ne,s[9]=u*M+f*G+d*le+p*ue,s[13]=u*T+f*F+d*ce+p*be,s[2]=m*x+h*R+_*O+g*te,s[6]=m*S+h*k+_*X+g*ne,s[10]=m*M+h*G+_*le+g*ue,s[14]=m*T+h*F+_*ce+g*be,s[3]=v*x+b*R+w*O+y*te,s[7]=v*S+b*k+w*X+y*ne,s[11]=v*M+b*G+w*le+y*ue,s[15]=v*T+b*F+w*ce+y*be,this}multiplyScalar(e){const t=this.elements;return t[0]*=e,t[4]*=e,t[8]*=e,t[12]*=e,t[1]*=e,t[5]*=e,t[9]*=e,t[13]*=e,t[2]*=e,t[6]*=e,t[10]*=e,t[14]*=e,t[3]*=e,t[7]*=e,t[11]*=e,t[15]*=e,this}determinant(){const e=this.elements,t=e[0],n=e[4],i=e[8],s=e[12],a=e[1],o=e[5],l=e[9],c=e[13],u=e[2],f=e[6],d=e[10],p=e[14],m=e[3],h=e[7],_=e[11],g=e[15];return m*(+s*l*f-i*c*f-s*o*d+n*c*d+i*o*p-n*l*p)+h*(+t*l*p-t*c*d+s*a*d-i*a*p+i*c*u-s*l*u)+_*(+t*c*f-t*o*p-s*a*f+n*a*p+s*o*u-n*c*u)+g*(-i*o*u-t*l*f+t*o*d+i*a*f-n*a*d+n*l*u)}transpose(){const e=this.elements;let t;return t=e[1],e[1]=e[4],e[4]=t,t=e[2],e[2]=e[8],e[8]=t,t=e[6],e[6]=e[9],e[9]=t,t=e[3],e[3]=e[12],e[12]=t,t=e[7],e[7]=e[13],e[13]=t,t=e[11],e[11]=e[14],e[14]=t,this}setPosition(e,t,n){const i=this.elements;return e.isVector3?(i[12]=e.x,i[13]=e.y,i[14]=e.z):(i[12]=e,i[13]=t,i[14]=n),this}invert(){const e=this.elements,t=e[0],n=e[1],i=e[2],s=e[3],a=e[4],o=e[5],l=e[6],c=e[7],u=e[8],f=e[9],d=e[10],p=e[11],m=e[12],h=e[13],_=e[14],g=e[15],v=f*_*c-h*d*c+h*l*p-o*_*p-f*l*g+o*d*g,b=m*d*c-u*_*c-m*l*p+a*_*p+u*l*g-a*d*g,w=u*h*c-m*f*c+m*o*p-a*h*p-u*o*g+a*f*g,y=m*f*l-u*h*l-m*o*d+a*h*d+u*o*_-a*f*_,x=t*v+n*b+i*w+s*y;if(x===0)return this.set(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);const S=1/x;return e[0]=v*S,e[1]=(h*d*s-f*_*s-h*i*p+n*_*p+f*i*g-n*d*g)*S,e[2]=(o*_*s-h*l*s+h*i*c-n*_*c-o*i*g+n*l*g)*S,e[3]=(f*l*s-o*d*s-f*i*c+n*d*c+o*i*p-n*l*p)*S,e[4]=b*S,e[5]=(u*_*s-m*d*s+m*i*p-t*_*p-u*i*g+t*d*g)*S,e[6]=(m*l*s-a*_*s-m*i*c+t*_*c+a*i*g-t*l*g)*S,e[7]=(a*d*s-u*l*s+u*i*c-t*d*c-a*i*p+t*l*p)*S,e[8]=w*S,e[9]=(m*f*s-u*h*s-m*n*p+t*h*p+u*n*g-t*f*g)*S,e[10]=(a*h*s-m*o*s+m*n*c-t*h*c-a*n*g+t*o*g)*S,e[11]=(u*o*s-a*f*s-u*n*c+t*f*c+a*n*p-t*o*p)*S,e[12]=y*S,e[13]=(u*h*i-m*f*i+m*n*d-t*h*d-u*n*_+t*f*_)*S,e[14]=(m*o*i-a*h*i-m*n*l+t*h*l+a*n*_-t*o*_)*S,e[15]=(a*f*i-u*o*i+u*n*l-t*f*l-a*n*d+t*o*d)*S,this}scale(e){const t=this.elements,n=e.x,i=e.y,s=e.z;return t[0]*=n,t[4]*=i,t[8]*=s,t[1]*=n,t[5]*=i,t[9]*=s,t[2]*=n,t[6]*=i,t[10]*=s,t[3]*=n,t[7]*=i,t[11]*=s,this}getMaxScaleOnAxis(){const e=this.elements,t=e[0]*e[0]+e[1]*e[1]+e[2]*e[2],n=e[4]*e[4]+e[5]*e[5]+e[6]*e[6],i=e[8]*e[8]+e[9]*e[9]+e[10]*e[10];return Math.sqrt(Math.max(t,n,i))}makeTranslation(e,t,n){return this.set(1,0,0,e,0,1,0,t,0,0,1,n,0,0,0,1),this}makeRotationX(e){const t=Math.cos(e),n=Math.sin(e);return this.set(1,0,0,0,0,t,-n,0,0,n,t,0,0,0,0,1),this}makeRotationY(e){const t=Math.cos(e),n=Math.sin(e);return this.set(t,0,n,0,0,1,0,0,-n,0,t,0,0,0,0,1),this}makeRotationZ(e){const t=Math.cos(e),n=Math.sin(e);return this.set(t,-n,0,0,n,t,0,0,0,0,1,0,0,0,0,1),this}makeRotationAxis(e,t){const n=Math.cos(t),i=Math.sin(t),s=1-n,a=e.x,o=e.y,l=e.z,c=s*a,u=s*o;return this.set(c*a+n,c*o-i*l,c*l+i*o,0,c*o+i*l,u*o+n,u*l-i*a,0,c*l-i*o,u*l+i*a,s*l*l+n,0,0,0,0,1),this}makeScale(e,t,n){return this.set(e,0,0,0,0,t,0,0,0,0,n,0,0,0,0,1),this}makeShear(e,t,n,i,s,a){return this.set(1,n,s,0,e,1,a,0,t,i,1,0,0,0,0,1),this}compose(e,t,n){const i=this.elements,s=t._x,a=t._y,o=t._z,l=t._w,c=s+s,u=a+a,f=o+o,d=s*c,p=s*u,m=s*f,h=a*u,_=a*f,g=o*f,v=l*c,b=l*u,w=l*f,y=n.x,x=n.y,S=n.z;return i[0]=(1-(h+g))*y,i[1]=(p+w)*y,i[2]=(m-b)*y,i[3]=0,i[4]=(p-w)*x,i[5]=(1-(d+g))*x,i[6]=(_+v)*x,i[7]=0,i[8]=(m+b)*S,i[9]=(_-v)*S,i[10]=(1-(d+h))*S,i[11]=0,i[12]=e.x,i[13]=e.y,i[14]=e.z,i[15]=1,this}decompose(e,t,n){const i=this.elements;let s=wi.set(i[0],i[1],i[2]).length();const a=wi.set(i[4],i[5],i[6]).length(),o=wi.set(i[8],i[9],i[10]).length();this.determinant()<0&&(s=-s),e.x=i[12],e.y=i[13],e.z=i[14],hn.copy(this);const c=1/s,u=1/a,f=1/o;return hn.elements[0]*=c,hn.elements[1]*=c,hn.elements[2]*=c,hn.elements[4]*=u,hn.elements[5]*=u,hn.elements[6]*=u,hn.elements[8]*=f,hn.elements[9]*=f,hn.elements[10]*=f,t.setFromRotationMatrix(hn),n.x=s,n.y=a,n.z=o,this}makePerspective(e,t,n,i,s,a){const o=this.elements,l=2*s/(t-e),c=2*s/(n-i),u=(t+e)/(t-e),f=(n+i)/(n-i),d=-(a+s)/(a-s),p=-2*a*s/(a-s);return o[0]=l,o[4]=0,o[8]=u,o[12]=0,o[1]=0,o[5]=c,o[9]=f,o[13]=0,o[2]=0,o[6]=0,o[10]=d,o[14]=p,o[3]=0,o[7]=0,o[11]=-1,o[15]=0,this}makeOrthographic(e,t,n,i,s,a){const o=this.elements,l=1/(t-e),c=1/(n-i),u=1/(a-s),f=(t+e)*l,d=(n+i)*c,p=(a+s)*u;return o[0]=2*l,o[4]=0,o[8]=0,o[12]=-f,o[1]=0,o[5]=2*c,o[9]=0,o[13]=-d,o[2]=0,o[6]=0,o[10]=-2*u,o[14]=-p,o[3]=0,o[7]=0,o[11]=0,o[15]=1,this}equals(e){const t=this.elements,n=e.elements;for(let i=0;i<16;i++)if(t[i]!==n[i])return!1;return!0}fromArray(e,t=0){for(let n=0;n<16;n++)this.elements[n]=e[n+t];return this}toArray(e=[],t=0){const n=this.elements;return e[t]=n[0],e[t+1]=n[1],e[t+2]=n[2],e[t+3]=n[3],e[t+4]=n[4],e[t+5]=n[5],e[t+6]=n[6],e[t+7]=n[7],e[t+8]=n[8],e[t+9]=n[9],e[t+10]=n[10],e[t+11]=n[11],e[t+12]=n[12],e[t+13]=n[13],e[t+14]=n[14],e[t+15]=n[15],e}}const wi=new V,hn=new Lt,E_=new V(0,0,0),L_=new V(1,1,1),Wn=new V,Ir=new V,rn=new V,Nl=new Lt,zl=new Zt;class Tr{constructor(e=0,t=0,n=0,i=Tr.DEFAULT_ORDER){this.isEuler=!0,this._x=e,this._y=t,this._z=n,this._order=i}get x(){return this._x}set x(e){this._x=e,this._onChangeCallback()}get y(){return this._y}set y(e){this._y=e,this._onChangeCallback()}get z(){return this._z}set z(e){this._z=e,this._onChangeCallback()}get order(){return this._order}set order(e){this._order=e,this._onChangeCallback()}set(e,t,n,i=this._order){return this._x=e,this._y=t,this._z=n,this._order=i,this._onChangeCallback(),this}clone(){return new this.constructor(this._x,this._y,this._z,this._order)}copy(e){return this._x=e._x,this._y=e._y,this._z=e._z,this._order=e._order,this._onChangeCallback(),this}setFromRotationMatrix(e,t=this._order,n=!0){const i=e.elements,s=i[0],a=i[4],o=i[8],l=i[1],c=i[5],u=i[9],f=i[2],d=i[6],p=i[10];switch(t){case"XYZ":this._y=Math.asin($t(o,-1,1)),Math.abs(o)<.9999999?(this._x=Math.atan2(-u,p),this._z=Math.atan2(-a,s)):(this._x=Math.atan2(d,c),this._z=0);break;case"YXZ":this._x=Math.asin(-$t(u,-1,1)),Math.abs(u)<.9999999?(this._y=Math.atan2(o,p),this._z=Math.atan2(l,c)):(this._y=Math.atan2(-f,s),this._z=0);break;case"ZXY":this._x=Math.asin($t(d,-1,1)),Math.abs(d)<.9999999?(this._y=Math.atan2(-f,p),this._z=Math.atan2(-a,c)):(this._y=0,this._z=Math.atan2(l,s));break;case"ZYX":this._y=Math.asin(-$t(f,-1,1)),Math.abs(f)<.9999999?(this._x=Math.atan2(d,p),this._z=Math.atan2(l,s)):(this._x=0,this._z=Math.atan2(-a,c));break;case"YZX":this._z=Math.asin($t(l,-1,1)),Math.abs(l)<.9999999?(this._x=Math.atan2(-u,c),this._y=Math.atan2(-f,s)):(this._x=0,this._y=Math.atan2(o,p));break;case"XZY":this._z=Math.asin(-$t(a,-1,1)),Math.abs(a)<.9999999?(this._x=Math.atan2(d,c),this._y=Math.atan2(o,s)):(this._x=Math.atan2(-u,p),this._y=0);break;default:console.warn("THREE.Euler: .setFromRotationMatrix() encountered an unknown order: "+t)}return this._order=t,n===!0&&this._onChangeCallback(),this}setFromQuaternion(e,t,n){return Nl.makeRotationFromQuaternion(e),this.setFromRotationMatrix(Nl,t,n)}setFromVector3(e,t=this._order){return this.set(e.x,e.y,e.z,t)}reorder(e){return zl.setFromEuler(this),this.setFromQuaternion(zl,e)}equals(e){return e._x===this._x&&e._y===this._y&&e._z===this._z&&e._order===this._order}fromArray(e){return this._x=e[0],this._y=e[1],this._z=e[2],e[3]!==void 0&&(this._order=e[3]),this._onChangeCallback(),this}toArray(e=[],t=0){return e[t]=this._x,e[t+1]=this._y,e[t+2]=this._z,e[t+3]=this._order,e}_onChange(e){return this._onChangeCallback=e,this}_onChangeCallback(){}*[Symbol.iterator](){yield this._x,yield this._y,yield this._z,yield this._order}}Tr.DEFAULT_ORDER="XYZ";class xa{constructor(){this.mask=1}set(e){this.mask=(1<<e|0)>>>0}enable(e){this.mask|=1<<e|0}enableAll(){this.mask=-1}toggle(e){this.mask^=1<<e|0}disable(e){this.mask&=~(1<<e|0)}disableAll(){this.mask=0}test(e){return(this.mask&e.mask)!==0}isEnabled(e){return(this.mask&(1<<e|0))!==0}}let P_=0;const Fl=new V,Mi=new Zt,Dn=new Lt,Nr=new V,Qi=new V,A_=new V,D_=new Zt,Ol=new V(1,0,0),Ul=new V(0,1,0),Bl=new V(0,0,1),R_={type:"added"},Vl={type:"removed"};class Ut extends Xi{constructor(){super(),this.isObject3D=!0,Object.defineProperty(this,"id",{value:P_++}),this.uuid=ji(),this.name="",this.type="Object3D",this.parent=null,this.children=[],this.up=Ut.DEFAULT_UP.clone();const e=new V,t=new Tr,n=new Zt,i=new V(1,1,1);function s(){n.setFromEuler(t,!1)}function a(){t.setFromQuaternion(n,void 0,!1)}t._onChange(s),n._onChange(a),Object.defineProperties(this,{position:{configurable:!0,enumerable:!0,value:e},rotation:{configurable:!0,enumerable:!0,value:t},quaternion:{configurable:!0,enumerable:!0,value:n},scale:{configurable:!0,enumerable:!0,value:i},modelViewMatrix:{value:new Lt},normalMatrix:{value:new Kt}}),this.matrix=new Lt,this.matrixWorld=new Lt,this.matrixAutoUpdate=Ut.DEFAULT_MATRIX_AUTO_UPDATE,this.matrixWorldNeedsUpdate=!1,this.matrixWorldAutoUpdate=Ut.DEFAULT_MATRIX_WORLD_AUTO_UPDATE,this.layers=new xa,this.visible=!0,this.castShadow=!1,this.receiveShadow=!1,this.frustumCulled=!0,this.renderOrder=0,this.animations=[],this.userData={}}onBeforeRender(){}onAfterRender(){}applyMatrix4(e){this.matrixAutoUpdate&&this.updateMatrix(),this.matrix.premultiply(e),this.matrix.decompose(this.position,this.quaternion,this.scale)}applyQuaternion(e){return this.quaternion.premultiply(e),this}setRotationFromAxisAngle(e,t){this.quaternion.setFromAxisAngle(e,t)}setRotationFromEuler(e){this.quaternion.setFromEuler(e,!0)}setRotationFromMatrix(e){this.quaternion.setFromRotationMatrix(e)}setRotationFromQuaternion(e){this.quaternion.copy(e)}rotateOnAxis(e,t){return Mi.setFromAxisAngle(e,t),this.quaternion.multiply(Mi),this}rotateOnWorldAxis(e,t){return Mi.setFromAxisAngle(e,t),this.quaternion.premultiply(Mi),this}rotateX(e){return this.rotateOnAxis(Ol,e)}rotateY(e){return this.rotateOnAxis(Ul,e)}rotateZ(e){return this.rotateOnAxis(Bl,e)}translateOnAxis(e,t){return Fl.copy(e).applyQuaternion(this.quaternion),this.position.add(Fl.multiplyScalar(t)),this}translateX(e){return this.translateOnAxis(Ol,e)}translateY(e){return this.translateOnAxis(Ul,e)}translateZ(e){return this.translateOnAxis(Bl,e)}localToWorld(e){return this.updateWorldMatrix(!0,!1),e.applyMatrix4(this.matrixWorld)}worldToLocal(e){return this.updateWorldMatrix(!0,!1),e.applyMatrix4(Dn.copy(this.matrixWorld).invert())}lookAt(e,t,n){e.isVector3?Nr.copy(e):Nr.set(e,t,n);const i=this.parent;this.updateWorldMatrix(!0,!1),Qi.setFromMatrixPosition(this.matrixWorld),this.isCamera||this.isLight?Dn.lookAt(Qi,Nr,this.up):Dn.lookAt(Nr,Qi,this.up),this.quaternion.setFromRotationMatrix(Dn),i&&(Dn.extractRotation(i.matrixWorld),Mi.setFromRotationMatrix(Dn),this.quaternion.premultiply(Mi.invert()))}add(e){if(arguments.length>1){for(let t=0;t<arguments.length;t++)this.add(arguments[t]);return this}return e===this?(console.error("THREE.Object3D.add: object can't be added as a child of itself.",e),this):(e&&e.isObject3D?(e.parent!==null&&e.parent.remove(e),e.parent=this,this.children.push(e),e.dispatchEvent(R_)):console.error("THREE.Object3D.add: object not an instance of THREE.Object3D.",e),this)}remove(e){if(arguments.length>1){for(let n=0;n<arguments.length;n++)this.remove(arguments[n]);return this}const t=this.children.indexOf(e);return t!==-1&&(e.parent=null,this.children.splice(t,1),e.dispatchEvent(Vl)),this}removeFromParent(){const e=this.parent;return e!==null&&e.remove(this),this}clear(){for(let e=0;e<this.children.length;e++){const t=this.children[e];t.parent=null,t.dispatchEvent(Vl)}return this.children.length=0,this}attach(e){return this.updateWorldMatrix(!0,!1),Dn.copy(this.matrixWorld).invert(),e.parent!==null&&(e.parent.updateWorldMatrix(!0,!1),Dn.multiply(e.parent.matrixWorld)),e.applyMatrix4(Dn),this.add(e),e.updateWorldMatrix(!1,!0),this}getObjectById(e){return this.getObjectByProperty("id",e)}getObjectByName(e){return this.getObjectByProperty("name",e)}getObjectByProperty(e,t){if(this[e]===t)return this;for(let n=0,i=this.children.length;n<i;n++){const a=this.children[n].getObjectByProperty(e,t);if(a!==void 0)return a}}getObjectsByProperty(e,t){let n=[];this[e]===t&&n.push(this);for(let i=0,s=this.children.length;i<s;i++){const a=this.children[i].getObjectsByProperty(e,t);a.length>0&&(n=n.concat(a))}return n}getWorldPosition(e){return this.updateWorldMatrix(!0,!1),e.setFromMatrixPosition(this.matrixWorld)}getWorldQuaternion(e){return this.updateWorldMatrix(!0,!1),this.matrixWorld.decompose(Qi,e,A_),e}getWorldScale(e){return this.updateWorldMatrix(!0,!1),this.matrixWorld.decompose(Qi,D_,e),e}getWorldDirection(e){this.updateWorldMatrix(!0,!1);const t=this.matrixWorld.elements;return e.set(t[8],t[9],t[10]).normalize()}raycast(){}traverse(e){e(this);const t=this.children;for(let n=0,i=t.length;n<i;n++)t[n].traverse(e)}traverseVisible(e){if(this.visible===!1)return;e(this);const t=this.children;for(let n=0,i=t.length;n<i;n++)t[n].traverseVisible(e)}traverseAncestors(e){const t=this.parent;t!==null&&(e(t),t.traverseAncestors(e))}updateMatrix(){this.matrix.compose(this.position,this.quaternion,this.scale),this.matrixWorldNeedsUpdate=!0}updateMatrixWorld(e){this.matrixAutoUpdate&&this.updateMatrix(),(this.matrixWorldNeedsUpdate||e)&&(this.parent===null?this.matrixWorld.copy(this.matrix):this.matrixWorld.multiplyMatrices(this.parent.matrixWorld,this.matrix),this.matrixWorldNeedsUpdate=!1,e=!0);const t=this.children;for(let n=0,i=t.length;n<i;n++){const s=t[n];(s.matrixWorldAutoUpdate===!0||e===!0)&&s.updateMatrixWorld(e)}}updateWorldMatrix(e,t){const n=this.parent;if(e===!0&&n!==null&&n.matrixWorldAutoUpdate===!0&&n.updateWorldMatrix(!0,!1),this.matrixAutoUpdate&&this.updateMatrix(),this.parent===null?this.matrixWorld.copy(this.matrix):this.matrixWorld.multiplyMatrices(this.parent.matrixWorld,this.matrix),t===!0){const i=this.children;for(let s=0,a=i.length;s<a;s++){const o=i[s];o.matrixWorldAutoUpdate===!0&&o.updateWorldMatrix(!1,!0)}}}toJSON(e){const t=e===void 0||typeof e=="string",n={};t&&(e={geometries:{},materials:{},textures:{},images:{},shapes:{},skeletons:{},animations:{},nodes:{}},n.metadata={version:4.5,type:"Object",generator:"Object3D.toJSON"});const i={};i.uuid=this.uuid,i.type=this.type,this.name!==""&&(i.name=this.name),this.castShadow===!0&&(i.castShadow=!0),this.receiveShadow===!0&&(i.receiveShadow=!0),this.visible===!1&&(i.visible=!1),this.frustumCulled===!1&&(i.frustumCulled=!1),this.renderOrder!==0&&(i.renderOrder=this.renderOrder),Object.keys(this.userData).length>0&&(i.userData=this.userData),i.layers=this.layers.mask,i.matrix=this.matrix.toArray(),this.matrixAutoUpdate===!1&&(i.matrixAutoUpdate=!1),this.isInstancedMesh&&(i.type="InstancedMesh",i.count=this.count,i.instanceMatrix=this.instanceMatrix.toJSON(),this.instanceColor!==null&&(i.instanceColor=this.instanceColor.toJSON()));function s(o,l){return o[l.uuid]===void 0&&(o[l.uuid]=l.toJSON(e)),l.uuid}if(this.isScene)this.background&&(this.background.isColor?i.background=this.background.toJSON():this.background.isTexture&&(i.background=this.background.toJSON(e).uuid)),this.environment&&this.environment.isTexture&&this.environment.isRenderTargetTexture!==!0&&(i.environment=this.environment.toJSON(e).uuid);else if(this.isMesh||this.isLine||this.isPoints){i.geometry=s(e.geometries,this.geometry);const o=this.geometry.parameters;if(o!==void 0&&o.shapes!==void 0){const l=o.shapes;if(Array.isArray(l))for(let c=0,u=l.length;c<u;c++){const f=l[c];s(e.shapes,f)}else s(e.shapes,l)}}if(this.isSkinnedMesh&&(i.bindMode=this.bindMode,i.bindMatrix=this.bindMatrix.toArray(),this.skeleton!==void 0&&(s(e.skeletons,this.skeleton),i.skeleton=this.skeleton.uuid)),this.material!==void 0)if(Array.isArray(this.material)){const o=[];for(let l=0,c=this.material.length;l<c;l++)o.push(s(e.materials,this.material[l]));i.material=o}else i.material=s(e.materials,this.material);if(this.children.length>0){i.children=[];for(let o=0;o<this.children.length;o++)i.children.push(this.children[o].toJSON(e).object)}if(this.animations.length>0){i.animations=[];for(let o=0;o<this.animations.length;o++){const l=this.animations[o];i.animations.push(s(e.animations,l))}}if(t){const o=a(e.geometries),l=a(e.materials),c=a(e.textures),u=a(e.images),f=a(e.shapes),d=a(e.skeletons),p=a(e.animations),m=a(e.nodes);o.length>0&&(n.geometries=o),l.length>0&&(n.materials=l),c.length>0&&(n.textures=c),u.length>0&&(n.images=u),f.length>0&&(n.shapes=f),d.length>0&&(n.skeletons=d),p.length>0&&(n.animations=p),m.length>0&&(n.nodes=m)}return n.object=i,n;function a(o){const l=[];for(const c in o){const u=o[c];delete u.metadata,l.push(u)}return l}}clone(e){return new this.constructor().copy(this,e)}copy(e,t=!0){if(this.name=e.name,this.up.copy(e.up),this.position.copy(e.position),this.rotation.order=e.rotation.order,this.quaternion.copy(e.quaternion),this.scale.copy(e.scale),this.matrix.copy(e.matrix),this.matrixWorld.copy(e.matrixWorld),this.matrixAutoUpdate=e.matrixAutoUpdate,this.matrixWorldNeedsUpdate=e.matrixWorldNeedsUpdate,this.matrixWorldAutoUpdate=e.matrixWorldAutoUpdate,this.layers.mask=e.layers.mask,this.visible=e.visible,this.castShadow=e.castShadow,this.receiveShadow=e.receiveShadow,this.frustumCulled=e.frustumCulled,this.renderOrder=e.renderOrder,this.userData=JSON.parse(JSON.stringify(e.userData)),t===!0)for(let n=0;n<e.children.length;n++){const i=e.children[n];this.add(i.clone())}return this}}Ut.DEFAULT_UP=new V(0,1,0);Ut.DEFAULT_MATRIX_AUTO_UPDATE=!0;Ut.DEFAULT_MATRIX_WORLD_AUTO_UPDATE=!0;const pn=new V,Rn=new V,Hs=new V,kn=new V,xi=new V,Si=new V,Gl=new V,Ws=new V,Xs=new V,js=new V;class In{constructor(e=new V,t=new V,n=new V){this.a=e,this.b=t,this.c=n}static getNormal(e,t,n,i){i.subVectors(n,t),pn.subVectors(e,t),i.cross(pn);const s=i.lengthSq();return s>0?i.multiplyScalar(1/Math.sqrt(s)):i.set(0,0,0)}static getBarycoord(e,t,n,i,s){pn.subVectors(i,t),Rn.subVectors(n,t),Hs.subVectors(e,t);const a=pn.dot(pn),o=pn.dot(Rn),l=pn.dot(Hs),c=Rn.dot(Rn),u=Rn.dot(Hs),f=a*c-o*o;if(f===0)return s.set(-2,-1,-1);const d=1/f,p=(c*l-o*u)*d,m=(a*u-o*l)*d;return s.set(1-p-m,m,p)}static containsPoint(e,t,n,i){return this.getBarycoord(e,t,n,i,kn),kn.x>=0&&kn.y>=0&&kn.x+kn.y<=1}static getUV(e,t,n,i,s,a,o,l){return this.getBarycoord(e,t,n,i,kn),l.set(0,0),l.addScaledVector(s,kn.x),l.addScaledVector(a,kn.y),l.addScaledVector(o,kn.z),l}static isFrontFacing(e,t,n,i){return pn.subVectors(n,t),Rn.subVectors(e,t),pn.cross(Rn).dot(i)<0}set(e,t,n){return this.a.copy(e),this.b.copy(t),this.c.copy(n),this}setFromPointsAndIndices(e,t,n,i){return this.a.copy(e[t]),this.b.copy(e[n]),this.c.copy(e[i]),this}setFromAttributeAndIndices(e,t,n,i){return this.a.fromBufferAttribute(e,t),this.b.fromBufferAttribute(e,n),this.c.fromBufferAttribute(e,i),this}clone(){return new this.constructor().copy(this)}copy(e){return this.a.copy(e.a),this.b.copy(e.b),this.c.copy(e.c),this}getArea(){return pn.subVectors(this.c,this.b),Rn.subVectors(this.a,this.b),pn.cross(Rn).length()*.5}getMidpoint(e){return e.addVectors(this.a,this.b).add(this.c).multiplyScalar(1/3)}getNormal(e){return In.getNormal(this.a,this.b,this.c,e)}getPlane(e){return e.setFromCoplanarPoints(this.a,this.b,this.c)}getBarycoord(e,t){return In.getBarycoord(e,this.a,this.b,this.c,t)}getUV(e,t,n,i,s){return In.getUV(e,this.a,this.b,this.c,t,n,i,s)}containsPoint(e){return In.containsPoint(e,this.a,this.b,this.c)}isFrontFacing(e){return In.isFrontFacing(this.a,this.b,this.c,e)}intersectsBox(e){return e.intersectsTriangle(this)}closestPointToPoint(e,t){const n=this.a,i=this.b,s=this.c;let a,o;xi.subVectors(i,n),Si.subVectors(s,n),Ws.subVectors(e,n);const l=xi.dot(Ws),c=Si.dot(Ws);if(l<=0&&c<=0)return t.copy(n);Xs.subVectors(e,i);const u=xi.dot(Xs),f=Si.dot(Xs);if(u>=0&&f<=u)return t.copy(i);const d=l*f-u*c;if(d<=0&&l>=0&&u<=0)return a=l/(l-u),t.copy(n).addScaledVector(xi,a);js.subVectors(e,s);const p=xi.dot(js),m=Si.dot(js);if(m>=0&&p<=m)return t.copy(s);const h=p*c-l*m;if(h<=0&&c>=0&&m<=0)return o=c/(c-m),t.copy(n).addScaledVector(Si,o);const _=u*m-p*f;if(_<=0&&f-u>=0&&p-m>=0)return Gl.subVectors(s,i),o=(f-u)/(f-u+(p-m)),t.copy(i).addScaledVector(Gl,o);const g=1/(_+h+d);return a=h*g,o=d*g,t.copy(n).addScaledVector(xi,a).addScaledVector(Si,o)}equals(e){return e.a.equals(this.a)&&e.b.equals(this.b)&&e.c.equals(this.c)}}let k_=0;class Er extends Xi{constructor(){super(),this.isMaterial=!0,Object.defineProperty(this,"id",{value:k_++}),this.uuid=ji(),this.name="",this.type="Material",this.blending=Ni,this.side=Zn,this.vertexColors=!1,this.opacity=1,this.transparent=!1,this.blendSrc=Vc,this.blendDst=Gc,this.blendEquation=Ai,this.blendSrcAlpha=null,this.blendDstAlpha=null,this.blendEquationAlpha=null,this.depthFunc=la,this.depthTest=!0,this.depthWrite=!0,this.stencilWriteMask=255,this.stencilFunc=i_,this.stencilRef=0,this.stencilFuncMask=255,this.stencilFail=Rs,this.stencilZFail=Rs,this.stencilZPass=Rs,this.stencilWrite=!1,this.clippingPlanes=null,this.clipIntersection=!1,this.clipShadows=!1,this.shadowSide=null,this.colorWrite=!0,this.precision=null,this.polygonOffset=!1,this.polygonOffsetFactor=0,this.polygonOffsetUnits=0,this.dithering=!1,this.alphaToCoverage=!1,this.premultipliedAlpha=!1,this.forceSinglePass=!1,this.visible=!0,this.toneMapped=!0,this.userData={},this.version=0,this._alphaTest=0}get alphaTest(){return this._alphaTest}set alphaTest(e){this._alphaTest>0!=e>0&&this.version++,this._alphaTest=e}onBuild(){}onBeforeRender(){}onBeforeCompile(){}customProgramCacheKey(){return this.onBeforeCompile.toString()}setValues(e){if(e!==void 0)for(const t in e){const n=e[t];if(n===void 0){console.warn("THREE.Material: '"+t+"' parameter is undefined.");continue}const i=this[t];if(i===void 0){console.warn("THREE."+this.type+": '"+t+"' is not a property of this material.");continue}i&&i.isColor?i.set(n):i&&i.isVector3&&n&&n.isVector3?i.copy(n):this[t]=n}}toJSON(e){const t=e===void 0||typeof e=="string";t&&(e={textures:{},images:{}});const n={metadata:{version:4.5,type:"Material",generator:"Material.toJSON"}};n.uuid=this.uuid,n.type=this.type,this.name!==""&&(n.name=this.name),this.color&&this.color.isColor&&(n.color=this.color.getHex()),this.roughness!==void 0&&(n.roughness=this.roughness),this.metalness!==void 0&&(n.metalness=this.metalness),this.sheen!==void 0&&(n.sheen=this.sheen),this.sheenColor&&this.sheenColor.isColor&&(n.sheenColor=this.sheenColor.getHex()),this.sheenRoughness!==void 0&&(n.sheenRoughness=this.sheenRoughness),this.emissive&&this.emissive.isColor&&(n.emissive=this.emissive.getHex()),this.emissiveIntensity&&this.emissiveIntensity!==1&&(n.emissiveIntensity=this.emissiveIntensity),this.specular&&this.specular.isColor&&(n.specular=this.specular.getHex()),this.specularIntensity!==void 0&&(n.specularIntensity=this.specularIntensity),this.specularColor&&this.specularColor.isColor&&(n.specularColor=this.specularColor.getHex()),this.shininess!==void 0&&(n.shininess=this.shininess),this.clearcoat!==void 0&&(n.clearcoat=this.clearcoat),this.clearcoatRoughness!==void 0&&(n.clearcoatRoughness=this.clearcoatRoughness),this.clearcoatMap&&this.clearcoatMap.isTexture&&(n.clearcoatMap=this.clearcoatMap.toJSON(e).uuid),this.clearcoatRoughnessMap&&this.clearcoatRoughnessMap.isTexture&&(n.clearcoatRoughnessMap=this.clearcoatRoughnessMap.toJSON(e).uuid),this.clearcoatNormalMap&&this.clearcoatNormalMap.isTexture&&(n.clearcoatNormalMap=this.clearcoatNormalMap.toJSON(e).uuid,n.clearcoatNormalScale=this.clearcoatNormalScale.toArray()),this.iridescence!==void 0&&(n.iridescence=this.iridescence),this.iridescenceIOR!==void 0&&(n.iridescenceIOR=this.iridescenceIOR),this.iridescenceThicknessRange!==void 0&&(n.iridescenceThicknessRange=this.iridescenceThicknessRange),this.iridescenceMap&&this.iridescenceMap.isTexture&&(n.iridescenceMap=this.iridescenceMap.toJSON(e).uuid),this.iridescenceThicknessMap&&this.iridescenceThicknessMap.isTexture&&(n.iridescenceThicknessMap=this.iridescenceThicknessMap.toJSON(e).uuid),this.map&&this.map.isTexture&&(n.map=this.map.toJSON(e).uuid),this.matcap&&this.matcap.isTexture&&(n.matcap=this.matcap.toJSON(e).uuid),this.alphaMap&&this.alphaMap.isTexture&&(n.alphaMap=this.alphaMap.toJSON(e).uuid),this.lightMap&&this.lightMap.isTexture&&(n.lightMap=this.lightMap.toJSON(e).uuid,n.lightMapIntensity=this.lightMapIntensity),this.aoMap&&this.aoMap.isTexture&&(n.aoMap=this.aoMap.toJSON(e).uuid,n.aoMapIntensity=this.aoMapIntensity),this.bumpMap&&this.bumpMap.isTexture&&(n.bumpMap=this.bumpMap.toJSON(e).uuid,n.bumpScale=this.bumpScale),this.normalMap&&this.normalMap.isTexture&&(n.normalMap=this.normalMap.toJSON(e).uuid,n.normalMapType=this.normalMapType,n.normalScale=this.normalScale.toArray()),this.displacementMap&&this.displacementMap.isTexture&&(n.displacementMap=this.displacementMap.toJSON(e).uuid,n.displacementScale=this.displacementScale,n.displacementBias=this.displacementBias),this.roughnessMap&&this.roughnessMap.isTexture&&(n.roughnessMap=this.roughnessMap.toJSON(e).uuid),this.metalnessMap&&this.metalnessMap.isTexture&&(n.metalnessMap=this.metalnessMap.toJSON(e).uuid),this.emissiveMap&&this.emissiveMap.isTexture&&(n.emissiveMap=this.emissiveMap.toJSON(e).uuid),this.specularMap&&this.specularMap.isTexture&&(n.specularMap=this.specularMap.toJSON(e).uuid),this.specularIntensityMap&&this.specularIntensityMap.isTexture&&(n.specularIntensityMap=this.specularIntensityMap.toJSON(e).uuid),this.specularColorMap&&this.specularColorMap.isTexture&&(n.specularColorMap=this.specularColorMap.toJSON(e).uuid),this.envMap&&this.envMap.isTexture&&(n.envMap=this.envMap.toJSON(e).uuid,this.combine!==void 0&&(n.combine=this.combine)),this.envMapIntensity!==void 0&&(n.envMapIntensity=this.envMapIntensity),this.reflectivity!==void 0&&(n.reflectivity=this.reflectivity),this.refractionRatio!==void 0&&(n.refractionRatio=this.refractionRatio),this.gradientMap&&this.gradientMap.isTexture&&(n.gradientMap=this.gradientMap.toJSON(e).uuid),this.transmission!==void 0&&(n.transmission=this.transmission),this.transmissionMap&&this.transmissionMap.isTexture&&(n.transmissionMap=this.transmissionMap.toJSON(e).uuid),this.thickness!==void 0&&(n.thickness=this.thickness),this.thicknessMap&&this.thicknessMap.isTexture&&(n.thicknessMap=this.thicknessMap.toJSON(e).uuid),this.attenuationDistance!==void 0&&this.attenuationDistance!==1/0&&(n.attenuationDistance=this.attenuationDistance),this.attenuationColor!==void 0&&(n.attenuationColor=this.attenuationColor.getHex()),this.size!==void 0&&(n.size=this.size),this.shadowSide!==null&&(n.shadowSide=this.shadowSide),this.sizeAttenuation!==void 0&&(n.sizeAttenuation=this.sizeAttenuation),this.blending!==Ni&&(n.blending=this.blending),this.side!==Zn&&(n.side=this.side),this.vertexColors&&(n.vertexColors=!0),this.opacity<1&&(n.opacity=this.opacity),this.transparent===!0&&(n.transparent=this.transparent),n.depthFunc=this.depthFunc,n.depthTest=this.depthTest,n.depthWrite=this.depthWrite,n.colorWrite=this.colorWrite,n.stencilWrite=this.stencilWrite,n.stencilWriteMask=this.stencilWriteMask,n.stencilFunc=this.stencilFunc,n.stencilRef=this.stencilRef,n.stencilFuncMask=this.stencilFuncMask,n.stencilFail=this.stencilFail,n.stencilZFail=this.stencilZFail,n.stencilZPass=this.stencilZPass,this.rotation!==void 0&&this.rotation!==0&&(n.rotation=this.rotation),this.polygonOffset===!0&&(n.polygonOffset=!0),this.polygonOffsetFactor!==0&&(n.polygonOffsetFactor=this.polygonOffsetFactor),this.polygonOffsetUnits!==0&&(n.polygonOffsetUnits=this.polygonOffsetUnits),this.linewidth!==void 0&&this.linewidth!==1&&(n.linewidth=this.linewidth),this.dashSize!==void 0&&(n.dashSize=this.dashSize),this.gapSize!==void 0&&(n.gapSize=this.gapSize),this.scale!==void 0&&(n.scale=this.scale),this.dithering===!0&&(n.dithering=!0),this.alphaTest>0&&(n.alphaTest=this.alphaTest),this.alphaToCoverage===!0&&(n.alphaToCoverage=this.alphaToCoverage),this.premultipliedAlpha===!0&&(n.premultipliedAlpha=this.premultipliedAlpha),this.forceSinglePass===!0&&(n.forceSinglePass=this.forceSinglePass),this.wireframe===!0&&(n.wireframe=this.wireframe),this.wireframeLinewidth>1&&(n.wireframeLinewidth=this.wireframeLinewidth),this.wireframeLinecap!=="round"&&(n.wireframeLinecap=this.wireframeLinecap),this.wireframeLinejoin!=="round"&&(n.wireframeLinejoin=this.wireframeLinejoin),this.flatShading===!0&&(n.flatShading=this.flatShading),this.visible===!1&&(n.visible=!1),this.toneMapped===!1&&(n.toneMapped=!1),this.fog===!1&&(n.fog=!1),Object.keys(this.userData).length>0&&(n.userData=this.userData);function i(s){const a=[];for(const o in s){const l=s[o];delete l.metadata,a.push(l)}return a}if(t){const s=i(e.textures),a=i(e.images);s.length>0&&(n.textures=s),a.length>0&&(n.images=a)}return n}clone(){return new this.constructor().copy(this)}copy(e){this.name=e.name,this.blending=e.blending,this.side=e.side,this.vertexColors=e.vertexColors,this.opacity=e.opacity,this.transparent=e.transparent,this.blendSrc=e.blendSrc,this.blendDst=e.blendDst,this.blendEquation=e.blendEquation,this.blendSrcAlpha=e.blendSrcAlpha,this.blendDstAlpha=e.blendDstAlpha,this.blendEquationAlpha=e.blendEquationAlpha,this.depthFunc=e.depthFunc,this.depthTest=e.depthTest,this.depthWrite=e.depthWrite,this.stencilWriteMask=e.stencilWriteMask,this.stencilFunc=e.stencilFunc,this.stencilRef=e.stencilRef,this.stencilFuncMask=e.stencilFuncMask,this.stencilFail=e.stencilFail,this.stencilZFail=e.stencilZFail,this.stencilZPass=e.stencilZPass,this.stencilWrite=e.stencilWrite;const t=e.clippingPlanes;let n=null;if(t!==null){const i=t.length;n=new Array(i);for(let s=0;s!==i;++s)n[s]=t[s].clone()}return this.clippingPlanes=n,this.clipIntersection=e.clipIntersection,this.clipShadows=e.clipShadows,this.shadowSide=e.shadowSide,this.colorWrite=e.colorWrite,this.precision=e.precision,this.polygonOffset=e.polygonOffset,this.polygonOffsetFactor=e.polygonOffsetFactor,this.polygonOffsetUnits=e.polygonOffsetUnits,this.dithering=e.dithering,this.alphaTest=e.alphaTest,this.alphaToCoverage=e.alphaToCoverage,this.premultipliedAlpha=e.premultipliedAlpha,this.forceSinglePass=e.forceSinglePass,this.visible=e.visible,this.toneMapped=e.toneMapped,this.userData=JSON.parse(JSON.stringify(e.userData)),this}dispose(){this.dispatchEvent({type:"dispose"})}set needsUpdate(e){e===!0&&this.version++}}const Qc={aliceblue:15792383,antiquewhite:16444375,aqua:65535,aquamarine:8388564,azure:15794175,beige:16119260,bisque:16770244,black:0,blanchedalmond:16772045,blue:255,blueviolet:9055202,brown:10824234,burlywood:14596231,cadetblue:6266528,chartreuse:8388352,chocolate:13789470,coral:16744272,cornflowerblue:6591981,cornsilk:16775388,crimson:14423100,cyan:65535,darkblue:139,darkcyan:35723,darkgoldenrod:12092939,darkgray:11119017,darkgreen:25600,darkgrey:11119017,darkkhaki:12433259,darkmagenta:9109643,darkolivegreen:5597999,darkorange:16747520,darkorchid:10040012,darkred:9109504,darksalmon:15308410,darkseagreen:9419919,darkslateblue:4734347,darkslategray:3100495,darkslategrey:3100495,darkturquoise:52945,darkviolet:9699539,deeppink:16716947,deepskyblue:49151,dimgray:6908265,dimgrey:6908265,dodgerblue:2003199,firebrick:11674146,floralwhite:16775920,forestgreen:2263842,fuchsia:16711935,gainsboro:14474460,ghostwhite:16316671,gold:16766720,goldenrod:14329120,gray:8421504,green:32768,greenyellow:11403055,grey:8421504,honeydew:15794160,hotpink:16738740,indianred:13458524,indigo:4915330,ivory:16777200,khaki:15787660,lavender:15132410,lavenderblush:16773365,lawngreen:8190976,lemonchiffon:16775885,lightblue:11393254,lightcoral:15761536,lightcyan:14745599,lightgoldenrodyellow:16448210,lightgray:13882323,lightgreen:9498256,lightgrey:13882323,lightpink:16758465,lightsalmon:16752762,lightseagreen:2142890,lightskyblue:8900346,lightslategray:7833753,lightslategrey:7833753,lightsteelblue:11584734,lightyellow:16777184,lime:65280,limegreen:3329330,linen:16445670,magenta:16711935,maroon:8388608,mediumaquamarine:6737322,mediumblue:205,mediumorchid:12211667,mediumpurple:9662683,mediumseagreen:3978097,mediumslateblue:8087790,mediumspringgreen:64154,mediumturquoise:4772300,mediumvioletred:13047173,midnightblue:1644912,mintcream:16121850,mistyrose:16770273,moccasin:16770229,navajowhite:16768685,navy:128,oldlace:16643558,olive:8421376,olivedrab:7048739,orange:16753920,orangered:16729344,orchid:14315734,palegoldenrod:15657130,palegreen:10025880,paleturquoise:11529966,palevioletred:14381203,papayawhip:16773077,peachpuff:16767673,peru:13468991,pink:16761035,plum:14524637,powderblue:11591910,purple:8388736,rebeccapurple:6697881,red:16711680,rosybrown:12357519,royalblue:4286945,saddlebrown:9127187,salmon:16416882,sandybrown:16032864,seagreen:3050327,seashell:16774638,sienna:10506797,silver:12632256,skyblue:8900331,slateblue:6970061,slategray:7372944,slategrey:7372944,snow:16775930,springgreen:65407,steelblue:4620980,tan:13808780,teal:32896,thistle:14204888,tomato:16737095,turquoise:4251856,violet:15631086,wheat:16113331,white:16777215,whitesmoke:16119285,yellow:16776960,yellowgreen:10145074},mn={h:0,s:0,l:0},zr={h:0,s:0,l:0};function qs(r,e,t){return t<0&&(t+=1),t>1&&(t-=1),t<1/6?r+(e-r)*6*t:t<1/2?e:t<2/3?r+(e-r)*6*(2/3-t):r}class mt{constructor(e,t,n){return this.isColor=!0,this.r=1,this.g=1,this.b=1,t===void 0&&n===void 0?this.set(e):this.setRGB(e,t,n)}set(e){return e&&e.isColor?this.copy(e):typeof e=="number"?this.setHex(e):typeof e=="string"&&this.setStyle(e),this}setScalar(e){return this.r=e,this.g=e,this.b=e,this}setHex(e,t=xn){return e=Math.floor(e),this.r=(e>>16&255)/255,this.g=(e>>8&255)/255,this.b=(e&255)/255,jt.toWorkingColorSpace(this,t),this}setRGB(e,t,n,i=jt.workingColorSpace){return this.r=e,this.g=t,this.b=n,jt.toWorkingColorSpace(this,i),this}setHSL(e,t,n,i=jt.workingColorSpace){if(e=wa(e,1),t=$t(t,0,1),n=$t(n,0,1),t===0)this.r=this.g=this.b=n;else{const s=n<=.5?n*(1+t):n+t-n*t,a=2*n-s;this.r=qs(a,s,e+1/3),this.g=qs(a,s,e),this.b=qs(a,s,e-1/3)}return jt.toWorkingColorSpace(this,i),this}setStyle(e,t=xn){function n(s){s!==void 0&&parseFloat(s)<1&&console.warn("THREE.Color: Alpha component of "+e+" will be ignored.")}let i;if(i=/^(\w+)\(([^\)]*)\)/.exec(e)){let s;const a=i[1],o=i[2];switch(a){case"rgb":case"rgba":if(s=/^\s*(\d+)\s*,\s*(\d+)\s*,\s*(\d+)\s*(?:,\s*(\d*\.?\d+)\s*)?$/.exec(o))return this.r=Math.min(255,parseInt(s[1],10))/255,this.g=Math.min(255,parseInt(s[2],10))/255,this.b=Math.min(255,parseInt(s[3],10))/255,jt.toWorkingColorSpace(this,t),n(s[4]),this;if(s=/^\s*(\d+)\%\s*,\s*(\d+)\%\s*,\s*(\d+)\%\s*(?:,\s*(\d*\.?\d+)\s*)?$/.exec(o))return this.r=Math.min(100,parseInt(s[1],10))/100,this.g=Math.min(100,parseInt(s[2],10))/100,this.b=Math.min(100,parseInt(s[3],10))/100,jt.toWorkingColorSpace(this,t),n(s[4]),this;break;case"hsl":case"hsla":if(s=/^\s*(\d*\.?\d+)\s*,\s*(\d*\.?\d+)\%\s*,\s*(\d*\.?\d+)\%\s*(?:,\s*(\d*\.?\d+)\s*)?$/.exec(o)){const l=parseFloat(s[1])/360,c=parseFloat(s[2])/100,u=parseFloat(s[3])/100;return n(s[4]),this.setHSL(l,c,u,t)}break;default:console.warn("THREE.Color: Unknown color model "+e)}}else if(i=/^\#([A-Fa-f\d]+)$/.exec(e)){const s=i[1],a=s.length;if(a===3)return this.r=parseInt(s.charAt(0)+s.charAt(0),16)/255,this.g=parseInt(s.charAt(1)+s.charAt(1),16)/255,this.b=parseInt(s.charAt(2)+s.charAt(2),16)/255,jt.toWorkingColorSpace(this,t),this;if(a===6)return this.r=parseInt(s.charAt(0)+s.charAt(1),16)/255,this.g=parseInt(s.charAt(2)+s.charAt(3),16)/255,this.b=parseInt(s.charAt(4)+s.charAt(5),16)/255,jt.toWorkingColorSpace(this,t),this;console.warn("THREE.Color: Invalid hex color "+e)}else if(e&&e.length>0)return this.setColorName(e,t);return this}setColorName(e,t=xn){const n=Qc[e.toLowerCase()];return n!==void 0?this.setHex(n,t):console.warn("THREE.Color: Unknown color "+e),this}clone(){return new this.constructor(this.r,this.g,this.b)}copy(e){return this.r=e.r,this.g=e.g,this.b=e.b,this}copySRGBToLinear(e){return this.r=Fi(e.r),this.g=Fi(e.g),this.b=Fi(e.b),this}copyLinearToSRGB(e){return this.r=Ns(e.r),this.g=Ns(e.g),this.b=Ns(e.b),this}convertSRGBToLinear(){return this.copySRGBToLinear(this),this}convertLinearToSRGB(){return this.copyLinearToSRGB(this),this}getHex(e=xn){return jt.fromWorkingColorSpace(Vt.copy(this),e),$t(Vt.r*255,0,255)<<16^$t(Vt.g*255,0,255)<<8^$t(Vt.b*255,0,255)<<0}getHexString(e=xn){return("000000"+this.getHex(e).toString(16)).slice(-6)}getHSL(e,t=jt.workingColorSpace){jt.fromWorkingColorSpace(Vt.copy(this),t);const n=Vt.r,i=Vt.g,s=Vt.b,a=Math.max(n,i,s),o=Math.min(n,i,s);let l,c;const u=(o+a)/2;if(o===a)l=0,c=0;else{const f=a-o;switch(c=u<=.5?f/(a+o):f/(2-a-o),a){case n:l=(i-s)/f+(i<s?6:0);break;case i:l=(s-n)/f+2;break;case s:l=(n-i)/f+4;break}l/=6}return e.h=l,e.s=c,e.l=u,e}getRGB(e,t=jt.workingColorSpace){return jt.fromWorkingColorSpace(Vt.copy(this),t),e.r=Vt.r,e.g=Vt.g,e.b=Vt.b,e}getStyle(e=xn){jt.fromWorkingColorSpace(Vt.copy(this),e);const t=Vt.r,n=Vt.g,i=Vt.b;return e!==xn?`color(${e} ${t.toFixed(3)} ${n.toFixed(3)} ${i.toFixed(3)})`:`rgb(${t*255|0},${n*255|0},${i*255|0})`}offsetHSL(e,t,n){return this.getHSL(mn),mn.h+=e,mn.s+=t,mn.l+=n,this.setHSL(mn.h,mn.s,mn.l),this}add(e){return this.r+=e.r,this.g+=e.g,this.b+=e.b,this}addColors(e,t){return this.r=e.r+t.r,this.g=e.g+t.g,this.b=e.b+t.b,this}addScalar(e){return this.r+=e,this.g+=e,this.b+=e,this}sub(e){return this.r=Math.max(0,this.r-e.r),this.g=Math.max(0,this.g-e.g),this.b=Math.max(0,this.b-e.b),this}multiply(e){return this.r*=e.r,this.g*=e.g,this.b*=e.b,this}multiplyScalar(e){return this.r*=e,this.g*=e,this.b*=e,this}lerp(e,t){return this.r+=(e.r-this.r)*t,this.g+=(e.g-this.g)*t,this.b+=(e.b-this.b)*t,this}lerpColors(e,t,n){return this.r=e.r+(t.r-e.r)*n,this.g=e.g+(t.g-e.g)*n,this.b=e.b+(t.b-e.b)*n,this}lerpHSL(e,t){this.getHSL(mn),e.getHSL(zr);const n=pr(mn.h,zr.h,t),i=pr(mn.s,zr.s,t),s=pr(mn.l,zr.l,t);return this.setHSL(n,i,s),this}equals(e){return e.r===this.r&&e.g===this.g&&e.b===this.b}fromArray(e,t=0){return this.r=e[t],this.g=e[t+1],this.b=e[t+2],this}toArray(e=[],t=0){return e[t]=this.r,e[t+1]=this.g,e[t+2]=this.b,e}fromBufferAttribute(e,t){return this.r=e.getX(t),this.g=e.getY(t),this.b=e.getZ(t),this}toJSON(){return this.getHex()}*[Symbol.iterator](){yield this.r,yield this.g,yield this.b}}const Vt=new mt;mt.NAMES=Qc;class gs extends Er{constructor(e){super(),this.isMeshBasicMaterial=!0,this.type="MeshBasicMaterial",this.color=new mt(16777215),this.map=null,this.lightMap=null,this.lightMapIntensity=1,this.aoMap=null,this.aoMapIntensity=1,this.specularMap=null,this.alphaMap=null,this.envMap=null,this.combine=Hc,this.reflectivity=1,this.refractionRatio=.98,this.wireframe=!1,this.wireframeLinewidth=1,this.wireframeLinecap="round",this.wireframeLinejoin="round",this.fog=!0,this.setValues(e)}copy(e){return super.copy(e),this.color.copy(e.color),this.map=e.map,this.lightMap=e.lightMap,this.lightMapIntensity=e.lightMapIntensity,this.aoMap=e.aoMap,this.aoMapIntensity=e.aoMapIntensity,this.specularMap=e.specularMap,this.alphaMap=e.alphaMap,this.envMap=e.envMap,this.combine=e.combine,this.reflectivity=e.reflectivity,this.refractionRatio=e.refractionRatio,this.wireframe=e.wireframe,this.wireframeLinewidth=e.wireframeLinewidth,this.wireframeLinecap=e.wireframeLinecap,this.wireframeLinejoin=e.wireframeLinejoin,this.fog=e.fog,this}}const Tt=new V,Fr=new lt;class Cn{constructor(e,t,n=!1){if(Array.isArray(e))throw new TypeError("THREE.BufferAttribute: array should be a Typed Array.");this.isBufferAttribute=!0,this.name="",this.array=e,this.itemSize=t,this.count=e!==void 0?e.length/t:0,this.normalized=n,this.usage=Dl,this.updateRange={offset:0,count:-1},this.version=0}onUploadCallback(){}set needsUpdate(e){e===!0&&this.version++}setUsage(e){return this.usage=e,this}copy(e){return this.name=e.name,this.array=new e.array.constructor(e.array),this.itemSize=e.itemSize,this.count=e.count,this.normalized=e.normalized,this.usage=e.usage,this}copyAt(e,t,n){e*=this.itemSize,n*=t.itemSize;for(let i=0,s=this.itemSize;i<s;i++)this.array[e+i]=t.array[n+i];return this}copyArray(e){return this.array.set(e),this}applyMatrix3(e){if(this.itemSize===2)for(let t=0,n=this.count;t<n;t++)Fr.fromBufferAttribute(this,t),Fr.applyMatrix3(e),this.setXY(t,Fr.x,Fr.y);else if(this.itemSize===3)for(let t=0,n=this.count;t<n;t++)Tt.fromBufferAttribute(this,t),Tt.applyMatrix3(e),this.setXYZ(t,Tt.x,Tt.y,Tt.z);return this}applyMatrix4(e){for(let t=0,n=this.count;t<n;t++)Tt.fromBufferAttribute(this,t),Tt.applyMatrix4(e),this.setXYZ(t,Tt.x,Tt.y,Tt.z);return this}applyNormalMatrix(e){for(let t=0,n=this.count;t<n;t++)Tt.fromBufferAttribute(this,t),Tt.applyNormalMatrix(e),this.setXYZ(t,Tt.x,Tt.y,Tt.z);return this}transformDirection(e){for(let t=0,n=this.count;t<n;t++)Tt.fromBufferAttribute(this,t),Tt.transformDirection(e),this.setXYZ(t,Tt.x,Tt.y,Tt.z);return this}set(e,t=0){return this.array.set(e,t),this}getX(e){let t=this.array[e*this.itemSize];return this.normalized&&(t=or(t,this.array)),t}setX(e,t){return this.normalized&&(t=Jt(t,this.array)),this.array[e*this.itemSize]=t,this}getY(e){let t=this.array[e*this.itemSize+1];return this.normalized&&(t=or(t,this.array)),t}setY(e,t){return this.normalized&&(t=Jt(t,this.array)),this.array[e*this.itemSize+1]=t,this}getZ(e){let t=this.array[e*this.itemSize+2];return this.normalized&&(t=or(t,this.array)),t}setZ(e,t){return this.normalized&&(t=Jt(t,this.array)),this.array[e*this.itemSize+2]=t,this}getW(e){let t=this.array[e*this.itemSize+3];return this.normalized&&(t=or(t,this.array)),t}setW(e,t){return this.normalized&&(t=Jt(t,this.array)),this.array[e*this.itemSize+3]=t,this}setXY(e,t,n){return e*=this.itemSize,this.normalized&&(t=Jt(t,this.array),n=Jt(n,this.array)),this.array[e+0]=t,this.array[e+1]=n,this}setXYZ(e,t,n,i){return e*=this.itemSize,this.normalized&&(t=Jt(t,this.array),n=Jt(n,this.array),i=Jt(i,this.array)),this.array[e+0]=t,this.array[e+1]=n,this.array[e+2]=i,this}setXYZW(e,t,n,i,s){return e*=this.itemSize,this.normalized&&(t=Jt(t,this.array),n=Jt(n,this.array),i=Jt(i,this.array),s=Jt(s,this.array)),this.array[e+0]=t,this.array[e+1]=n,this.array[e+2]=i,this.array[e+3]=s,this}onUpload(e){return this.onUploadCallback=e,this}clone(){return new this.constructor(this.array,this.itemSize).copy(this)}toJSON(){const e={itemSize:this.itemSize,type:this.array.constructor.name,array:Array.from(this.array),normalized:this.normalized};return this.name!==""&&(e.name=this.name),this.usage!==Dl&&(e.usage=this.usage),(this.updateRange.offset!==0||this.updateRange.count!==-1)&&(e.updateRange=this.updateRange),e}copyColorsArray(){console.error("THREE.BufferAttribute: copyColorsArray() was removed in r144.")}copyVector2sArray(){console.error("THREE.BufferAttribute: copyVector2sArray() was removed in r144.")}copyVector3sArray(){console.error("THREE.BufferAttribute: copyVector3sArray() was removed in r144.")}copyVector4sArray(){console.error("THREE.BufferAttribute: copyVector4sArray() was removed in r144.")}}class $c extends Cn{constructor(e,t,n){super(new Uint16Array(e),t,n)}}class eu extends Cn{constructor(e,t,n){super(new Uint32Array(e),t,n)}}class vt extends Cn{constructor(e,t,n){super(new Float32Array(e),t,n)}}let I_=0;const un=new Lt,Ys=new Ut,Ci=new V,sn=new Cr,$i=new Cr,It=new V;class en extends Xi{constructor(){super(),this.isBufferGeometry=!0,Object.defineProperty(this,"id",{value:I_++}),this.uuid=ji(),this.name="",this.type="BufferGeometry",this.index=null,this.attributes={},this.morphAttributes={},this.morphTargetsRelative=!1,this.groups=[],this.boundingBox=null,this.boundingSphere=null,this.drawRange={start:0,count:1/0},this.userData={}}getIndex(){return this.index}setIndex(e){return Array.isArray(e)?this.index=new(Yc(e)?eu:$c)(e,1):this.index=e,this}getAttribute(e){return this.attributes[e]}setAttribute(e,t){return this.attributes[e]=t,this}deleteAttribute(e){return delete this.attributes[e],this}hasAttribute(e){return this.attributes[e]!==void 0}addGroup(e,t,n=0){this.groups.push({start:e,count:t,materialIndex:n})}clearGroups(){this.groups=[]}setDrawRange(e,t){this.drawRange.start=e,this.drawRange.count=t}applyMatrix4(e){const t=this.attributes.position;t!==void 0&&(t.applyMatrix4(e),t.needsUpdate=!0);const n=this.attributes.normal;if(n!==void 0){const s=new Kt().getNormalMatrix(e);n.applyNormalMatrix(s),n.needsUpdate=!0}const i=this.attributes.tangent;return i!==void 0&&(i.transformDirection(e),i.needsUpdate=!0),this.boundingBox!==null&&this.computeBoundingBox(),this.boundingSphere!==null&&this.computeBoundingSphere(),this}applyQuaternion(e){return un.makeRotationFromQuaternion(e),this.applyMatrix4(un),this}rotateX(e){return un.makeRotationX(e),this.applyMatrix4(un),this}rotateY(e){return un.makeRotationY(e),this.applyMatrix4(un),this}rotateZ(e){return un.makeRotationZ(e),this.applyMatrix4(un),this}translate(e,t,n){return un.makeTranslation(e,t,n),this.applyMatrix4(un),this}scale(e,t,n){return un.makeScale(e,t,n),this.applyMatrix4(un),this}lookAt(e){return Ys.lookAt(e),Ys.updateMatrix(),this.applyMatrix4(Ys.matrix),this}center(){return this.computeBoundingBox(),this.boundingBox.getCenter(Ci).negate(),this.translate(Ci.x,Ci.y,Ci.z),this}setFromPoints(e){const t=[];for(let n=0,i=e.length;n<i;n++){const s=e[n];t.push(s.x,s.y,s.z||0)}return this.setAttribute("position",new vt(t,3)),this}computeBoundingBox(){this.boundingBox===null&&(this.boundingBox=new Cr);const e=this.attributes.position,t=this.morphAttributes.position;if(e&&e.isGLBufferAttribute){console.error('THREE.BufferGeometry.computeBoundingBox(): GLBufferAttribute requires a manual bounding box. Alternatively set "mesh.frustumCulled" to "false".',this),this.boundingBox.set(new V(-1/0,-1/0,-1/0),new V(1/0,1/0,1/0));return}if(e!==void 0){if(this.boundingBox.setFromBufferAttribute(e),t)for(let n=0,i=t.length;n<i;n++){const s=t[n];sn.setFromBufferAttribute(s),this.morphTargetsRelative?(It.addVectors(this.boundingBox.min,sn.min),this.boundingBox.expandByPoint(It),It.addVectors(this.boundingBox.max,sn.max),this.boundingBox.expandByPoint(It)):(this.boundingBox.expandByPoint(sn.min),this.boundingBox.expandByPoint(sn.max))}}else this.boundingBox.makeEmpty();(isNaN(this.boundingBox.min.x)||isNaN(this.boundingBox.min.y)||isNaN(this.boundingBox.min.z))&&console.error('THREE.BufferGeometry.computeBoundingBox(): Computed min/max have NaN values. The "position" attribute is likely to have NaN values.',this)}computeBoundingSphere(){this.boundingSphere===null&&(this.boundingSphere=new _s);const e=this.attributes.position,t=this.morphAttributes.position;if(e&&e.isGLBufferAttribute){console.error('THREE.BufferGeometry.computeBoundingSphere(): GLBufferAttribute requires a manual bounding sphere. Alternatively set "mesh.frustumCulled" to "false".',this),this.boundingSphere.set(new V,1/0);return}if(e){const n=this.boundingSphere.center;if(sn.setFromBufferAttribute(e),t)for(let s=0,a=t.length;s<a;s++){const o=t[s];$i.setFromBufferAttribute(o),this.morphTargetsRelative?(It.addVectors(sn.min,$i.min),sn.expandByPoint(It),It.addVectors(sn.max,$i.max),sn.expandByPoint(It)):(sn.expandByPoint($i.min),sn.expandByPoint($i.max))}sn.getCenter(n);let i=0;for(let s=0,a=e.count;s<a;s++)It.fromBufferAttribute(e,s),i=Math.max(i,n.distanceToSquared(It));if(t)for(let s=0,a=t.length;s<a;s++){const o=t[s],l=this.morphTargetsRelative;for(let c=0,u=o.count;c<u;c++)It.fromBufferAttribute(o,c),l&&(Ci.fromBufferAttribute(e,c),It.add(Ci)),i=Math.max(i,n.distanceToSquared(It))}this.boundingSphere.radius=Math.sqrt(i),isNaN(this.boundingSphere.radius)&&console.error('THREE.BufferGeometry.computeBoundingSphere(): Computed radius is NaN. The "position" attribute is likely to have NaN values.',this)}}computeTangents(){const e=this.index,t=this.attributes;if(e===null||t.position===void 0||t.normal===void 0||t.uv===void 0){console.error("THREE.BufferGeometry: .computeTangents() failed. Missing required attributes (index, position, normal or uv)");return}const n=e.array,i=t.position.array,s=t.normal.array,a=t.uv.array,o=i.length/3;this.hasAttribute("tangent")===!1&&this.setAttribute("tangent",new Cn(new Float32Array(4*o),4));const l=this.getAttribute("tangent").array,c=[],u=[];for(let R=0;R<o;R++)c[R]=new V,u[R]=new V;const f=new V,d=new V,p=new V,m=new lt,h=new lt,_=new lt,g=new V,v=new V;function b(R,k,G){f.fromArray(i,R*3),d.fromArray(i,k*3),p.fromArray(i,G*3),m.fromArray(a,R*2),h.fromArray(a,k*2),_.fromArray(a,G*2),d.sub(f),p.sub(f),h.sub(m),_.sub(m);const F=1/(h.x*_.y-_.x*h.y);!isFinite(F)||(g.copy(d).multiplyScalar(_.y).addScaledVector(p,-h.y).multiplyScalar(F),v.copy(p).multiplyScalar(h.x).addScaledVector(d,-_.x).multiplyScalar(F),c[R].add(g),c[k].add(g),c[G].add(g),u[R].add(v),u[k].add(v),u[G].add(v))}let w=this.groups;w.length===0&&(w=[{start:0,count:n.length}]);for(let R=0,k=w.length;R<k;++R){const G=w[R],F=G.start,O=G.count;for(let X=F,le=F+O;X<le;X+=3)b(n[X+0],n[X+1],n[X+2])}const y=new V,x=new V,S=new V,M=new V;function T(R){S.fromArray(s,R*3),M.copy(S);const k=c[R];y.copy(k),y.sub(S.multiplyScalar(S.dot(k))).normalize(),x.crossVectors(M,k);const F=x.dot(u[R])<0?-1:1;l[R*4]=y.x,l[R*4+1]=y.y,l[R*4+2]=y.z,l[R*4+3]=F}for(let R=0,k=w.length;R<k;++R){const G=w[R],F=G.start,O=G.count;for(let X=F,le=F+O;X<le;X+=3)T(n[X+0]),T(n[X+1]),T(n[X+2])}}computeVertexNormals(){const e=this.index,t=this.getAttribute("position");if(t!==void 0){let n=this.getAttribute("normal");if(n===void 0)n=new Cn(new Float32Array(t.count*3),3),this.setAttribute("normal",n);else for(let d=0,p=n.count;d<p;d++)n.setXYZ(d,0,0,0);const i=new V,s=new V,a=new V,o=new V,l=new V,c=new V,u=new V,f=new V;if(e)for(let d=0,p=e.count;d<p;d+=3){const m=e.getX(d+0),h=e.getX(d+1),_=e.getX(d+2);i.fromBufferAttribute(t,m),s.fromBufferAttribute(t,h),a.fromBufferAttribute(t,_),u.subVectors(a,s),f.subVectors(i,s),u.cross(f),o.fromBufferAttribute(n,m),l.fromBufferAttribute(n,h),c.fromBufferAttribute(n,_),o.add(u),l.add(u),c.add(u),n.setXYZ(m,o.x,o.y,o.z),n.setXYZ(h,l.x,l.y,l.z),n.setXYZ(_,c.x,c.y,c.z)}else for(let d=0,p=t.count;d<p;d+=3)i.fromBufferAttribute(t,d+0),s.fromBufferAttribute(t,d+1),a.fromBufferAttribute(t,d+2),u.subVectors(a,s),f.subVectors(i,s),u.cross(f),n.setXYZ(d+0,u.x,u.y,u.z),n.setXYZ(d+1,u.x,u.y,u.z),n.setXYZ(d+2,u.x,u.y,u.z);this.normalizeNormals(),n.needsUpdate=!0}}merge(){return console.error("THREE.BufferGeometry.merge() has been removed. Use THREE.BufferGeometryUtils.mergeBufferGeometries() instead."),this}normalizeNormals(){const e=this.attributes.normal;for(let t=0,n=e.count;t<n;t++)It.fromBufferAttribute(e,t),It.normalize(),e.setXYZ(t,It.x,It.y,It.z)}toNonIndexed(){function e(o,l){const c=o.array,u=o.itemSize,f=o.normalized,d=new c.constructor(l.length*u);let p=0,m=0;for(let h=0,_=l.length;h<_;h++){o.isInterleavedBufferAttribute?p=l[h]*o.data.stride+o.offset:p=l[h]*u;for(let g=0;g<u;g++)d[m++]=c[p++]}return new Cn(d,u,f)}if(this.index===null)return console.warn("THREE.BufferGeometry.toNonIndexed(): BufferGeometry is already non-indexed."),this;const t=new en,n=this.index.array,i=this.attributes;for(const o in i){const l=i[o],c=e(l,n);t.setAttribute(o,c)}const s=this.morphAttributes;for(const o in s){const l=[],c=s[o];for(let u=0,f=c.length;u<f;u++){const d=c[u],p=e(d,n);l.push(p)}t.morphAttributes[o]=l}t.morphTargetsRelative=this.morphTargetsRelative;const a=this.groups;for(let o=0,l=a.length;o<l;o++){const c=a[o];t.addGroup(c.start,c.count,c.materialIndex)}return t}toJSON(){const e={metadata:{version:4.5,type:"BufferGeometry",generator:"BufferGeometry.toJSON"}};if(e.uuid=this.uuid,e.type=this.type,this.name!==""&&(e.name=this.name),Object.keys(this.userData).length>0&&(e.userData=this.userData),this.parameters!==void 0){const l=this.parameters;for(const c in l)l[c]!==void 0&&(e[c]=l[c]);return e}e.data={attributes:{}};const t=this.index;t!==null&&(e.data.index={type:t.array.constructor.name,array:Array.prototype.slice.call(t.array)});const n=this.attributes;for(const l in n){const c=n[l];e.data.attributes[l]=c.toJSON(e.data)}const i={};let s=!1;for(const l in this.morphAttributes){const c=this.morphAttributes[l],u=[];for(let f=0,d=c.length;f<d;f++){const p=c[f];u.push(p.toJSON(e.data))}u.length>0&&(i[l]=u,s=!0)}s&&(e.data.morphAttributes=i,e.data.morphTargetsRelative=this.morphTargetsRelative);const a=this.groups;a.length>0&&(e.data.groups=JSON.parse(JSON.stringify(a)));const o=this.boundingSphere;return o!==null&&(e.data.boundingSphere={center:o.center.toArray(),radius:o.radius}),e}clone(){return new this.constructor().copy(this)}copy(e){this.index=null,this.attributes={},this.morphAttributes={},this.groups=[],this.boundingBox=null,this.boundingSphere=null;const t={};this.name=e.name;const n=e.index;n!==null&&this.setIndex(n.clone(t));const i=e.attributes;for(const c in i){const u=i[c];this.setAttribute(c,u.clone(t))}const s=e.morphAttributes;for(const c in s){const u=[],f=s[c];for(let d=0,p=f.length;d<p;d++)u.push(f[d].clone(t));this.morphAttributes[c]=u}this.morphTargetsRelative=e.morphTargetsRelative;const a=e.groups;for(let c=0,u=a.length;c<u;c++){const f=a[c];this.addGroup(f.start,f.count,f.materialIndex)}const o=e.boundingBox;o!==null&&(this.boundingBox=o.clone());const l=e.boundingSphere;return l!==null&&(this.boundingSphere=l.clone()),this.drawRange.start=e.drawRange.start,this.drawRange.count=e.drawRange.count,this.userData=e.userData,this}dispose(){this.dispatchEvent({type:"dispose"})}}const Hl=new Lt,wn=new Ma,Or=new _s,Wl=new V,er=new V,tr=new V,nr=new V,Zs=new V,Ur=new V,Br=new lt,Vr=new lt,Gr=new lt,Ks=new V,Hr=new V;class Te extends Ut{constructor(e=new en,t=new gs){super(),this.isMesh=!0,this.type="Mesh",this.geometry=e,this.material=t,this.updateMorphTargets()}copy(e,t){return super.copy(e,t),e.morphTargetInfluences!==void 0&&(this.morphTargetInfluences=e.morphTargetInfluences.slice()),e.morphTargetDictionary!==void 0&&(this.morphTargetDictionary=Object.assign({},e.morphTargetDictionary)),this.material=e.material,this.geometry=e.geometry,this}updateMorphTargets(){const t=this.geometry.morphAttributes,n=Object.keys(t);if(n.length>0){const i=t[n[0]];if(i!==void 0){this.morphTargetInfluences=[],this.morphTargetDictionary={};for(let s=0,a=i.length;s<a;s++){const o=i[s].name||String(s);this.morphTargetInfluences.push(0),this.morphTargetDictionary[o]=s}}}}getVertexPosition(e,t){const n=this.geometry,i=n.attributes.position,s=n.morphAttributes.position,a=n.morphTargetsRelative;t.fromBufferAttribute(i,e);const o=this.morphTargetInfluences;if(s&&o){Ur.set(0,0,0);for(let l=0,c=s.length;l<c;l++){const u=o[l],f=s[l];u!==0&&(Zs.fromBufferAttribute(f,e),a?Ur.addScaledVector(Zs,u):Ur.addScaledVector(Zs.sub(t),u))}t.add(Ur)}return this.isSkinnedMesh&&this.boneTransform(e,t),t}raycast(e,t){const n=this.geometry,i=this.material,s=this.matrixWorld;if(i===void 0||(n.boundingSphere===null&&n.computeBoundingSphere(),Or.copy(n.boundingSphere),Or.applyMatrix4(s),wn.copy(e.ray).recast(e.near),Or.containsPoint(wn.origin)===!1&&(wn.intersectSphere(Or,Wl)===null||wn.origin.distanceToSquared(Wl)>(e.far-e.near)**2))||(Hl.copy(s).invert(),wn.copy(e.ray).applyMatrix4(Hl),n.boundingBox!==null&&wn.intersectsBox(n.boundingBox)===!1))return;let a;const o=n.index,l=n.attributes.position,c=n.attributes.uv,u=n.attributes.uv2,f=n.groups,d=n.drawRange;if(o!==null)if(Array.isArray(i))for(let p=0,m=f.length;p<m;p++){const h=f[p],_=i[h.materialIndex],g=Math.max(h.start,d.start),v=Math.min(o.count,Math.min(h.start+h.count,d.start+d.count));for(let b=g,w=v;b<w;b+=3){const y=o.getX(b),x=o.getX(b+1),S=o.getX(b+2);a=Wr(this,_,e,wn,c,u,y,x,S),a&&(a.faceIndex=Math.floor(b/3),a.face.materialIndex=h.materialIndex,t.push(a))}}else{const p=Math.max(0,d.start),m=Math.min(o.count,d.start+d.count);for(let h=p,_=m;h<_;h+=3){const g=o.getX(h),v=o.getX(h+1),b=o.getX(h+2);a=Wr(this,i,e,wn,c,u,g,v,b),a&&(a.faceIndex=Math.floor(h/3),t.push(a))}}else if(l!==void 0)if(Array.isArray(i))for(let p=0,m=f.length;p<m;p++){const h=f[p],_=i[h.materialIndex],g=Math.max(h.start,d.start),v=Math.min(l.count,Math.min(h.start+h.count,d.start+d.count));for(let b=g,w=v;b<w;b+=3){const y=b,x=b+1,S=b+2;a=Wr(this,_,e,wn,c,u,y,x,S),a&&(a.faceIndex=Math.floor(b/3),a.face.materialIndex=h.materialIndex,t.push(a))}}else{const p=Math.max(0,d.start),m=Math.min(l.count,d.start+d.count);for(let h=p,_=m;h<_;h+=3){const g=h,v=h+1,b=h+2;a=Wr(this,i,e,wn,c,u,g,v,b),a&&(a.faceIndex=Math.floor(h/3),t.push(a))}}}}function N_(r,e,t,n,i,s,a,o){let l;if(e.side===an?l=n.intersectTriangle(a,s,i,!0,o):l=n.intersectTriangle(i,s,a,e.side===Zn,o),l===null)return null;Hr.copy(o),Hr.applyMatrix4(r.matrixWorld);const c=t.ray.origin.distanceTo(Hr);return c<t.near||c>t.far?null:{distance:c,point:Hr.clone(),object:r}}function Wr(r,e,t,n,i,s,a,o,l){r.getVertexPosition(a,er),r.getVertexPosition(o,tr),r.getVertexPosition(l,nr);const c=N_(r,e,t,n,er,tr,nr,Ks);if(c){i&&(Br.fromBufferAttribute(i,a),Vr.fromBufferAttribute(i,o),Gr.fromBufferAttribute(i,l),c.uv=In.getUV(Ks,er,tr,nr,Br,Vr,Gr,new lt)),s&&(Br.fromBufferAttribute(s,a),Vr.fromBufferAttribute(s,o),Gr.fromBufferAttribute(s,l),c.uv2=In.getUV(Ks,er,tr,nr,Br,Vr,Gr,new lt));const u={a,b:o,c:l,normal:new V,materialIndex:0};In.getNormal(er,tr,nr,u.normal),c.face=u}return c}class Et extends en{constructor(e=1,t=1,n=1,i=1,s=1,a=1){super(),this.type="BoxGeometry",this.parameters={width:e,height:t,depth:n,widthSegments:i,heightSegments:s,depthSegments:a};const o=this;i=Math.floor(i),s=Math.floor(s),a=Math.floor(a);const l=[],c=[],u=[],f=[];let d=0,p=0;m("z","y","x",-1,-1,n,t,e,a,s,0),m("z","y","x",1,-1,n,t,-e,a,s,1),m("x","z","y",1,1,e,n,t,i,a,2),m("x","z","y",1,-1,e,n,-t,i,a,3),m("x","y","z",1,-1,e,t,n,i,s,4),m("x","y","z",-1,-1,e,t,-n,i,s,5),this.setIndex(l),this.setAttribute("position",new vt(c,3)),this.setAttribute("normal",new vt(u,3)),this.setAttribute("uv",new vt(f,2));function m(h,_,g,v,b,w,y,x,S,M,T){const R=w/S,k=y/M,G=w/2,F=y/2,O=x/2,X=S+1,le=M+1;let ce=0,te=0;const ne=new V;for(let ue=0;ue<le;ue++){const be=ue*k-F;for(let q=0;q<X;q++){const ae=q*R-G;ne[h]=ae*v,ne[_]=be*b,ne[g]=O,c.push(ne.x,ne.y,ne.z),ne[h]=0,ne[_]=0,ne[g]=x>0?1:-1,u.push(ne.x,ne.y,ne.z),f.push(q/S),f.push(1-ue/M),ce+=1}}for(let ue=0;ue<M;ue++)for(let be=0;be<S;be++){const q=d+be+X*ue,ae=d+be+X*(ue+1),he=d+(be+1)+X*(ue+1),W=d+(be+1)+X*ue;l.push(q,ae,W),l.push(ae,he,W),te+=6}o.addGroup(p,te,T),p+=te,d+=ce}}copy(e){return super.copy(e),this.parameters=Object.assign({},e.parameters),this}static fromJSON(e){return new Et(e.width,e.height,e.depth,e.widthSegments,e.heightSegments,e.depthSegments)}}function Hi(r){const e={};for(const t in r){e[t]={};for(const n in r[t]){const i=r[t][n];i&&(i.isColor||i.isMatrix3||i.isMatrix4||i.isVector2||i.isVector3||i.isVector4||i.isTexture||i.isQuaternion)?e[t][n]=i.clone():Array.isArray(i)?e[t][n]=i.slice():e[t][n]=i}}return e}function qt(r){const e={};for(let t=0;t<r.length;t++){const n=Hi(r[t]);for(const i in n)e[i]=n[i]}return e}function z_(r){const e=[];for(let t=0;t<r.length;t++)e.push(r[t].clone());return e}function tu(r){return r.getRenderTarget()===null&&r.outputEncoding===pt?xn:yr}const F_={clone:Hi,merge:qt};var O_=`void main() {
	gl_Position = projectionMatrix * modelViewMatrix * vec4( position, 1.0 );
}`,U_=`void main() {
	gl_FragColor = vec4( 1.0, 0.0, 0.0, 1.0 );
}`;class mi extends Er{constructor(e){super(),this.isShaderMaterial=!0,this.type="ShaderMaterial",this.defines={},this.uniforms={},this.uniformsGroups=[],this.vertexShader=O_,this.fragmentShader=U_,this.linewidth=1,this.wireframe=!1,this.wireframeLinewidth=1,this.fog=!1,this.lights=!1,this.clipping=!1,this.extensions={derivatives:!1,fragDepth:!1,drawBuffers:!1,shaderTextureLOD:!1},this.defaultAttributeValues={color:[1,1,1],uv:[0,0],uv2:[0,0]},this.index0AttributeName=void 0,this.uniformsNeedUpdate=!1,this.glslVersion=null,e!==void 0&&this.setValues(e)}copy(e){return super.copy(e),this.fragmentShader=e.fragmentShader,this.vertexShader=e.vertexShader,this.uniforms=Hi(e.uniforms),this.uniformsGroups=z_(e.uniformsGroups),this.defines=Object.assign({},e.defines),this.wireframe=e.wireframe,this.wireframeLinewidth=e.wireframeLinewidth,this.fog=e.fog,this.lights=e.lights,this.clipping=e.clipping,this.extensions=Object.assign({},e.extensions),this.glslVersion=e.glslVersion,this}toJSON(e){const t=super.toJSON(e);t.glslVersion=this.glslVersion,t.uniforms={};for(const i in this.uniforms){const a=this.uniforms[i].value;a&&a.isTexture?t.uniforms[i]={type:"t",value:a.toJSON(e).uuid}:a&&a.isColor?t.uniforms[i]={type:"c",value:a.getHex()}:a&&a.isVector2?t.uniforms[i]={type:"v2",value:a.toArray()}:a&&a.isVector3?t.uniforms[i]={type:"v3",value:a.toArray()}:a&&a.isVector4?t.uniforms[i]={type:"v4",value:a.toArray()}:a&&a.isMatrix3?t.uniforms[i]={type:"m3",value:a.toArray()}:a&&a.isMatrix4?t.uniforms[i]={type:"m4",value:a.toArray()}:t.uniforms[i]={value:a}}Object.keys(this.defines).length>0&&(t.defines=this.defines),t.vertexShader=this.vertexShader,t.fragmentShader=this.fragmentShader;const n={};for(const i in this.extensions)this.extensions[i]===!0&&(n[i]=!0);return Object.keys(n).length>0&&(t.extensions=n),t}}class nu extends Ut{constructor(){super(),this.isCamera=!0,this.type="Camera",this.matrixWorldInverse=new Lt,this.projectionMatrix=new Lt,this.projectionMatrixInverse=new Lt}copy(e,t){return super.copy(e,t),this.matrixWorldInverse.copy(e.matrixWorldInverse),this.projectionMatrix.copy(e.projectionMatrix),this.projectionMatrixInverse.copy(e.projectionMatrixInverse),this}getWorldDirection(e){this.updateWorldMatrix(!0,!1);const t=this.matrixWorld.elements;return e.set(-t[8],-t[9],-t[10]).normalize()}updateMatrixWorld(e){super.updateMatrixWorld(e),this.matrixWorldInverse.copy(this.matrixWorld).invert()}updateWorldMatrix(e,t){super.updateWorldMatrix(e,t),this.matrixWorldInverse.copy(this.matrixWorld).invert()}clone(){return new this.constructor().copy(this)}}class dn extends nu{constructor(e=50,t=1,n=.1,i=2e3){super(),this.isPerspectiveCamera=!0,this.type="PerspectiveCamera",this.fov=e,this.zoom=1,this.near=n,this.far=i,this.focus=10,this.aspect=t,this.view=null,this.filmGauge=35,this.filmOffset=0,this.updateProjectionMatrix()}copy(e,t){return super.copy(e,t),this.fov=e.fov,this.zoom=e.zoom,this.near=e.near,this.far=e.far,this.focus=e.focus,this.aspect=e.aspect,this.view=e.view===null?null:Object.assign({},e.view),this.filmGauge=e.filmGauge,this.filmOffset=e.filmOffset,this}setFocalLength(e){const t=.5*this.getFilmHeight()/e;this.fov=fs*2*Math.atan(t),this.updateProjectionMatrix()}getFocalLength(){const e=Math.tan(hr*.5*this.fov);return .5*this.getFilmHeight()/e}getEffectiveFOV(){return fs*2*Math.atan(Math.tan(hr*.5*this.fov)/this.zoom)}getFilmWidth(){return this.filmGauge*Math.min(this.aspect,1)}getFilmHeight(){return this.filmGauge/Math.max(this.aspect,1)}setViewOffset(e,t,n,i,s,a){this.aspect=e/t,this.view===null&&(this.view={enabled:!0,fullWidth:1,fullHeight:1,offsetX:0,offsetY:0,width:1,height:1}),this.view.enabled=!0,this.view.fullWidth=e,this.view.fullHeight=t,this.view.offsetX=n,this.view.offsetY=i,this.view.width=s,this.view.height=a,this.updateProjectionMatrix()}clearViewOffset(){this.view!==null&&(this.view.enabled=!1),this.updateProjectionMatrix()}updateProjectionMatrix(){const e=this.near;let t=e*Math.tan(hr*.5*this.fov)/this.zoom,n=2*t,i=this.aspect*n,s=-.5*i;const a=this.view;if(this.view!==null&&this.view.enabled){const l=a.fullWidth,c=a.fullHeight;s+=a.offsetX*i/l,t-=a.offsetY*n/c,i*=a.width/l,n*=a.height/c}const o=this.filmOffset;o!==0&&(s+=e*o/this.getFilmWidth()),this.projectionMatrix.makePerspective(s,s+i,t,t-n,e,this.far),this.projectionMatrixInverse.copy(this.projectionMatrix).invert()}toJSON(e){const t=super.toJSON(e);return t.object.fov=this.fov,t.object.zoom=this.zoom,t.object.near=this.near,t.object.far=this.far,t.object.focus=this.focus,t.object.aspect=this.aspect,this.view!==null&&(t.object.view=Object.assign({},this.view)),t.object.filmGauge=this.filmGauge,t.object.filmOffset=this.filmOffset,t}}const Ti=-90,Ei=1;class B_ extends Ut{constructor(e,t,n){super(),this.type="CubeCamera",this.renderTarget=n;const i=new dn(Ti,Ei,e,t);i.layers=this.layers,i.up.set(0,1,0),i.lookAt(1,0,0),this.add(i);const s=new dn(Ti,Ei,e,t);s.layers=this.layers,s.up.set(0,1,0),s.lookAt(-1,0,0),this.add(s);const a=new dn(Ti,Ei,e,t);a.layers=this.layers,a.up.set(0,0,-1),a.lookAt(0,1,0),this.add(a);const o=new dn(Ti,Ei,e,t);o.layers=this.layers,o.up.set(0,0,1),o.lookAt(0,-1,0),this.add(o);const l=new dn(Ti,Ei,e,t);l.layers=this.layers,l.up.set(0,1,0),l.lookAt(0,0,1),this.add(l);const c=new dn(Ti,Ei,e,t);c.layers=this.layers,c.up.set(0,1,0),c.lookAt(0,0,-1),this.add(c)}update(e,t){this.parent===null&&this.updateMatrixWorld();const n=this.renderTarget,[i,s,a,o,l,c]=this.children,u=e.getRenderTarget(),f=e.toneMapping,d=e.xr.enabled;e.toneMapping=Un,e.xr.enabled=!1;const p=n.texture.generateMipmaps;n.texture.generateMipmaps=!1,e.setRenderTarget(n,0),e.render(t,i),e.setRenderTarget(n,1),e.render(t,s),e.setRenderTarget(n,2),e.render(t,a),e.setRenderTarget(n,3),e.render(t,o),e.setRenderTarget(n,4),e.render(t,l),n.texture.generateMipmaps=p,e.setRenderTarget(n,5),e.render(t,c),e.setRenderTarget(u),e.toneMapping=f,e.xr.enabled=d,n.texture.needsPMREMUpdate=!0}}class iu extends on{constructor(e,t,n,i,s,a,o,l,c,u){e=e!==void 0?e:[],t=t!==void 0?t:Bi,super(e,t,n,i,s,a,o,l,c,u),this.isCubeTexture=!0,this.flipY=!1}get images(){return this.image}set images(e){this.image=e}}class V_ extends pi{constructor(e=1,t={}){super(e,e,t),this.isWebGLCubeRenderTarget=!0;const n={width:e,height:e,depth:1},i=[n,n,n,n,n,n];this.texture=new iu(i,t.mapping,t.wrapS,t.wrapT,t.magFilter,t.minFilter,t.format,t.type,t.anisotropy,t.encoding),this.texture.isRenderTargetTexture=!0,this.texture.generateMipmaps=t.generateMipmaps!==void 0?t.generateMipmaps:!1,this.texture.minFilter=t.minFilter!==void 0?t.minFilter:fn}fromEquirectangularTexture(e,t){this.texture.type=t.type,this.texture.encoding=t.encoding,this.texture.generateMipmaps=t.generateMipmaps,this.texture.minFilter=t.minFilter,this.texture.magFilter=t.magFilter;const n={uniforms:{tEquirect:{value:null}},vertexShader:`

				varying vec3 vWorldDirection;

				vec3 transformDirection( in vec3 dir, in mat4 matrix ) {

					return normalize( ( matrix * vec4( dir, 0.0 ) ).xyz );

				}

				void main() {

					vWorldDirection = transformDirection( position, modelMatrix );

					#include <begin_vertex>
					#include <project_vertex>

				}
			`,fragmentShader:`

				uniform sampler2D tEquirect;

				varying vec3 vWorldDirection;

				#include <common>

				void main() {

					vec3 direction = normalize( vWorldDirection );

					vec2 sampleUV = equirectUv( direction );

					gl_FragColor = texture2D( tEquirect, sampleUV );

				}
			`},i=new Et(5,5,5),s=new mi({name:"CubemapFromEquirect",uniforms:Hi(n.uniforms),vertexShader:n.vertexShader,fragmentShader:n.fragmentShader,side:an,blending:Yn});s.uniforms.tEquirect.value=t;const a=new Te(i,s),o=t.minFilter;return t.minFilter===br&&(t.minFilter=fn),new B_(1,10,this).update(e,a),t.minFilter=o,a.geometry.dispose(),a.material.dispose(),this}clear(e,t,n,i){const s=e.getRenderTarget();for(let a=0;a<6;a++)e.setRenderTarget(this,a),e.clear(t,n,i);e.setRenderTarget(s)}}const Js=new V,G_=new V,H_=new Kt;class ii{constructor(e=new V(1,0,0),t=0){this.isPlane=!0,this.normal=e,this.constant=t}set(e,t){return this.normal.copy(e),this.constant=t,this}setComponents(e,t,n,i){return this.normal.set(e,t,n),this.constant=i,this}setFromNormalAndCoplanarPoint(e,t){return this.normal.copy(e),this.constant=-t.dot(this.normal),this}setFromCoplanarPoints(e,t,n){const i=Js.subVectors(n,t).cross(G_.subVectors(e,t)).normalize();return this.setFromNormalAndCoplanarPoint(i,e),this}copy(e){return this.normal.copy(e.normal),this.constant=e.constant,this}normalize(){const e=1/this.normal.length();return this.normal.multiplyScalar(e),this.constant*=e,this}negate(){return this.constant*=-1,this.normal.negate(),this}distanceToPoint(e){return this.normal.dot(e)+this.constant}distanceToSphere(e){return this.distanceToPoint(e.center)-e.radius}projectPoint(e,t){return t.copy(e).addScaledVector(this.normal,-this.distanceToPoint(e))}intersectLine(e,t){const n=e.delta(Js),i=this.normal.dot(n);if(i===0)return this.distanceToPoint(e.start)===0?t.copy(e.start):null;const s=-(e.start.dot(this.normal)+this.constant)/i;return s<0||s>1?null:t.copy(e.start).addScaledVector(n,s)}intersectsLine(e){const t=this.distanceToPoint(e.start),n=this.distanceToPoint(e.end);return t<0&&n>0||n<0&&t>0}intersectsBox(e){return e.intersectsPlane(this)}intersectsSphere(e){return e.intersectsPlane(this)}coplanarPoint(e){return e.copy(this.normal).multiplyScalar(-this.constant)}applyMatrix4(e,t){const n=t||H_.getNormalMatrix(e),i=this.coplanarPoint(Js).applyMatrix4(e),s=this.normal.applyMatrix3(n).normalize();return this.constant=-i.dot(s),this}translate(e){return this.constant-=e.dot(this.normal),this}equals(e){return e.normal.equals(this.normal)&&e.constant===this.constant}clone(){return new this.constructor().copy(this)}}const Li=new _s,Xr=new V;class ru{constructor(e=new ii,t=new ii,n=new ii,i=new ii,s=new ii,a=new ii){this.planes=[e,t,n,i,s,a]}set(e,t,n,i,s,a){const o=this.planes;return o[0].copy(e),o[1].copy(t),o[2].copy(n),o[3].copy(i),o[4].copy(s),o[5].copy(a),this}copy(e){const t=this.planes;for(let n=0;n<6;n++)t[n].copy(e.planes[n]);return this}setFromProjectionMatrix(e){const t=this.planes,n=e.elements,i=n[0],s=n[1],a=n[2],o=n[3],l=n[4],c=n[5],u=n[6],f=n[7],d=n[8],p=n[9],m=n[10],h=n[11],_=n[12],g=n[13],v=n[14],b=n[15];return t[0].setComponents(o-i,f-l,h-d,b-_).normalize(),t[1].setComponents(o+i,f+l,h+d,b+_).normalize(),t[2].setComponents(o+s,f+c,h+p,b+g).normalize(),t[3].setComponents(o-s,f-c,h-p,b-g).normalize(),t[4].setComponents(o-a,f-u,h-m,b-v).normalize(),t[5].setComponents(o+a,f+u,h+m,b+v).normalize(),this}intersectsObject(e){const t=e.geometry;return t.boundingSphere===null&&t.computeBoundingSphere(),Li.copy(t.boundingSphere).applyMatrix4(e.matrixWorld),this.intersectsSphere(Li)}intersectsSprite(e){return Li.center.set(0,0,0),Li.radius=.7071067811865476,Li.applyMatrix4(e.matrixWorld),this.intersectsSphere(Li)}intersectsSphere(e){const t=this.planes,n=e.center,i=-e.radius;for(let s=0;s<6;s++)if(t[s].distanceToPoint(n)<i)return!1;return!0}intersectsBox(e){const t=this.planes;for(let n=0;n<6;n++){const i=t[n];if(Xr.x=i.normal.x>0?e.max.x:e.min.x,Xr.y=i.normal.y>0?e.max.y:e.min.y,Xr.z=i.normal.z>0?e.max.z:e.min.z,i.distanceToPoint(Xr)<0)return!1}return!0}containsPoint(e){const t=this.planes;for(let n=0;n<6;n++)if(t[n].distanceToPoint(e)<0)return!1;return!0}clone(){return new this.constructor().copy(this)}}function su(){let r=null,e=!1,t=null,n=null;function i(s,a){t(s,a),n=r.requestAnimationFrame(i)}return{start:function(){e!==!0&&t!==null&&(n=r.requestAnimationFrame(i),e=!0)},stop:function(){r.cancelAnimationFrame(n),e=!1},setAnimationLoop:function(s){t=s},setContext:function(s){r=s}}}function W_(r,e){const t=e.isWebGL2,n=new WeakMap;function i(c,u){const f=c.array,d=c.usage,p=r.createBuffer();r.bindBuffer(u,p),r.bufferData(u,f,d),c.onUploadCallback();let m;if(f instanceof Float32Array)m=5126;else if(f instanceof Uint16Array)if(c.isFloat16BufferAttribute)if(t)m=5131;else throw new Error("THREE.WebGLAttributes: Usage of Float16BufferAttribute requires WebGL2.");else m=5123;else if(f instanceof Int16Array)m=5122;else if(f instanceof Uint32Array)m=5125;else if(f instanceof Int32Array)m=5124;else if(f instanceof Int8Array)m=5120;else if(f instanceof Uint8Array)m=5121;else if(f instanceof Uint8ClampedArray)m=5121;else throw new Error("THREE.WebGLAttributes: Unsupported buffer data format: "+f);return{buffer:p,type:m,bytesPerElement:f.BYTES_PER_ELEMENT,version:c.version}}function s(c,u,f){const d=u.array,p=u.updateRange;r.bindBuffer(f,c),p.count===-1?r.bufferSubData(f,0,d):(t?r.bufferSubData(f,p.offset*d.BYTES_PER_ELEMENT,d,p.offset,p.count):r.bufferSubData(f,p.offset*d.BYTES_PER_ELEMENT,d.subarray(p.offset,p.offset+p.count)),p.count=-1),u.onUploadCallback()}function a(c){return c.isInterleavedBufferAttribute&&(c=c.data),n.get(c)}function o(c){c.isInterleavedBufferAttribute&&(c=c.data);const u=n.get(c);u&&(r.deleteBuffer(u.buffer),n.delete(c))}function l(c,u){if(c.isGLBufferAttribute){const d=n.get(c);(!d||d.version<c.version)&&n.set(c,{buffer:c.buffer,type:c.type,bytesPerElement:c.elementSize,version:c.version});return}c.isInterleavedBufferAttribute&&(c=c.data);const f=n.get(c);f===void 0?n.set(c,i(c,u)):f.version<c.version&&(s(f.buffer,c,u),f.version=c.version)}return{get:a,remove:o,update:l}}class bs extends en{constructor(e=1,t=1,n=1,i=1){super(),this.type="PlaneGeometry",this.parameters={width:e,height:t,widthSegments:n,heightSegments:i};const s=e/2,a=t/2,o=Math.floor(n),l=Math.floor(i),c=o+1,u=l+1,f=e/o,d=t/l,p=[],m=[],h=[],_=[];for(let g=0;g<u;g++){const v=g*d-a;for(let b=0;b<c;b++){const w=b*f-s;m.push(w,-v,0),h.push(0,0,1),_.push(b/o),_.push(1-g/l)}}for(let g=0;g<l;g++)for(let v=0;v<o;v++){const b=v+c*g,w=v+c*(g+1),y=v+1+c*(g+1),x=v+1+c*g;p.push(b,w,x),p.push(w,y,x)}this.setIndex(p),this.setAttribute("position",new vt(m,3)),this.setAttribute("normal",new vt(h,3)),this.setAttribute("uv",new vt(_,2))}copy(e){return super.copy(e),this.parameters=Object.assign({},e.parameters),this}static fromJSON(e){return new bs(e.width,e.height,e.widthSegments,e.heightSegments)}}var X_=`#ifdef USE_ALPHAMAP
	diffuseColor.a *= texture2D( alphaMap, vUv ).g;
#endif`,j_=`#ifdef USE_ALPHAMAP
	uniform sampler2D alphaMap;
#endif`,q_=`#ifdef USE_ALPHATEST
	if ( diffuseColor.a < alphaTest ) discard;
#endif`,Y_=`#ifdef USE_ALPHATEST
	uniform float alphaTest;
#endif`,Z_=`#ifdef USE_AOMAP
	float ambientOcclusion = ( texture2D( aoMap, vUv2 ).r - 1.0 ) * aoMapIntensity + 1.0;
	reflectedLight.indirectDiffuse *= ambientOcclusion;
	#if defined( USE_ENVMAP ) && defined( STANDARD )
		float dotNV = saturate( dot( geometry.normal, geometry.viewDir ) );
		reflectedLight.indirectSpecular *= computeSpecularOcclusion( dotNV, ambientOcclusion, material.roughness );
	#endif
#endif`,K_=`#ifdef USE_AOMAP
	uniform sampler2D aoMap;
	uniform float aoMapIntensity;
#endif`,J_="vec3 transformed = vec3( position );",Q_=`vec3 objectNormal = vec3( normal );
#ifdef USE_TANGENT
	vec3 objectTangent = vec3( tangent.xyz );
#endif`,$_=`vec3 BRDF_Lambert( const in vec3 diffuseColor ) {
	return RECIPROCAL_PI * diffuseColor;
}
vec3 F_Schlick( const in vec3 f0, const in float f90, const in float dotVH ) {
	float fresnel = exp2( ( - 5.55473 * dotVH - 6.98316 ) * dotVH );
	return f0 * ( 1.0 - fresnel ) + ( f90 * fresnel );
}
float F_Schlick( const in float f0, const in float f90, const in float dotVH ) {
	float fresnel = exp2( ( - 5.55473 * dotVH - 6.98316 ) * dotVH );
	return f0 * ( 1.0 - fresnel ) + ( f90 * fresnel );
}
vec3 Schlick_to_F0( const in vec3 f, const in float f90, const in float dotVH ) {
    float x = clamp( 1.0 - dotVH, 0.0, 1.0 );
    float x2 = x * x;
    float x5 = clamp( x * x2 * x2, 0.0, 0.9999 );
    return ( f - vec3( f90 ) * x5 ) / ( 1.0 - x5 );
}
float V_GGX_SmithCorrelated( const in float alpha, const in float dotNL, const in float dotNV ) {
	float a2 = pow2( alpha );
	float gv = dotNL * sqrt( a2 + ( 1.0 - a2 ) * pow2( dotNV ) );
	float gl = dotNV * sqrt( a2 + ( 1.0 - a2 ) * pow2( dotNL ) );
	return 0.5 / max( gv + gl, EPSILON );
}
float D_GGX( const in float alpha, const in float dotNH ) {
	float a2 = pow2( alpha );
	float denom = pow2( dotNH ) * ( a2 - 1.0 ) + 1.0;
	return RECIPROCAL_PI * a2 / pow2( denom );
}
vec3 BRDF_GGX( const in vec3 lightDir, const in vec3 viewDir, const in vec3 normal, const in vec3 f0, const in float f90, const in float roughness ) {
	float alpha = pow2( roughness );
	vec3 halfDir = normalize( lightDir + viewDir );
	float dotNL = saturate( dot( normal, lightDir ) );
	float dotNV = saturate( dot( normal, viewDir ) );
	float dotNH = saturate( dot( normal, halfDir ) );
	float dotVH = saturate( dot( viewDir, halfDir ) );
	vec3 F = F_Schlick( f0, f90, dotVH );
	float V = V_GGX_SmithCorrelated( alpha, dotNL, dotNV );
	float D = D_GGX( alpha, dotNH );
	return F * ( V * D );
}
#ifdef USE_IRIDESCENCE
	vec3 BRDF_GGX_Iridescence( const in vec3 lightDir, const in vec3 viewDir, const in vec3 normal, const in vec3 f0, const in float f90, const in float iridescence, const in vec3 iridescenceFresnel, const in float roughness ) {
		float alpha = pow2( roughness );
		vec3 halfDir = normalize( lightDir + viewDir );
		float dotNL = saturate( dot( normal, lightDir ) );
		float dotNV = saturate( dot( normal, viewDir ) );
		float dotNH = saturate( dot( normal, halfDir ) );
		float dotVH = saturate( dot( viewDir, halfDir ) );
		vec3 F = mix( F_Schlick( f0, f90, dotVH ), iridescenceFresnel, iridescence );
		float V = V_GGX_SmithCorrelated( alpha, dotNL, dotNV );
		float D = D_GGX( alpha, dotNH );
		return F * ( V * D );
	}
#endif
vec2 LTC_Uv( const in vec3 N, const in vec3 V, const in float roughness ) {
	const float LUT_SIZE = 64.0;
	const float LUT_SCALE = ( LUT_SIZE - 1.0 ) / LUT_SIZE;
	const float LUT_BIAS = 0.5 / LUT_SIZE;
	float dotNV = saturate( dot( N, V ) );
	vec2 uv = vec2( roughness, sqrt( 1.0 - dotNV ) );
	uv = uv * LUT_SCALE + LUT_BIAS;
	return uv;
}
float LTC_ClippedSphereFormFactor( const in vec3 f ) {
	float l = length( f );
	return max( ( l * l + f.z ) / ( l + 1.0 ), 0.0 );
}
vec3 LTC_EdgeVectorFormFactor( const in vec3 v1, const in vec3 v2 ) {
	float x = dot( v1, v2 );
	float y = abs( x );
	float a = 0.8543985 + ( 0.4965155 + 0.0145206 * y ) * y;
	float b = 3.4175940 + ( 4.1616724 + y ) * y;
	float v = a / b;
	float theta_sintheta = ( x > 0.0 ) ? v : 0.5 * inversesqrt( max( 1.0 - x * x, 1e-7 ) ) - v;
	return cross( v1, v2 ) * theta_sintheta;
}
vec3 LTC_Evaluate( const in vec3 N, const in vec3 V, const in vec3 P, const in mat3 mInv, const in vec3 rectCoords[ 4 ] ) {
	vec3 v1 = rectCoords[ 1 ] - rectCoords[ 0 ];
	vec3 v2 = rectCoords[ 3 ] - rectCoords[ 0 ];
	vec3 lightNormal = cross( v1, v2 );
	if( dot( lightNormal, P - rectCoords[ 0 ] ) < 0.0 ) return vec3( 0.0 );
	vec3 T1, T2;
	T1 = normalize( V - N * dot( V, N ) );
	T2 = - cross( N, T1 );
	mat3 mat = mInv * transposeMat3( mat3( T1, T2, N ) );
	vec3 coords[ 4 ];
	coords[ 0 ] = mat * ( rectCoords[ 0 ] - P );
	coords[ 1 ] = mat * ( rectCoords[ 1 ] - P );
	coords[ 2 ] = mat * ( rectCoords[ 2 ] - P );
	coords[ 3 ] = mat * ( rectCoords[ 3 ] - P );
	coords[ 0 ] = normalize( coords[ 0 ] );
	coords[ 1 ] = normalize( coords[ 1 ] );
	coords[ 2 ] = normalize( coords[ 2 ] );
	coords[ 3 ] = normalize( coords[ 3 ] );
	vec3 vectorFormFactor = vec3( 0.0 );
	vectorFormFactor += LTC_EdgeVectorFormFactor( coords[ 0 ], coords[ 1 ] );
	vectorFormFactor += LTC_EdgeVectorFormFactor( coords[ 1 ], coords[ 2 ] );
	vectorFormFactor += LTC_EdgeVectorFormFactor( coords[ 2 ], coords[ 3 ] );
	vectorFormFactor += LTC_EdgeVectorFormFactor( coords[ 3 ], coords[ 0 ] );
	float result = LTC_ClippedSphereFormFactor( vectorFormFactor );
	return vec3( result );
}
float G_BlinnPhong_Implicit( ) {
	return 0.25;
}
float D_BlinnPhong( const in float shininess, const in float dotNH ) {
	return RECIPROCAL_PI * ( shininess * 0.5 + 1.0 ) * pow( dotNH, shininess );
}
vec3 BRDF_BlinnPhong( const in vec3 lightDir, const in vec3 viewDir, const in vec3 normal, const in vec3 specularColor, const in float shininess ) {
	vec3 halfDir = normalize( lightDir + viewDir );
	float dotNH = saturate( dot( normal, halfDir ) );
	float dotVH = saturate( dot( viewDir, halfDir ) );
	vec3 F = F_Schlick( specularColor, 1.0, dotVH );
	float G = G_BlinnPhong_Implicit( );
	float D = D_BlinnPhong( shininess, dotNH );
	return F * ( G * D );
}
#if defined( USE_SHEEN )
float D_Charlie( float roughness, float dotNH ) {
	float alpha = pow2( roughness );
	float invAlpha = 1.0 / alpha;
	float cos2h = dotNH * dotNH;
	float sin2h = max( 1.0 - cos2h, 0.0078125 );
	return ( 2.0 + invAlpha ) * pow( sin2h, invAlpha * 0.5 ) / ( 2.0 * PI );
}
float V_Neubelt( float dotNV, float dotNL ) {
	return saturate( 1.0 / ( 4.0 * ( dotNL + dotNV - dotNL * dotNV ) ) );
}
vec3 BRDF_Sheen( const in vec3 lightDir, const in vec3 viewDir, const in vec3 normal, vec3 sheenColor, const in float sheenRoughness ) {
	vec3 halfDir = normalize( lightDir + viewDir );
	float dotNL = saturate( dot( normal, lightDir ) );
	float dotNV = saturate( dot( normal, viewDir ) );
	float dotNH = saturate( dot( normal, halfDir ) );
	float D = D_Charlie( sheenRoughness, dotNH );
	float V = V_Neubelt( dotNV, dotNL );
	return sheenColor * ( D * V );
}
#endif`,eg=`#ifdef USE_IRIDESCENCE
	const mat3 XYZ_TO_REC709 = mat3(
		 3.2404542, -0.9692660,  0.0556434,
		-1.5371385,  1.8760108, -0.2040259,
		-0.4985314,  0.0415560,  1.0572252
	);
	vec3 Fresnel0ToIor( vec3 fresnel0 ) {
		vec3 sqrtF0 = sqrt( fresnel0 );
		return ( vec3( 1.0 ) + sqrtF0 ) / ( vec3( 1.0 ) - sqrtF0 );
	}
	vec3 IorToFresnel0( vec3 transmittedIor, float incidentIor ) {
		return pow2( ( transmittedIor - vec3( incidentIor ) ) / ( transmittedIor + vec3( incidentIor ) ) );
	}
	float IorToFresnel0( float transmittedIor, float incidentIor ) {
		return pow2( ( transmittedIor - incidentIor ) / ( transmittedIor + incidentIor ));
	}
	vec3 evalSensitivity( float OPD, vec3 shift ) {
		float phase = 2.0 * PI * OPD * 1.0e-9;
		vec3 val = vec3( 5.4856e-13, 4.4201e-13, 5.2481e-13 );
		vec3 pos = vec3( 1.6810e+06, 1.7953e+06, 2.2084e+06 );
		vec3 var = vec3( 4.3278e+09, 9.3046e+09, 6.6121e+09 );
		vec3 xyz = val * sqrt( 2.0 * PI * var ) * cos( pos * phase + shift ) * exp( - pow2( phase ) * var );
		xyz.x += 9.7470e-14 * sqrt( 2.0 * PI * 4.5282e+09 ) * cos( 2.2399e+06 * phase + shift[ 0 ] ) * exp( - 4.5282e+09 * pow2( phase ) );
		xyz /= 1.0685e-7;
		vec3 rgb = XYZ_TO_REC709 * xyz;
		return rgb;
	}
	vec3 evalIridescence( float outsideIOR, float eta2, float cosTheta1, float thinFilmThickness, vec3 baseF0 ) {
		vec3 I;
		float iridescenceIOR = mix( outsideIOR, eta2, smoothstep( 0.0, 0.03, thinFilmThickness ) );
		float sinTheta2Sq = pow2( outsideIOR / iridescenceIOR ) * ( 1.0 - pow2( cosTheta1 ) );
		float cosTheta2Sq = 1.0 - sinTheta2Sq;
		if ( cosTheta2Sq < 0.0 ) {
			 return vec3( 1.0 );
		}
		float cosTheta2 = sqrt( cosTheta2Sq );
		float R0 = IorToFresnel0( iridescenceIOR, outsideIOR );
		float R12 = F_Schlick( R0, 1.0, cosTheta1 );
		float R21 = R12;
		float T121 = 1.0 - R12;
		float phi12 = 0.0;
		if ( iridescenceIOR < outsideIOR ) phi12 = PI;
		float phi21 = PI - phi12;
		vec3 baseIOR = Fresnel0ToIor( clamp( baseF0, 0.0, 0.9999 ) );		vec3 R1 = IorToFresnel0( baseIOR, iridescenceIOR );
		vec3 R23 = F_Schlick( R1, 1.0, cosTheta2 );
		vec3 phi23 = vec3( 0.0 );
		if ( baseIOR[ 0 ] < iridescenceIOR ) phi23[ 0 ] = PI;
		if ( baseIOR[ 1 ] < iridescenceIOR ) phi23[ 1 ] = PI;
		if ( baseIOR[ 2 ] < iridescenceIOR ) phi23[ 2 ] = PI;
		float OPD = 2.0 * iridescenceIOR * thinFilmThickness * cosTheta2;
		vec3 phi = vec3( phi21 ) + phi23;
		vec3 R123 = clamp( R12 * R23, 1e-5, 0.9999 );
		vec3 r123 = sqrt( R123 );
		vec3 Rs = pow2( T121 ) * R23 / ( vec3( 1.0 ) - R123 );
		vec3 C0 = R12 + Rs;
		I = C0;
		vec3 Cm = Rs - T121;
		for ( int m = 1; m <= 2; ++ m ) {
			Cm *= r123;
			vec3 Sm = 2.0 * evalSensitivity( float( m ) * OPD, float( m ) * phi );
			I += Cm * Sm;
		}
		return max( I, vec3( 0.0 ) );
	}
#endif`,tg=`#ifdef USE_BUMPMAP
	uniform sampler2D bumpMap;
	uniform float bumpScale;
	vec2 dHdxy_fwd() {
		vec2 dSTdx = dFdx( vUv );
		vec2 dSTdy = dFdy( vUv );
		float Hll = bumpScale * texture2D( bumpMap, vUv ).x;
		float dBx = bumpScale * texture2D( bumpMap, vUv + dSTdx ).x - Hll;
		float dBy = bumpScale * texture2D( bumpMap, vUv + dSTdy ).x - Hll;
		return vec2( dBx, dBy );
	}
	vec3 perturbNormalArb( vec3 surf_pos, vec3 surf_norm, vec2 dHdxy, float faceDirection ) {
		vec3 vSigmaX = dFdx( surf_pos.xyz );
		vec3 vSigmaY = dFdy( surf_pos.xyz );
		vec3 vN = surf_norm;
		vec3 R1 = cross( vSigmaY, vN );
		vec3 R2 = cross( vN, vSigmaX );
		float fDet = dot( vSigmaX, R1 ) * faceDirection;
		vec3 vGrad = sign( fDet ) * ( dHdxy.x * R1 + dHdxy.y * R2 );
		return normalize( abs( fDet ) * surf_norm - vGrad );
	}
#endif`,ng=`#if NUM_CLIPPING_PLANES > 0
	vec4 plane;
	#pragma unroll_loop_start
	for ( int i = 0; i < UNION_CLIPPING_PLANES; i ++ ) {
		plane = clippingPlanes[ i ];
		if ( dot( vClipPosition, plane.xyz ) > plane.w ) discard;
	}
	#pragma unroll_loop_end
	#if UNION_CLIPPING_PLANES < NUM_CLIPPING_PLANES
		bool clipped = true;
		#pragma unroll_loop_start
		for ( int i = UNION_CLIPPING_PLANES; i < NUM_CLIPPING_PLANES; i ++ ) {
			plane = clippingPlanes[ i ];
			clipped = ( dot( vClipPosition, plane.xyz ) > plane.w ) && clipped;
		}
		#pragma unroll_loop_end
		if ( clipped ) discard;
	#endif
#endif`,ig=`#if NUM_CLIPPING_PLANES > 0
	varying vec3 vClipPosition;
	uniform vec4 clippingPlanes[ NUM_CLIPPING_PLANES ];
#endif`,rg=`#if NUM_CLIPPING_PLANES > 0
	varying vec3 vClipPosition;
#endif`,sg=`#if NUM_CLIPPING_PLANES > 0
	vClipPosition = - mvPosition.xyz;
#endif`,ag=`#if defined( USE_COLOR_ALPHA )
	diffuseColor *= vColor;
#elif defined( USE_COLOR )
	diffuseColor.rgb *= vColor;
#endif`,og=`#if defined( USE_COLOR_ALPHA )
	varying vec4 vColor;
#elif defined( USE_COLOR )
	varying vec3 vColor;
#endif`,lg=`#if defined( USE_COLOR_ALPHA )
	varying vec4 vColor;
#elif defined( USE_COLOR ) || defined( USE_INSTANCING_COLOR )
	varying vec3 vColor;
#endif`,cg=`#if defined( USE_COLOR_ALPHA )
	vColor = vec4( 1.0 );
#elif defined( USE_COLOR ) || defined( USE_INSTANCING_COLOR )
	vColor = vec3( 1.0 );
#endif
#ifdef USE_COLOR
	vColor *= color;
#endif
#ifdef USE_INSTANCING_COLOR
	vColor.xyz *= instanceColor.xyz;
#endif`,ug=`#define PI 3.141592653589793
#define PI2 6.283185307179586
#define PI_HALF 1.5707963267948966
#define RECIPROCAL_PI 0.3183098861837907
#define RECIPROCAL_PI2 0.15915494309189535
#define EPSILON 1e-6
#ifndef saturate
#define saturate( a ) clamp( a, 0.0, 1.0 )
#endif
#define whiteComplement( a ) ( 1.0 - saturate( a ) )
float pow2( const in float x ) { return x*x; }
vec3 pow2( const in vec3 x ) { return x*x; }
float pow3( const in float x ) { return x*x*x; }
float pow4( const in float x ) { float x2 = x*x; return x2*x2; }
float max3( const in vec3 v ) { return max( max( v.x, v.y ), v.z ); }
float average( const in vec3 v ) { return dot( v, vec3( 0.3333333 ) ); }
highp float rand( const in vec2 uv ) {
	const highp float a = 12.9898, b = 78.233, c = 43758.5453;
	highp float dt = dot( uv.xy, vec2( a,b ) ), sn = mod( dt, PI );
	return fract( sin( sn ) * c );
}
#ifdef HIGH_PRECISION
	float precisionSafeLength( vec3 v ) { return length( v ); }
#else
	float precisionSafeLength( vec3 v ) {
		float maxComponent = max3( abs( v ) );
		return length( v / maxComponent ) * maxComponent;
	}
#endif
struct IncidentLight {
	vec3 color;
	vec3 direction;
	bool visible;
};
struct ReflectedLight {
	vec3 directDiffuse;
	vec3 directSpecular;
	vec3 indirectDiffuse;
	vec3 indirectSpecular;
};
struct GeometricContext {
	vec3 position;
	vec3 normal;
	vec3 viewDir;
#ifdef USE_CLEARCOAT
	vec3 clearcoatNormal;
#endif
};
vec3 transformDirection( in vec3 dir, in mat4 matrix ) {
	return normalize( ( matrix * vec4( dir, 0.0 ) ).xyz );
}
vec3 inverseTransformDirection( in vec3 dir, in mat4 matrix ) {
	return normalize( ( vec4( dir, 0.0 ) * matrix ).xyz );
}
mat3 transposeMat3( const in mat3 m ) {
	mat3 tmp;
	tmp[ 0 ] = vec3( m[ 0 ].x, m[ 1 ].x, m[ 2 ].x );
	tmp[ 1 ] = vec3( m[ 0 ].y, m[ 1 ].y, m[ 2 ].y );
	tmp[ 2 ] = vec3( m[ 0 ].z, m[ 1 ].z, m[ 2 ].z );
	return tmp;
}
float luminance( const in vec3 rgb ) {
	const vec3 weights = vec3( 0.2126729, 0.7151522, 0.0721750 );
	return dot( weights, rgb );
}
bool isPerspectiveMatrix( mat4 m ) {
	return m[ 2 ][ 3 ] == - 1.0;
}
vec2 equirectUv( in vec3 dir ) {
	float u = atan( dir.z, dir.x ) * RECIPROCAL_PI2 + 0.5;
	float v = asin( clamp( dir.y, - 1.0, 1.0 ) ) * RECIPROCAL_PI + 0.5;
	return vec2( u, v );
}`,fg=`#ifdef ENVMAP_TYPE_CUBE_UV
	#define cubeUV_minMipLevel 4.0
	#define cubeUV_minTileSize 16.0
	float getFace( vec3 direction ) {
		vec3 absDirection = abs( direction );
		float face = - 1.0;
		if ( absDirection.x > absDirection.z ) {
			if ( absDirection.x > absDirection.y )
				face = direction.x > 0.0 ? 0.0 : 3.0;
			else
				face = direction.y > 0.0 ? 1.0 : 4.0;
		} else {
			if ( absDirection.z > absDirection.y )
				face = direction.z > 0.0 ? 2.0 : 5.0;
			else
				face = direction.y > 0.0 ? 1.0 : 4.0;
		}
		return face;
	}
	vec2 getUV( vec3 direction, float face ) {
		vec2 uv;
		if ( face == 0.0 ) {
			uv = vec2( direction.z, direction.y ) / abs( direction.x );
		} else if ( face == 1.0 ) {
			uv = vec2( - direction.x, - direction.z ) / abs( direction.y );
		} else if ( face == 2.0 ) {
			uv = vec2( - direction.x, direction.y ) / abs( direction.z );
		} else if ( face == 3.0 ) {
			uv = vec2( - direction.z, direction.y ) / abs( direction.x );
		} else if ( face == 4.0 ) {
			uv = vec2( - direction.x, direction.z ) / abs( direction.y );
		} else {
			uv = vec2( direction.x, direction.y ) / abs( direction.z );
		}
		return 0.5 * ( uv + 1.0 );
	}
	vec3 bilinearCubeUV( sampler2D envMap, vec3 direction, float mipInt ) {
		float face = getFace( direction );
		float filterInt = max( cubeUV_minMipLevel - mipInt, 0.0 );
		mipInt = max( mipInt, cubeUV_minMipLevel );
		float faceSize = exp2( mipInt );
		highp vec2 uv = getUV( direction, face ) * ( faceSize - 2.0 ) + 1.0;
		if ( face > 2.0 ) {
			uv.y += faceSize;
			face -= 3.0;
		}
		uv.x += face * faceSize;
		uv.x += filterInt * 3.0 * cubeUV_minTileSize;
		uv.y += 4.0 * ( exp2( CUBEUV_MAX_MIP ) - faceSize );
		uv.x *= CUBEUV_TEXEL_WIDTH;
		uv.y *= CUBEUV_TEXEL_HEIGHT;
		#ifdef texture2DGradEXT
			return texture2DGradEXT( envMap, uv, vec2( 0.0 ), vec2( 0.0 ) ).rgb;
		#else
			return texture2D( envMap, uv ).rgb;
		#endif
	}
	#define cubeUV_r0 1.0
	#define cubeUV_v0 0.339
	#define cubeUV_m0 - 2.0
	#define cubeUV_r1 0.8
	#define cubeUV_v1 0.276
	#define cubeUV_m1 - 1.0
	#define cubeUV_r4 0.4
	#define cubeUV_v4 0.046
	#define cubeUV_m4 2.0
	#define cubeUV_r5 0.305
	#define cubeUV_v5 0.016
	#define cubeUV_m5 3.0
	#define cubeUV_r6 0.21
	#define cubeUV_v6 0.0038
	#define cubeUV_m6 4.0
	float roughnessToMip( float roughness ) {
		float mip = 0.0;
		if ( roughness >= cubeUV_r1 ) {
			mip = ( cubeUV_r0 - roughness ) * ( cubeUV_m1 - cubeUV_m0 ) / ( cubeUV_r0 - cubeUV_r1 ) + cubeUV_m0;
		} else if ( roughness >= cubeUV_r4 ) {
			mip = ( cubeUV_r1 - roughness ) * ( cubeUV_m4 - cubeUV_m1 ) / ( cubeUV_r1 - cubeUV_r4 ) + cubeUV_m1;
		} else if ( roughness >= cubeUV_r5 ) {
			mip = ( cubeUV_r4 - roughness ) * ( cubeUV_m5 - cubeUV_m4 ) / ( cubeUV_r4 - cubeUV_r5 ) + cubeUV_m4;
		} else if ( roughness >= cubeUV_r6 ) {
			mip = ( cubeUV_r5 - roughness ) * ( cubeUV_m6 - cubeUV_m5 ) / ( cubeUV_r5 - cubeUV_r6 ) + cubeUV_m5;
		} else {
			mip = - 2.0 * log2( 1.16 * roughness );		}
		return mip;
	}
	vec4 textureCubeUV( sampler2D envMap, vec3 sampleDir, float roughness ) {
		float mip = clamp( roughnessToMip( roughness ), cubeUV_m0, CUBEUV_MAX_MIP );
		float mipF = fract( mip );
		float mipInt = floor( mip );
		vec3 color0 = bilinearCubeUV( envMap, sampleDir, mipInt );
		if ( mipF == 0.0 ) {
			return vec4( color0, 1.0 );
		} else {
			vec3 color1 = bilinearCubeUV( envMap, sampleDir, mipInt + 1.0 );
			return vec4( mix( color0, color1, mipF ), 1.0 );
		}
	}
#endif`,dg=`vec3 transformedNormal = objectNormal;
#ifdef USE_INSTANCING
	mat3 m = mat3( instanceMatrix );
	transformedNormal /= vec3( dot( m[ 0 ], m[ 0 ] ), dot( m[ 1 ], m[ 1 ] ), dot( m[ 2 ], m[ 2 ] ) );
	transformedNormal = m * transformedNormal;
#endif
transformedNormal = normalMatrix * transformedNormal;
#ifdef FLIP_SIDED
	transformedNormal = - transformedNormal;
#endif
#ifdef USE_TANGENT
	vec3 transformedTangent = ( modelViewMatrix * vec4( objectTangent, 0.0 ) ).xyz;
	#ifdef FLIP_SIDED
		transformedTangent = - transformedTangent;
	#endif
#endif`,hg=`#ifdef USE_DISPLACEMENTMAP
	uniform sampler2D displacementMap;
	uniform float displacementScale;
	uniform float displacementBias;
#endif`,pg=`#ifdef USE_DISPLACEMENTMAP
	transformed += normalize( objectNormal ) * ( texture2D( displacementMap, vUv ).x * displacementScale + displacementBias );
#endif`,mg=`#ifdef USE_EMISSIVEMAP
	vec4 emissiveColor = texture2D( emissiveMap, vUv );
	totalEmissiveRadiance *= emissiveColor.rgb;
#endif`,_g=`#ifdef USE_EMISSIVEMAP
	uniform sampler2D emissiveMap;
#endif`,gg="gl_FragColor = linearToOutputTexel( gl_FragColor );",bg=`vec4 LinearToLinear( in vec4 value ) {
	return value;
}
vec4 LinearTosRGB( in vec4 value ) {
	return vec4( mix( pow( value.rgb, vec3( 0.41666 ) ) * 1.055 - vec3( 0.055 ), value.rgb * 12.92, vec3( lessThanEqual( value.rgb, vec3( 0.0031308 ) ) ) ), value.a );
}`,vg=`#ifdef USE_ENVMAP
	#ifdef ENV_WORLDPOS
		vec3 cameraToFrag;
		if ( isOrthographic ) {
			cameraToFrag = normalize( vec3( - viewMatrix[ 0 ][ 2 ], - viewMatrix[ 1 ][ 2 ], - viewMatrix[ 2 ][ 2 ] ) );
		} else {
			cameraToFrag = normalize( vWorldPosition - cameraPosition );
		}
		vec3 worldNormal = inverseTransformDirection( normal, viewMatrix );
		#ifdef ENVMAP_MODE_REFLECTION
			vec3 reflectVec = reflect( cameraToFrag, worldNormal );
		#else
			vec3 reflectVec = refract( cameraToFrag, worldNormal, refractionRatio );
		#endif
	#else
		vec3 reflectVec = vReflect;
	#endif
	#ifdef ENVMAP_TYPE_CUBE
		vec4 envColor = textureCube( envMap, vec3( flipEnvMap * reflectVec.x, reflectVec.yz ) );
	#else
		vec4 envColor = vec4( 0.0 );
	#endif
	#ifdef ENVMAP_BLENDING_MULTIPLY
		outgoingLight = mix( outgoingLight, outgoingLight * envColor.xyz, specularStrength * reflectivity );
	#elif defined( ENVMAP_BLENDING_MIX )
		outgoingLight = mix( outgoingLight, envColor.xyz, specularStrength * reflectivity );
	#elif defined( ENVMAP_BLENDING_ADD )
		outgoingLight += envColor.xyz * specularStrength * reflectivity;
	#endif
#endif`,yg=`#ifdef USE_ENVMAP
	uniform float envMapIntensity;
	uniform float flipEnvMap;
	#ifdef ENVMAP_TYPE_CUBE
		uniform samplerCube envMap;
	#else
		uniform sampler2D envMap;
	#endif
	
#endif`,wg=`#ifdef USE_ENVMAP
	uniform float reflectivity;
	#if defined( USE_BUMPMAP ) || defined( USE_NORMALMAP ) || defined( PHONG ) || defined( LAMBERT )
		#define ENV_WORLDPOS
	#endif
	#ifdef ENV_WORLDPOS
		varying vec3 vWorldPosition;
		uniform float refractionRatio;
	#else
		varying vec3 vReflect;
	#endif
#endif`,Mg=`#ifdef USE_ENVMAP
	#if defined( USE_BUMPMAP ) || defined( USE_NORMALMAP ) || defined( PHONG ) || defined( LAMBERT )
		#define ENV_WORLDPOS
	#endif
	#ifdef ENV_WORLDPOS
		
		varying vec3 vWorldPosition;
	#else
		varying vec3 vReflect;
		uniform float refractionRatio;
	#endif
#endif`,xg=`#ifdef USE_ENVMAP
	#ifdef ENV_WORLDPOS
		vWorldPosition = worldPosition.xyz;
	#else
		vec3 cameraToVertex;
		if ( isOrthographic ) {
			cameraToVertex = normalize( vec3( - viewMatrix[ 0 ][ 2 ], - viewMatrix[ 1 ][ 2 ], - viewMatrix[ 2 ][ 2 ] ) );
		} else {
			cameraToVertex = normalize( worldPosition.xyz - cameraPosition );
		}
		vec3 worldNormal = inverseTransformDirection( transformedNormal, viewMatrix );
		#ifdef ENVMAP_MODE_REFLECTION
			vReflect = reflect( cameraToVertex, worldNormal );
		#else
			vReflect = refract( cameraToVertex, worldNormal, refractionRatio );
		#endif
	#endif
#endif`,Sg=`#ifdef USE_FOG
	vFogDepth = - mvPosition.z;
#endif`,Cg=`#ifdef USE_FOG
	varying float vFogDepth;
#endif`,Tg=`#ifdef USE_FOG
	#ifdef FOG_EXP2
		float fogFactor = 1.0 - exp( - fogDensity * fogDensity * vFogDepth * vFogDepth );
	#else
		float fogFactor = smoothstep( fogNear, fogFar, vFogDepth );
	#endif
	gl_FragColor.rgb = mix( gl_FragColor.rgb, fogColor, fogFactor );
#endif`,Eg=`#ifdef USE_FOG
	uniform vec3 fogColor;
	varying float vFogDepth;
	#ifdef FOG_EXP2
		uniform float fogDensity;
	#else
		uniform float fogNear;
		uniform float fogFar;
	#endif
#endif`,Lg=`#ifdef USE_GRADIENTMAP
	uniform sampler2D gradientMap;
#endif
vec3 getGradientIrradiance( vec3 normal, vec3 lightDirection ) {
	float dotNL = dot( normal, lightDirection );
	vec2 coord = vec2( dotNL * 0.5 + 0.5, 0.0 );
	#ifdef USE_GRADIENTMAP
		return vec3( texture2D( gradientMap, coord ).r );
	#else
		vec2 fw = fwidth( coord ) * 0.5;
		return mix( vec3( 0.7 ), vec3( 1.0 ), smoothstep( 0.7 - fw.x, 0.7 + fw.x, coord.x ) );
	#endif
}`,Pg=`#ifdef USE_LIGHTMAP
	vec4 lightMapTexel = texture2D( lightMap, vUv2 );
	vec3 lightMapIrradiance = lightMapTexel.rgb * lightMapIntensity;
	reflectedLight.indirectDiffuse += lightMapIrradiance;
#endif`,Ag=`#ifdef USE_LIGHTMAP
	uniform sampler2D lightMap;
	uniform float lightMapIntensity;
#endif`,Dg=`LambertMaterial material;
material.diffuseColor = diffuseColor.rgb;
material.specularStrength = specularStrength;`,Rg=`varying vec3 vViewPosition;
struct LambertMaterial {
	vec3 diffuseColor;
	float specularStrength;
};
void RE_Direct_Lambert( const in IncidentLight directLight, const in GeometricContext geometry, const in LambertMaterial material, inout ReflectedLight reflectedLight ) {
	float dotNL = saturate( dot( geometry.normal, directLight.direction ) );
	vec3 irradiance = dotNL * directLight.color;
	reflectedLight.directDiffuse += irradiance * BRDF_Lambert( material.diffuseColor );
}
void RE_IndirectDiffuse_Lambert( const in vec3 irradiance, const in GeometricContext geometry, const in LambertMaterial material, inout ReflectedLight reflectedLight ) {
	reflectedLight.indirectDiffuse += irradiance * BRDF_Lambert( material.diffuseColor );
}
#define RE_Direct				RE_Direct_Lambert
#define RE_IndirectDiffuse		RE_IndirectDiffuse_Lambert`,kg=`uniform bool receiveShadow;
uniform vec3 ambientLightColor;
uniform vec3 lightProbe[ 9 ];
vec3 shGetIrradianceAt( in vec3 normal, in vec3 shCoefficients[ 9 ] ) {
	float x = normal.x, y = normal.y, z = normal.z;
	vec3 result = shCoefficients[ 0 ] * 0.886227;
	result += shCoefficients[ 1 ] * 2.0 * 0.511664 * y;
	result += shCoefficients[ 2 ] * 2.0 * 0.511664 * z;
	result += shCoefficients[ 3 ] * 2.0 * 0.511664 * x;
	result += shCoefficients[ 4 ] * 2.0 * 0.429043 * x * y;
	result += shCoefficients[ 5 ] * 2.0 * 0.429043 * y * z;
	result += shCoefficients[ 6 ] * ( 0.743125 * z * z - 0.247708 );
	result += shCoefficients[ 7 ] * 2.0 * 0.429043 * x * z;
	result += shCoefficients[ 8 ] * 0.429043 * ( x * x - y * y );
	return result;
}
vec3 getLightProbeIrradiance( const in vec3 lightProbe[ 9 ], const in vec3 normal ) {
	vec3 worldNormal = inverseTransformDirection( normal, viewMatrix );
	vec3 irradiance = shGetIrradianceAt( worldNormal, lightProbe );
	return irradiance;
}
vec3 getAmbientLightIrradiance( const in vec3 ambientLightColor ) {
	vec3 irradiance = ambientLightColor;
	return irradiance;
}
float getDistanceAttenuation( const in float lightDistance, const in float cutoffDistance, const in float decayExponent ) {
	#if defined ( LEGACY_LIGHTS )
		if ( cutoffDistance > 0.0 && decayExponent > 0.0 ) {
			return pow( saturate( - lightDistance / cutoffDistance + 1.0 ), decayExponent );
		}
		return 1.0;
	#else
		float distanceFalloff = 1.0 / max( pow( lightDistance, decayExponent ), 0.01 );
		if ( cutoffDistance > 0.0 ) {
			distanceFalloff *= pow2( saturate( 1.0 - pow4( lightDistance / cutoffDistance ) ) );
		}
		return distanceFalloff;
	#endif
}
float getSpotAttenuation( const in float coneCosine, const in float penumbraCosine, const in float angleCosine ) {
	return smoothstep( coneCosine, penumbraCosine, angleCosine );
}
#if NUM_DIR_LIGHTS > 0
	struct DirectionalLight {
		vec3 direction;
		vec3 color;
	};
	uniform DirectionalLight directionalLights[ NUM_DIR_LIGHTS ];
	void getDirectionalLightInfo( const in DirectionalLight directionalLight, const in GeometricContext geometry, out IncidentLight light ) {
		light.color = directionalLight.color;
		light.direction = directionalLight.direction;
		light.visible = true;
	}
#endif
#if NUM_POINT_LIGHTS > 0
	struct PointLight {
		vec3 position;
		vec3 color;
		float distance;
		float decay;
	};
	uniform PointLight pointLights[ NUM_POINT_LIGHTS ];
	void getPointLightInfo( const in PointLight pointLight, const in GeometricContext geometry, out IncidentLight light ) {
		vec3 lVector = pointLight.position - geometry.position;
		light.direction = normalize( lVector );
		float lightDistance = length( lVector );
		light.color = pointLight.color;
		light.color *= getDistanceAttenuation( lightDistance, pointLight.distance, pointLight.decay );
		light.visible = ( light.color != vec3( 0.0 ) );
	}
#endif
#if NUM_SPOT_LIGHTS > 0
	struct SpotLight {
		vec3 position;
		vec3 direction;
		vec3 color;
		float distance;
		float decay;
		float coneCos;
		float penumbraCos;
	};
	uniform SpotLight spotLights[ NUM_SPOT_LIGHTS ];
	void getSpotLightInfo( const in SpotLight spotLight, const in GeometricContext geometry, out IncidentLight light ) {
		vec3 lVector = spotLight.position - geometry.position;
		light.direction = normalize( lVector );
		float angleCos = dot( light.direction, spotLight.direction );
		float spotAttenuation = getSpotAttenuation( spotLight.coneCos, spotLight.penumbraCos, angleCos );
		if ( spotAttenuation > 0.0 ) {
			float lightDistance = length( lVector );
			light.color = spotLight.color * spotAttenuation;
			light.color *= getDistanceAttenuation( lightDistance, spotLight.distance, spotLight.decay );
			light.visible = ( light.color != vec3( 0.0 ) );
		} else {
			light.color = vec3( 0.0 );
			light.visible = false;
		}
	}
#endif
#if NUM_RECT_AREA_LIGHTS > 0
	struct RectAreaLight {
		vec3 color;
		vec3 position;
		vec3 halfWidth;
		vec3 halfHeight;
	};
	uniform sampler2D ltc_1;	uniform sampler2D ltc_2;
	uniform RectAreaLight rectAreaLights[ NUM_RECT_AREA_LIGHTS ];
#endif
#if NUM_HEMI_LIGHTS > 0
	struct HemisphereLight {
		vec3 direction;
		vec3 skyColor;
		vec3 groundColor;
	};
	uniform HemisphereLight hemisphereLights[ NUM_HEMI_LIGHTS ];
	vec3 getHemisphereLightIrradiance( const in HemisphereLight hemiLight, const in vec3 normal ) {
		float dotNL = dot( normal, hemiLight.direction );
		float hemiDiffuseWeight = 0.5 * dotNL + 0.5;
		vec3 irradiance = mix( hemiLight.groundColor, hemiLight.skyColor, hemiDiffuseWeight );
		return irradiance;
	}
#endif`,Ig=`#if defined( USE_ENVMAP )
	vec3 getIBLIrradiance( const in vec3 normal ) {
		#if defined( ENVMAP_TYPE_CUBE_UV )
			vec3 worldNormal = inverseTransformDirection( normal, viewMatrix );
			vec4 envMapColor = textureCubeUV( envMap, worldNormal, 1.0 );
			return PI * envMapColor.rgb * envMapIntensity;
		#else
			return vec3( 0.0 );
		#endif
	}
	vec3 getIBLRadiance( const in vec3 viewDir, const in vec3 normal, const in float roughness ) {
		#if defined( ENVMAP_TYPE_CUBE_UV )
			vec3 reflectVec = reflect( - viewDir, normal );
			reflectVec = normalize( mix( reflectVec, normal, roughness * roughness) );
			reflectVec = inverseTransformDirection( reflectVec, viewMatrix );
			vec4 envMapColor = textureCubeUV( envMap, reflectVec, roughness );
			return envMapColor.rgb * envMapIntensity;
		#else
			return vec3( 0.0 );
		#endif
	}
#endif`,Ng=`ToonMaterial material;
material.diffuseColor = diffuseColor.rgb;`,zg=`varying vec3 vViewPosition;
struct ToonMaterial {
	vec3 diffuseColor;
};
void RE_Direct_Toon( const in IncidentLight directLight, const in GeometricContext geometry, const in ToonMaterial material, inout ReflectedLight reflectedLight ) {
	vec3 irradiance = getGradientIrradiance( geometry.normal, directLight.direction ) * directLight.color;
	reflectedLight.directDiffuse += irradiance * BRDF_Lambert( material.diffuseColor );
}
void RE_IndirectDiffuse_Toon( const in vec3 irradiance, const in GeometricContext geometry, const in ToonMaterial material, inout ReflectedLight reflectedLight ) {
	reflectedLight.indirectDiffuse += irradiance * BRDF_Lambert( material.diffuseColor );
}
#define RE_Direct				RE_Direct_Toon
#define RE_IndirectDiffuse		RE_IndirectDiffuse_Toon`,Fg=`BlinnPhongMaterial material;
material.diffuseColor = diffuseColor.rgb;
material.specularColor = specular;
material.specularShininess = shininess;
material.specularStrength = specularStrength;`,Og=`varying vec3 vViewPosition;
struct BlinnPhongMaterial {
	vec3 diffuseColor;
	vec3 specularColor;
	float specularShininess;
	float specularStrength;
};
void RE_Direct_BlinnPhong( const in IncidentLight directLight, const in GeometricContext geometry, const in BlinnPhongMaterial material, inout ReflectedLight reflectedLight ) {
	float dotNL = saturate( dot( geometry.normal, directLight.direction ) );
	vec3 irradiance = dotNL * directLight.color;
	reflectedLight.directDiffuse += irradiance * BRDF_Lambert( material.diffuseColor );
	reflectedLight.directSpecular += irradiance * BRDF_BlinnPhong( directLight.direction, geometry.viewDir, geometry.normal, material.specularColor, material.specularShininess ) * material.specularStrength;
}
void RE_IndirectDiffuse_BlinnPhong( const in vec3 irradiance, const in GeometricContext geometry, const in BlinnPhongMaterial material, inout ReflectedLight reflectedLight ) {
	reflectedLight.indirectDiffuse += irradiance * BRDF_Lambert( material.diffuseColor );
}
#define RE_Direct				RE_Direct_BlinnPhong
#define RE_IndirectDiffuse		RE_IndirectDiffuse_BlinnPhong`,Ug=`PhysicalMaterial material;
material.diffuseColor = diffuseColor.rgb * ( 1.0 - metalnessFactor );
vec3 dxy = max( abs( dFdx( geometryNormal ) ), abs( dFdy( geometryNormal ) ) );
float geometryRoughness = max( max( dxy.x, dxy.y ), dxy.z );
material.roughness = max( roughnessFactor, 0.0525 );material.roughness += geometryRoughness;
material.roughness = min( material.roughness, 1.0 );
#ifdef IOR
	material.ior = ior;
	#ifdef SPECULAR
		float specularIntensityFactor = specularIntensity;
		vec3 specularColorFactor = specularColor;
		#ifdef USE_SPECULARINTENSITYMAP
			specularIntensityFactor *= texture2D( specularIntensityMap, vUv ).a;
		#endif
		#ifdef USE_SPECULARCOLORMAP
			specularColorFactor *= texture2D( specularColorMap, vUv ).rgb;
		#endif
		material.specularF90 = mix( specularIntensityFactor, 1.0, metalnessFactor );
	#else
		float specularIntensityFactor = 1.0;
		vec3 specularColorFactor = vec3( 1.0 );
		material.specularF90 = 1.0;
	#endif
	material.specularColor = mix( min( pow2( ( material.ior - 1.0 ) / ( material.ior + 1.0 ) ) * specularColorFactor, vec3( 1.0 ) ) * specularIntensityFactor, diffuseColor.rgb, metalnessFactor );
#else
	material.specularColor = mix( vec3( 0.04 ), diffuseColor.rgb, metalnessFactor );
	material.specularF90 = 1.0;
#endif
#ifdef USE_CLEARCOAT
	material.clearcoat = clearcoat;
	material.clearcoatRoughness = clearcoatRoughness;
	material.clearcoatF0 = vec3( 0.04 );
	material.clearcoatF90 = 1.0;
	#ifdef USE_CLEARCOATMAP
		material.clearcoat *= texture2D( clearcoatMap, vUv ).x;
	#endif
	#ifdef USE_CLEARCOAT_ROUGHNESSMAP
		material.clearcoatRoughness *= texture2D( clearcoatRoughnessMap, vUv ).y;
	#endif
	material.clearcoat = saturate( material.clearcoat );	material.clearcoatRoughness = max( material.clearcoatRoughness, 0.0525 );
	material.clearcoatRoughness += geometryRoughness;
	material.clearcoatRoughness = min( material.clearcoatRoughness, 1.0 );
#endif
#ifdef USE_IRIDESCENCE
	material.iridescence = iridescence;
	material.iridescenceIOR = iridescenceIOR;
	#ifdef USE_IRIDESCENCEMAP
		material.iridescence *= texture2D( iridescenceMap, vUv ).r;
	#endif
	#ifdef USE_IRIDESCENCE_THICKNESSMAP
		material.iridescenceThickness = (iridescenceThicknessMaximum - iridescenceThicknessMinimum) * texture2D( iridescenceThicknessMap, vUv ).g + iridescenceThicknessMinimum;
	#else
		material.iridescenceThickness = iridescenceThicknessMaximum;
	#endif
#endif
#ifdef USE_SHEEN
	material.sheenColor = sheenColor;
	#ifdef USE_SHEENCOLORMAP
		material.sheenColor *= texture2D( sheenColorMap, vUv ).rgb;
	#endif
	material.sheenRoughness = clamp( sheenRoughness, 0.07, 1.0 );
	#ifdef USE_SHEENROUGHNESSMAP
		material.sheenRoughness *= texture2D( sheenRoughnessMap, vUv ).a;
	#endif
#endif`,Bg=`struct PhysicalMaterial {
	vec3 diffuseColor;
	float roughness;
	vec3 specularColor;
	float specularF90;
	#ifdef USE_CLEARCOAT
		float clearcoat;
		float clearcoatRoughness;
		vec3 clearcoatF0;
		float clearcoatF90;
	#endif
	#ifdef USE_IRIDESCENCE
		float iridescence;
		float iridescenceIOR;
		float iridescenceThickness;
		vec3 iridescenceFresnel;
		vec3 iridescenceF0;
	#endif
	#ifdef USE_SHEEN
		vec3 sheenColor;
		float sheenRoughness;
	#endif
	#ifdef IOR
		float ior;
	#endif
	#ifdef USE_TRANSMISSION
		float transmission;
		float transmissionAlpha;
		float thickness;
		float attenuationDistance;
		vec3 attenuationColor;
	#endif
};
vec3 clearcoatSpecular = vec3( 0.0 );
vec3 sheenSpecular = vec3( 0.0 );
float IBLSheenBRDF( const in vec3 normal, const in vec3 viewDir, const in float roughness ) {
	float dotNV = saturate( dot( normal, viewDir ) );
	float r2 = roughness * roughness;
	float a = roughness < 0.25 ? -339.2 * r2 + 161.4 * roughness - 25.9 : -8.48 * r2 + 14.3 * roughness - 9.95;
	float b = roughness < 0.25 ? 44.0 * r2 - 23.7 * roughness + 3.26 : 1.97 * r2 - 3.27 * roughness + 0.72;
	float DG = exp( a * dotNV + b ) + ( roughness < 0.25 ? 0.0 : 0.1 * ( roughness - 0.25 ) );
	return saturate( DG * RECIPROCAL_PI );
}
vec2 DFGApprox( const in vec3 normal, const in vec3 viewDir, const in float roughness ) {
	float dotNV = saturate( dot( normal, viewDir ) );
	const vec4 c0 = vec4( - 1, - 0.0275, - 0.572, 0.022 );
	const vec4 c1 = vec4( 1, 0.0425, 1.04, - 0.04 );
	vec4 r = roughness * c0 + c1;
	float a004 = min( r.x * r.x, exp2( - 9.28 * dotNV ) ) * r.x + r.y;
	vec2 fab = vec2( - 1.04, 1.04 ) * a004 + r.zw;
	return fab;
}
vec3 EnvironmentBRDF( const in vec3 normal, const in vec3 viewDir, const in vec3 specularColor, const in float specularF90, const in float roughness ) {
	vec2 fab = DFGApprox( normal, viewDir, roughness );
	return specularColor * fab.x + specularF90 * fab.y;
}
#ifdef USE_IRIDESCENCE
void computeMultiscatteringIridescence( const in vec3 normal, const in vec3 viewDir, const in vec3 specularColor, const in float specularF90, const in float iridescence, const in vec3 iridescenceF0, const in float roughness, inout vec3 singleScatter, inout vec3 multiScatter ) {
#else
void computeMultiscattering( const in vec3 normal, const in vec3 viewDir, const in vec3 specularColor, const in float specularF90, const in float roughness, inout vec3 singleScatter, inout vec3 multiScatter ) {
#endif
	vec2 fab = DFGApprox( normal, viewDir, roughness );
	#ifdef USE_IRIDESCENCE
		vec3 Fr = mix( specularColor, iridescenceF0, iridescence );
	#else
		vec3 Fr = specularColor;
	#endif
	vec3 FssEss = Fr * fab.x + specularF90 * fab.y;
	float Ess = fab.x + fab.y;
	float Ems = 1.0 - Ess;
	vec3 Favg = Fr + ( 1.0 - Fr ) * 0.047619;	vec3 Fms = FssEss * Favg / ( 1.0 - Ems * Favg );
	singleScatter += FssEss;
	multiScatter += Fms * Ems;
}
#if NUM_RECT_AREA_LIGHTS > 0
	void RE_Direct_RectArea_Physical( const in RectAreaLight rectAreaLight, const in GeometricContext geometry, const in PhysicalMaterial material, inout ReflectedLight reflectedLight ) {
		vec3 normal = geometry.normal;
		vec3 viewDir = geometry.viewDir;
		vec3 position = geometry.position;
		vec3 lightPos = rectAreaLight.position;
		vec3 halfWidth = rectAreaLight.halfWidth;
		vec3 halfHeight = rectAreaLight.halfHeight;
		vec3 lightColor = rectAreaLight.color;
		float roughness = material.roughness;
		vec3 rectCoords[ 4 ];
		rectCoords[ 0 ] = lightPos + halfWidth - halfHeight;		rectCoords[ 1 ] = lightPos - halfWidth - halfHeight;
		rectCoords[ 2 ] = lightPos - halfWidth + halfHeight;
		rectCoords[ 3 ] = lightPos + halfWidth + halfHeight;
		vec2 uv = LTC_Uv( normal, viewDir, roughness );
		vec4 t1 = texture2D( ltc_1, uv );
		vec4 t2 = texture2D( ltc_2, uv );
		mat3 mInv = mat3(
			vec3( t1.x, 0, t1.y ),
			vec3(    0, 1,    0 ),
			vec3( t1.z, 0, t1.w )
		);
		vec3 fresnel = ( material.specularColor * t2.x + ( vec3( 1.0 ) - material.specularColor ) * t2.y );
		reflectedLight.directSpecular += lightColor * fresnel * LTC_Evaluate( normal, viewDir, position, mInv, rectCoords );
		reflectedLight.directDiffuse += lightColor * material.diffuseColor * LTC_Evaluate( normal, viewDir, position, mat3( 1.0 ), rectCoords );
	}
#endif
void RE_Direct_Physical( const in IncidentLight directLight, const in GeometricContext geometry, const in PhysicalMaterial material, inout ReflectedLight reflectedLight ) {
	float dotNL = saturate( dot( geometry.normal, directLight.direction ) );
	vec3 irradiance = dotNL * directLight.color;
	#ifdef USE_CLEARCOAT
		float dotNLcc = saturate( dot( geometry.clearcoatNormal, directLight.direction ) );
		vec3 ccIrradiance = dotNLcc * directLight.color;
		clearcoatSpecular += ccIrradiance * BRDF_GGX( directLight.direction, geometry.viewDir, geometry.clearcoatNormal, material.clearcoatF0, material.clearcoatF90, material.clearcoatRoughness );
	#endif
	#ifdef USE_SHEEN
		sheenSpecular += irradiance * BRDF_Sheen( directLight.direction, geometry.viewDir, geometry.normal, material.sheenColor, material.sheenRoughness );
	#endif
	#ifdef USE_IRIDESCENCE
		reflectedLight.directSpecular += irradiance * BRDF_GGX_Iridescence( directLight.direction, geometry.viewDir, geometry.normal, material.specularColor, material.specularF90, material.iridescence, material.iridescenceFresnel, material.roughness );
	#else
		reflectedLight.directSpecular += irradiance * BRDF_GGX( directLight.direction, geometry.viewDir, geometry.normal, material.specularColor, material.specularF90, material.roughness );
	#endif
	reflectedLight.directDiffuse += irradiance * BRDF_Lambert( material.diffuseColor );
}
void RE_IndirectDiffuse_Physical( const in vec3 irradiance, const in GeometricContext geometry, const in PhysicalMaterial material, inout ReflectedLight reflectedLight ) {
	reflectedLight.indirectDiffuse += irradiance * BRDF_Lambert( material.diffuseColor );
}
void RE_IndirectSpecular_Physical( const in vec3 radiance, const in vec3 irradiance, const in vec3 clearcoatRadiance, const in GeometricContext geometry, const in PhysicalMaterial material, inout ReflectedLight reflectedLight) {
	#ifdef USE_CLEARCOAT
		clearcoatSpecular += clearcoatRadiance * EnvironmentBRDF( geometry.clearcoatNormal, geometry.viewDir, material.clearcoatF0, material.clearcoatF90, material.clearcoatRoughness );
	#endif
	#ifdef USE_SHEEN
		sheenSpecular += irradiance * material.sheenColor * IBLSheenBRDF( geometry.normal, geometry.viewDir, material.sheenRoughness );
	#endif
	vec3 singleScattering = vec3( 0.0 );
	vec3 multiScattering = vec3( 0.0 );
	vec3 cosineWeightedIrradiance = irradiance * RECIPROCAL_PI;
	#ifdef USE_IRIDESCENCE
		computeMultiscatteringIridescence( geometry.normal, geometry.viewDir, material.specularColor, material.specularF90, material.iridescence, material.iridescenceFresnel, material.roughness, singleScattering, multiScattering );
	#else
		computeMultiscattering( geometry.normal, geometry.viewDir, material.specularColor, material.specularF90, material.roughness, singleScattering, multiScattering );
	#endif
	vec3 totalScattering = singleScattering + multiScattering;
	vec3 diffuse = material.diffuseColor * ( 1.0 - max( max( totalScattering.r, totalScattering.g ), totalScattering.b ) );
	reflectedLight.indirectSpecular += radiance * singleScattering;
	reflectedLight.indirectSpecular += multiScattering * cosineWeightedIrradiance;
	reflectedLight.indirectDiffuse += diffuse * cosineWeightedIrradiance;
}
#define RE_Direct				RE_Direct_Physical
#define RE_Direct_RectArea		RE_Direct_RectArea_Physical
#define RE_IndirectDiffuse		RE_IndirectDiffuse_Physical
#define RE_IndirectSpecular		RE_IndirectSpecular_Physical
float computeSpecularOcclusion( const in float dotNV, const in float ambientOcclusion, const in float roughness ) {
	return saturate( pow( dotNV + ambientOcclusion, exp2( - 16.0 * roughness - 1.0 ) ) - 1.0 + ambientOcclusion );
}`,Vg=`
GeometricContext geometry;
geometry.position = - vViewPosition;
geometry.normal = normal;
geometry.viewDir = ( isOrthographic ) ? vec3( 0, 0, 1 ) : normalize( vViewPosition );
#ifdef USE_CLEARCOAT
	geometry.clearcoatNormal = clearcoatNormal;
#endif
#ifdef USE_IRIDESCENCE
	float dotNVi = saturate( dot( normal, geometry.viewDir ) );
	if ( material.iridescenceThickness == 0.0 ) {
		material.iridescence = 0.0;
	} else {
		material.iridescence = saturate( material.iridescence );
	}
	if ( material.iridescence > 0.0 ) {
		material.iridescenceFresnel = evalIridescence( 1.0, material.iridescenceIOR, dotNVi, material.iridescenceThickness, material.specularColor );
		material.iridescenceF0 = Schlick_to_F0( material.iridescenceFresnel, 1.0, dotNVi );
	}
#endif
IncidentLight directLight;
#if ( NUM_POINT_LIGHTS > 0 ) && defined( RE_Direct )
	PointLight pointLight;
	#if defined( USE_SHADOWMAP ) && NUM_POINT_LIGHT_SHADOWS > 0
	PointLightShadow pointLightShadow;
	#endif
	#pragma unroll_loop_start
	for ( int i = 0; i < NUM_POINT_LIGHTS; i ++ ) {
		pointLight = pointLights[ i ];
		getPointLightInfo( pointLight, geometry, directLight );
		#if defined( USE_SHADOWMAP ) && ( UNROLLED_LOOP_INDEX < NUM_POINT_LIGHT_SHADOWS )
		pointLightShadow = pointLightShadows[ i ];
		directLight.color *= ( directLight.visible && receiveShadow ) ? getPointShadow( pointShadowMap[ i ], pointLightShadow.shadowMapSize, pointLightShadow.shadowBias, pointLightShadow.shadowRadius, vPointShadowCoord[ i ], pointLightShadow.shadowCameraNear, pointLightShadow.shadowCameraFar ) : 1.0;
		#endif
		RE_Direct( directLight, geometry, material, reflectedLight );
	}
	#pragma unroll_loop_end
#endif
#if ( NUM_SPOT_LIGHTS > 0 ) && defined( RE_Direct )
	SpotLight spotLight;
	vec4 spotColor;
	vec3 spotLightCoord;
	bool inSpotLightMap;
	#if defined( USE_SHADOWMAP ) && NUM_SPOT_LIGHT_SHADOWS > 0
	SpotLightShadow spotLightShadow;
	#endif
	#pragma unroll_loop_start
	for ( int i = 0; i < NUM_SPOT_LIGHTS; i ++ ) {
		spotLight = spotLights[ i ];
		getSpotLightInfo( spotLight, geometry, directLight );
		#if ( UNROLLED_LOOP_INDEX < NUM_SPOT_LIGHT_SHADOWS_WITH_MAPS )
		#define SPOT_LIGHT_MAP_INDEX UNROLLED_LOOP_INDEX
		#elif ( UNROLLED_LOOP_INDEX < NUM_SPOT_LIGHT_SHADOWS )
		#define SPOT_LIGHT_MAP_INDEX NUM_SPOT_LIGHT_MAPS
		#else
		#define SPOT_LIGHT_MAP_INDEX ( UNROLLED_LOOP_INDEX - NUM_SPOT_LIGHT_SHADOWS + NUM_SPOT_LIGHT_SHADOWS_WITH_MAPS )
		#endif
		#if ( SPOT_LIGHT_MAP_INDEX < NUM_SPOT_LIGHT_MAPS )
			spotLightCoord = vSpotLightCoord[ i ].xyz / vSpotLightCoord[ i ].w;
			inSpotLightMap = all( lessThan( abs( spotLightCoord * 2. - 1. ), vec3( 1.0 ) ) );
			spotColor = texture2D( spotLightMap[ SPOT_LIGHT_MAP_INDEX ], spotLightCoord.xy );
			directLight.color = inSpotLightMap ? directLight.color * spotColor.rgb : directLight.color;
		#endif
		#undef SPOT_LIGHT_MAP_INDEX
		#if defined( USE_SHADOWMAP ) && ( UNROLLED_LOOP_INDEX < NUM_SPOT_LIGHT_SHADOWS )
		spotLightShadow = spotLightShadows[ i ];
		directLight.color *= ( directLight.visible && receiveShadow ) ? getShadow( spotShadowMap[ i ], spotLightShadow.shadowMapSize, spotLightShadow.shadowBias, spotLightShadow.shadowRadius, vSpotLightCoord[ i ] ) : 1.0;
		#endif
		RE_Direct( directLight, geometry, material, reflectedLight );
	}
	#pragma unroll_loop_end
#endif
#if ( NUM_DIR_LIGHTS > 0 ) && defined( RE_Direct )
	DirectionalLight directionalLight;
	#if defined( USE_SHADOWMAP ) && NUM_DIR_LIGHT_SHADOWS > 0
	DirectionalLightShadow directionalLightShadow;
	#endif
	#pragma unroll_loop_start
	for ( int i = 0; i < NUM_DIR_LIGHTS; i ++ ) {
		directionalLight = directionalLights[ i ];
		getDirectionalLightInfo( directionalLight, geometry, directLight );
		#if defined( USE_SHADOWMAP ) && ( UNROLLED_LOOP_INDEX < NUM_DIR_LIGHT_SHADOWS )
		directionalLightShadow = directionalLightShadows[ i ];
		directLight.color *= ( directLight.visible && receiveShadow ) ? getShadow( directionalShadowMap[ i ], directionalLightShadow.shadowMapSize, directionalLightShadow.shadowBias, directionalLightShadow.shadowRadius, vDirectionalShadowCoord[ i ] ) : 1.0;
		#endif
		RE_Direct( directLight, geometry, material, reflectedLight );
	}
	#pragma unroll_loop_end
#endif
#if ( NUM_RECT_AREA_LIGHTS > 0 ) && defined( RE_Direct_RectArea )
	RectAreaLight rectAreaLight;
	#pragma unroll_loop_start
	for ( int i = 0; i < NUM_RECT_AREA_LIGHTS; i ++ ) {
		rectAreaLight = rectAreaLights[ i ];
		RE_Direct_RectArea( rectAreaLight, geometry, material, reflectedLight );
	}
	#pragma unroll_loop_end
#endif
#if defined( RE_IndirectDiffuse )
	vec3 iblIrradiance = vec3( 0.0 );
	vec3 irradiance = getAmbientLightIrradiance( ambientLightColor );
	irradiance += getLightProbeIrradiance( lightProbe, geometry.normal );
	#if ( NUM_HEMI_LIGHTS > 0 )
		#pragma unroll_loop_start
		for ( int i = 0; i < NUM_HEMI_LIGHTS; i ++ ) {
			irradiance += getHemisphereLightIrradiance( hemisphereLights[ i ], geometry.normal );
		}
		#pragma unroll_loop_end
	#endif
#endif
#if defined( RE_IndirectSpecular )
	vec3 radiance = vec3( 0.0 );
	vec3 clearcoatRadiance = vec3( 0.0 );
#endif`,Gg=`#if defined( RE_IndirectDiffuse )
	#ifdef USE_LIGHTMAP
		vec4 lightMapTexel = texture2D( lightMap, vUv2 );
		vec3 lightMapIrradiance = lightMapTexel.rgb * lightMapIntensity;
		irradiance += lightMapIrradiance;
	#endif
	#if defined( USE_ENVMAP ) && defined( STANDARD ) && defined( ENVMAP_TYPE_CUBE_UV )
		iblIrradiance += getIBLIrradiance( geometry.normal );
	#endif
#endif
#if defined( USE_ENVMAP ) && defined( RE_IndirectSpecular )
	radiance += getIBLRadiance( geometry.viewDir, geometry.normal, material.roughness );
	#ifdef USE_CLEARCOAT
		clearcoatRadiance += getIBLRadiance( geometry.viewDir, geometry.clearcoatNormal, material.clearcoatRoughness );
	#endif
#endif`,Hg=`#if defined( RE_IndirectDiffuse )
	RE_IndirectDiffuse( irradiance, geometry, material, reflectedLight );
#endif
#if defined( RE_IndirectSpecular )
	RE_IndirectSpecular( radiance, iblIrradiance, clearcoatRadiance, geometry, material, reflectedLight );
#endif`,Wg=`#if defined( USE_LOGDEPTHBUF ) && defined( USE_LOGDEPTHBUF_EXT )
	gl_FragDepthEXT = vIsPerspective == 0.0 ? gl_FragCoord.z : log2( vFragDepth ) * logDepthBufFC * 0.5;
#endif`,Xg=`#if defined( USE_LOGDEPTHBUF ) && defined( USE_LOGDEPTHBUF_EXT )
	uniform float logDepthBufFC;
	varying float vFragDepth;
	varying float vIsPerspective;
#endif`,jg=`#ifdef USE_LOGDEPTHBUF
	#ifdef USE_LOGDEPTHBUF_EXT
		varying float vFragDepth;
		varying float vIsPerspective;
	#else
		uniform float logDepthBufFC;
	#endif
#endif`,qg=`#ifdef USE_LOGDEPTHBUF
	#ifdef USE_LOGDEPTHBUF_EXT
		vFragDepth = 1.0 + gl_Position.w;
		vIsPerspective = float( isPerspectiveMatrix( projectionMatrix ) );
	#else
		if ( isPerspectiveMatrix( projectionMatrix ) ) {
			gl_Position.z = log2( max( EPSILON, gl_Position.w + 1.0 ) ) * logDepthBufFC - 1.0;
			gl_Position.z *= gl_Position.w;
		}
	#endif
#endif`,Yg=`#ifdef USE_MAP
	vec4 sampledDiffuseColor = texture2D( map, vUv );
	#ifdef DECODE_VIDEO_TEXTURE
		sampledDiffuseColor = vec4( mix( pow( sampledDiffuseColor.rgb * 0.9478672986 + vec3( 0.0521327014 ), vec3( 2.4 ) ), sampledDiffuseColor.rgb * 0.0773993808, vec3( lessThanEqual( sampledDiffuseColor.rgb, vec3( 0.04045 ) ) ) ), sampledDiffuseColor.w );
	#endif
	diffuseColor *= sampledDiffuseColor;
#endif`,Zg=`#ifdef USE_MAP
	uniform sampler2D map;
#endif`,Kg=`#if defined( USE_MAP ) || defined( USE_ALPHAMAP )
	vec2 uv = ( uvTransform * vec3( gl_PointCoord.x, 1.0 - gl_PointCoord.y, 1 ) ).xy;
#endif
#ifdef USE_MAP
	diffuseColor *= texture2D( map, uv );
#endif
#ifdef USE_ALPHAMAP
	diffuseColor.a *= texture2D( alphaMap, uv ).g;
#endif`,Jg=`#if defined( USE_MAP ) || defined( USE_ALPHAMAP )
	uniform mat3 uvTransform;
#endif
#ifdef USE_MAP
	uniform sampler2D map;
#endif
#ifdef USE_ALPHAMAP
	uniform sampler2D alphaMap;
#endif`,Qg=`float metalnessFactor = metalness;
#ifdef USE_METALNESSMAP
	vec4 texelMetalness = texture2D( metalnessMap, vUv );
	metalnessFactor *= texelMetalness.b;
#endif`,$g=`#ifdef USE_METALNESSMAP
	uniform sampler2D metalnessMap;
#endif`,e0=`#if defined( USE_MORPHCOLORS ) && defined( MORPHTARGETS_TEXTURE )
	vColor *= morphTargetBaseInfluence;
	for ( int i = 0; i < MORPHTARGETS_COUNT; i ++ ) {
		#if defined( USE_COLOR_ALPHA )
			if ( morphTargetInfluences[ i ] != 0.0 ) vColor += getMorph( gl_VertexID, i, 2 ) * morphTargetInfluences[ i ];
		#elif defined( USE_COLOR )
			if ( morphTargetInfluences[ i ] != 0.0 ) vColor += getMorph( gl_VertexID, i, 2 ).rgb * morphTargetInfluences[ i ];
		#endif
	}
#endif`,t0=`#ifdef USE_MORPHNORMALS
	objectNormal *= morphTargetBaseInfluence;
	#ifdef MORPHTARGETS_TEXTURE
		for ( int i = 0; i < MORPHTARGETS_COUNT; i ++ ) {
			if ( morphTargetInfluences[ i ] != 0.0 ) objectNormal += getMorph( gl_VertexID, i, 1 ).xyz * morphTargetInfluences[ i ];
		}
	#else
		objectNormal += morphNormal0 * morphTargetInfluences[ 0 ];
		objectNormal += morphNormal1 * morphTargetInfluences[ 1 ];
		objectNormal += morphNormal2 * morphTargetInfluences[ 2 ];
		objectNormal += morphNormal3 * morphTargetInfluences[ 3 ];
	#endif
#endif`,n0=`#ifdef USE_MORPHTARGETS
	uniform float morphTargetBaseInfluence;
	#ifdef MORPHTARGETS_TEXTURE
		uniform float morphTargetInfluences[ MORPHTARGETS_COUNT ];
		uniform sampler2DArray morphTargetsTexture;
		uniform ivec2 morphTargetsTextureSize;
		vec4 getMorph( const in int vertexIndex, const in int morphTargetIndex, const in int offset ) {
			int texelIndex = vertexIndex * MORPHTARGETS_TEXTURE_STRIDE + offset;
			int y = texelIndex / morphTargetsTextureSize.x;
			int x = texelIndex - y * morphTargetsTextureSize.x;
			ivec3 morphUV = ivec3( x, y, morphTargetIndex );
			return texelFetch( morphTargetsTexture, morphUV, 0 );
		}
	#else
		#ifndef USE_MORPHNORMALS
			uniform float morphTargetInfluences[ 8 ];
		#else
			uniform float morphTargetInfluences[ 4 ];
		#endif
	#endif
#endif`,i0=`#ifdef USE_MORPHTARGETS
	transformed *= morphTargetBaseInfluence;
	#ifdef MORPHTARGETS_TEXTURE
		for ( int i = 0; i < MORPHTARGETS_COUNT; i ++ ) {
			if ( morphTargetInfluences[ i ] != 0.0 ) transformed += getMorph( gl_VertexID, i, 0 ).xyz * morphTargetInfluences[ i ];
		}
	#else
		transformed += morphTarget0 * morphTargetInfluences[ 0 ];
		transformed += morphTarget1 * morphTargetInfluences[ 1 ];
		transformed += morphTarget2 * morphTargetInfluences[ 2 ];
		transformed += morphTarget3 * morphTargetInfluences[ 3 ];
		#ifndef USE_MORPHNORMALS
			transformed += morphTarget4 * morphTargetInfluences[ 4 ];
			transformed += morphTarget5 * morphTargetInfluences[ 5 ];
			transformed += morphTarget6 * morphTargetInfluences[ 6 ];
			transformed += morphTarget7 * morphTargetInfluences[ 7 ];
		#endif
	#endif
#endif`,r0=`float faceDirection = gl_FrontFacing ? 1.0 : - 1.0;
#ifdef FLAT_SHADED
	vec3 fdx = dFdx( vViewPosition );
	vec3 fdy = dFdy( vViewPosition );
	vec3 normal = normalize( cross( fdx, fdy ) );
#else
	vec3 normal = normalize( vNormal );
	#ifdef DOUBLE_SIDED
		normal = normal * faceDirection;
	#endif
	#ifdef USE_TANGENT
		vec3 tangent = normalize( vTangent );
		vec3 bitangent = normalize( vBitangent );
		#ifdef DOUBLE_SIDED
			tangent = tangent * faceDirection;
			bitangent = bitangent * faceDirection;
		#endif
		#if defined( TANGENTSPACE_NORMALMAP ) || defined( USE_CLEARCOAT_NORMALMAP )
			mat3 vTBN = mat3( tangent, bitangent, normal );
		#endif
	#endif
#endif
vec3 geometryNormal = normal;`,s0=`#ifdef OBJECTSPACE_NORMALMAP
	normal = texture2D( normalMap, vUv ).xyz * 2.0 - 1.0;
	#ifdef FLIP_SIDED
		normal = - normal;
	#endif
	#ifdef DOUBLE_SIDED
		normal = normal * faceDirection;
	#endif
	normal = normalize( normalMatrix * normal );
#elif defined( TANGENTSPACE_NORMALMAP )
	vec3 mapN = texture2D( normalMap, vUv ).xyz * 2.0 - 1.0;
	mapN.xy *= normalScale;
	#ifdef USE_TANGENT
		normal = normalize( vTBN * mapN );
	#else
		normal = perturbNormal2Arb( - vViewPosition, normal, mapN, faceDirection );
	#endif
#elif defined( USE_BUMPMAP )
	normal = perturbNormalArb( - vViewPosition, normal, dHdxy_fwd(), faceDirection );
#endif`,a0=`#ifndef FLAT_SHADED
	varying vec3 vNormal;
	#ifdef USE_TANGENT
		varying vec3 vTangent;
		varying vec3 vBitangent;
	#endif
#endif`,o0=`#ifndef FLAT_SHADED
	varying vec3 vNormal;
	#ifdef USE_TANGENT
		varying vec3 vTangent;
		varying vec3 vBitangent;
	#endif
#endif`,l0=`#ifndef FLAT_SHADED
	vNormal = normalize( transformedNormal );
	#ifdef USE_TANGENT
		vTangent = normalize( transformedTangent );
		vBitangent = normalize( cross( vNormal, vTangent ) * tangent.w );
	#endif
#endif`,c0=`#ifdef USE_NORMALMAP
	uniform sampler2D normalMap;
	uniform vec2 normalScale;
#endif
#ifdef OBJECTSPACE_NORMALMAP
	uniform mat3 normalMatrix;
#endif
#if ! defined ( USE_TANGENT ) && ( defined ( TANGENTSPACE_NORMALMAP ) || defined ( USE_CLEARCOAT_NORMALMAP ) )
	vec3 perturbNormal2Arb( vec3 eye_pos, vec3 surf_norm, vec3 mapN, float faceDirection ) {
		vec3 q0 = dFdx( eye_pos.xyz );
		vec3 q1 = dFdy( eye_pos.xyz );
		vec2 st0 = dFdx( vUv.st );
		vec2 st1 = dFdy( vUv.st );
		vec3 N = surf_norm;
		vec3 q1perp = cross( q1, N );
		vec3 q0perp = cross( N, q0 );
		vec3 T = q1perp * st0.x + q0perp * st1.x;
		vec3 B = q1perp * st0.y + q0perp * st1.y;
		float det = max( dot( T, T ), dot( B, B ) );
		float scale = ( det == 0.0 ) ? 0.0 : faceDirection * inversesqrt( det );
		return normalize( T * ( mapN.x * scale ) + B * ( mapN.y * scale ) + N * mapN.z );
	}
#endif`,u0=`#ifdef USE_CLEARCOAT
	vec3 clearcoatNormal = geometryNormal;
#endif`,f0=`#ifdef USE_CLEARCOAT_NORMALMAP
	vec3 clearcoatMapN = texture2D( clearcoatNormalMap, vUv ).xyz * 2.0 - 1.0;
	clearcoatMapN.xy *= clearcoatNormalScale;
	#ifdef USE_TANGENT
		clearcoatNormal = normalize( vTBN * clearcoatMapN );
	#else
		clearcoatNormal = perturbNormal2Arb( - vViewPosition, clearcoatNormal, clearcoatMapN, faceDirection );
	#endif
#endif`,d0=`#ifdef USE_CLEARCOATMAP
	uniform sampler2D clearcoatMap;
#endif
#ifdef USE_CLEARCOAT_ROUGHNESSMAP
	uniform sampler2D clearcoatRoughnessMap;
#endif
#ifdef USE_CLEARCOAT_NORMALMAP
	uniform sampler2D clearcoatNormalMap;
	uniform vec2 clearcoatNormalScale;
#endif`,h0=`#ifdef USE_IRIDESCENCEMAP
	uniform sampler2D iridescenceMap;
#endif
#ifdef USE_IRIDESCENCE_THICKNESSMAP
	uniform sampler2D iridescenceThicknessMap;
#endif`,p0=`#ifdef OPAQUE
diffuseColor.a = 1.0;
#endif
#ifdef USE_TRANSMISSION
diffuseColor.a *= material.transmissionAlpha + 0.1;
#endif
gl_FragColor = vec4( outgoingLight, diffuseColor.a );`,m0=`vec3 packNormalToRGB( const in vec3 normal ) {
	return normalize( normal ) * 0.5 + 0.5;
}
vec3 unpackRGBToNormal( const in vec3 rgb ) {
	return 2.0 * rgb.xyz - 1.0;
}
const float PackUpscale = 256. / 255.;const float UnpackDownscale = 255. / 256.;
const vec3 PackFactors = vec3( 256. * 256. * 256., 256. * 256., 256. );
const vec4 UnpackFactors = UnpackDownscale / vec4( PackFactors, 1. );
const float ShiftRight8 = 1. / 256.;
vec4 packDepthToRGBA( const in float v ) {
	vec4 r = vec4( fract( v * PackFactors ), v );
	r.yzw -= r.xyz * ShiftRight8;	return r * PackUpscale;
}
float unpackRGBAToDepth( const in vec4 v ) {
	return dot( v, UnpackFactors );
}
vec2 packDepthToRG( in highp float v ) {
	return packDepthToRGBA( v ).yx;
}
float unpackRGToDepth( const in highp vec2 v ) {
	return unpackRGBAToDepth( vec4( v.xy, 0.0, 0.0 ) );
}
vec4 pack2HalfToRGBA( vec2 v ) {
	vec4 r = vec4( v.x, fract( v.x * 255.0 ), v.y, fract( v.y * 255.0 ) );
	return vec4( r.x - r.y / 255.0, r.y, r.z - r.w / 255.0, r.w );
}
vec2 unpackRGBATo2Half( vec4 v ) {
	return vec2( v.x + ( v.y / 255.0 ), v.z + ( v.w / 255.0 ) );
}
float viewZToOrthographicDepth( const in float viewZ, const in float near, const in float far ) {
	return ( viewZ + near ) / ( near - far );
}
float orthographicDepthToViewZ( const in float linearClipZ, const in float near, const in float far ) {
	return linearClipZ * ( near - far ) - near;
}
float viewZToPerspectiveDepth( const in float viewZ, const in float near, const in float far ) {
	return ( ( near + viewZ ) * far ) / ( ( far - near ) * viewZ );
}
float perspectiveDepthToViewZ( const in float invClipZ, const in float near, const in float far ) {
	return ( near * far ) / ( ( far - near ) * invClipZ - far );
}`,_0=`#ifdef PREMULTIPLIED_ALPHA
	gl_FragColor.rgb *= gl_FragColor.a;
#endif`,g0=`vec4 mvPosition = vec4( transformed, 1.0 );
#ifdef USE_INSTANCING
	mvPosition = instanceMatrix * mvPosition;
#endif
mvPosition = modelViewMatrix * mvPosition;
gl_Position = projectionMatrix * mvPosition;`,b0=`#ifdef DITHERING
	gl_FragColor.rgb = dithering( gl_FragColor.rgb );
#endif`,v0=`#ifdef DITHERING
	vec3 dithering( vec3 color ) {
		float grid_position = rand( gl_FragCoord.xy );
		vec3 dither_shift_RGB = vec3( 0.25 / 255.0, -0.25 / 255.0, 0.25 / 255.0 );
		dither_shift_RGB = mix( 2.0 * dither_shift_RGB, -2.0 * dither_shift_RGB, grid_position );
		return color + dither_shift_RGB;
	}
#endif`,y0=`float roughnessFactor = roughness;
#ifdef USE_ROUGHNESSMAP
	vec4 texelRoughness = texture2D( roughnessMap, vUv );
	roughnessFactor *= texelRoughness.g;
#endif`,w0=`#ifdef USE_ROUGHNESSMAP
	uniform sampler2D roughnessMap;
#endif`,M0=`#if NUM_SPOT_LIGHT_COORDS > 0
	varying vec4 vSpotLightCoord[ NUM_SPOT_LIGHT_COORDS ];
#endif
#if NUM_SPOT_LIGHT_MAPS > 0
	uniform sampler2D spotLightMap[ NUM_SPOT_LIGHT_MAPS ];
#endif
#ifdef USE_SHADOWMAP
	#if NUM_DIR_LIGHT_SHADOWS > 0
		uniform sampler2D directionalShadowMap[ NUM_DIR_LIGHT_SHADOWS ];
		varying vec4 vDirectionalShadowCoord[ NUM_DIR_LIGHT_SHADOWS ];
		struct DirectionalLightShadow {
			float shadowBias;
			float shadowNormalBias;
			float shadowRadius;
			vec2 shadowMapSize;
		};
		uniform DirectionalLightShadow directionalLightShadows[ NUM_DIR_LIGHT_SHADOWS ];
	#endif
	#if NUM_SPOT_LIGHT_SHADOWS > 0
		uniform sampler2D spotShadowMap[ NUM_SPOT_LIGHT_SHADOWS ];
		struct SpotLightShadow {
			float shadowBias;
			float shadowNormalBias;
			float shadowRadius;
			vec2 shadowMapSize;
		};
		uniform SpotLightShadow spotLightShadows[ NUM_SPOT_LIGHT_SHADOWS ];
	#endif
	#if NUM_POINT_LIGHT_SHADOWS > 0
		uniform sampler2D pointShadowMap[ NUM_POINT_LIGHT_SHADOWS ];
		varying vec4 vPointShadowCoord[ NUM_POINT_LIGHT_SHADOWS ];
		struct PointLightShadow {
			float shadowBias;
			float shadowNormalBias;
			float shadowRadius;
			vec2 shadowMapSize;
			float shadowCameraNear;
			float shadowCameraFar;
		};
		uniform PointLightShadow pointLightShadows[ NUM_POINT_LIGHT_SHADOWS ];
	#endif
	float texture2DCompare( sampler2D depths, vec2 uv, float compare ) {
		return step( compare, unpackRGBAToDepth( texture2D( depths, uv ) ) );
	}
	vec2 texture2DDistribution( sampler2D shadow, vec2 uv ) {
		return unpackRGBATo2Half( texture2D( shadow, uv ) );
	}
	float VSMShadow (sampler2D shadow, vec2 uv, float compare ){
		float occlusion = 1.0;
		vec2 distribution = texture2DDistribution( shadow, uv );
		float hard_shadow = step( compare , distribution.x );
		if (hard_shadow != 1.0 ) {
			float distance = compare - distribution.x ;
			float variance = max( 0.00000, distribution.y * distribution.y );
			float softness_probability = variance / (variance + distance * distance );			softness_probability = clamp( ( softness_probability - 0.3 ) / ( 0.95 - 0.3 ), 0.0, 1.0 );			occlusion = clamp( max( hard_shadow, softness_probability ), 0.0, 1.0 );
		}
		return occlusion;
	}
	float getShadow( sampler2D shadowMap, vec2 shadowMapSize, float shadowBias, float shadowRadius, vec4 shadowCoord ) {
		float shadow = 1.0;
		shadowCoord.xyz /= shadowCoord.w;
		shadowCoord.z += shadowBias;
		bool inFrustum = shadowCoord.x >= 0.0 && shadowCoord.x <= 1.0 && shadowCoord.y >= 0.0 && shadowCoord.y <= 1.0;
		bool frustumTest = inFrustum && shadowCoord.z <= 1.0;
		if ( frustumTest ) {
		#if defined( SHADOWMAP_TYPE_PCF )
			vec2 texelSize = vec2( 1.0 ) / shadowMapSize;
			float dx0 = - texelSize.x * shadowRadius;
			float dy0 = - texelSize.y * shadowRadius;
			float dx1 = + texelSize.x * shadowRadius;
			float dy1 = + texelSize.y * shadowRadius;
			float dx2 = dx0 / 2.0;
			float dy2 = dy0 / 2.0;
			float dx3 = dx1 / 2.0;
			float dy3 = dy1 / 2.0;
			shadow = (
				texture2DCompare( shadowMap, shadowCoord.xy + vec2( dx0, dy0 ), shadowCoord.z ) +
				texture2DCompare( shadowMap, shadowCoord.xy + vec2( 0.0, dy0 ), shadowCoord.z ) +
				texture2DCompare( shadowMap, shadowCoord.xy + vec2( dx1, dy0 ), shadowCoord.z ) +
				texture2DCompare( shadowMap, shadowCoord.xy + vec2( dx2, dy2 ), shadowCoord.z ) +
				texture2DCompare( shadowMap, shadowCoord.xy + vec2( 0.0, dy2 ), shadowCoord.z ) +
				texture2DCompare( shadowMap, shadowCoord.xy + vec2( dx3, dy2 ), shadowCoord.z ) +
				texture2DCompare( shadowMap, shadowCoord.xy + vec2( dx0, 0.0 ), shadowCoord.z ) +
				texture2DCompare( shadowMap, shadowCoord.xy + vec2( dx2, 0.0 ), shadowCoord.z ) +
				texture2DCompare( shadowMap, shadowCoord.xy, shadowCoord.z ) +
				texture2DCompare( shadowMap, shadowCoord.xy + vec2( dx3, 0.0 ), shadowCoord.z ) +
				texture2DCompare( shadowMap, shadowCoord.xy + vec2( dx1, 0.0 ), shadowCoord.z ) +
				texture2DCompare( shadowMap, shadowCoord.xy + vec2( dx2, dy3 ), shadowCoord.z ) +
				texture2DCompare( shadowMap, shadowCoord.xy + vec2( 0.0, dy3 ), shadowCoord.z ) +
				texture2DCompare( shadowMap, shadowCoord.xy + vec2( dx3, dy3 ), shadowCoord.z ) +
				texture2DCompare( shadowMap, shadowCoord.xy + vec2( dx0, dy1 ), shadowCoord.z ) +
				texture2DCompare( shadowMap, shadowCoord.xy + vec2( 0.0, dy1 ), shadowCoord.z ) +
				texture2DCompare( shadowMap, shadowCoord.xy + vec2( dx1, dy1 ), shadowCoord.z )
			) * ( 1.0 / 17.0 );
		#elif defined( SHADOWMAP_TYPE_PCF_SOFT )
			vec2 texelSize = vec2( 1.0 ) / shadowMapSize;
			float dx = texelSize.x;
			float dy = texelSize.y;
			vec2 uv = shadowCoord.xy;
			vec2 f = fract( uv * shadowMapSize + 0.5 );
			uv -= f * texelSize;
			shadow = (
				texture2DCompare( shadowMap, uv, shadowCoord.z ) +
				texture2DCompare( shadowMap, uv + vec2( dx, 0.0 ), shadowCoord.z ) +
				texture2DCompare( shadowMap, uv + vec2( 0.0, dy ), shadowCoord.z ) +
				texture2DCompare( shadowMap, uv + texelSize, shadowCoord.z ) +
				mix( texture2DCompare( shadowMap, uv + vec2( -dx, 0.0 ), shadowCoord.z ),
					 texture2DCompare( shadowMap, uv + vec2( 2.0 * dx, 0.0 ), shadowCoord.z ),
					 f.x ) +
				mix( texture2DCompare( shadowMap, uv + vec2( -dx, dy ), shadowCoord.z ),
					 texture2DCompare( shadowMap, uv + vec2( 2.0 * dx, dy ), shadowCoord.z ),
					 f.x ) +
				mix( texture2DCompare( shadowMap, uv + vec2( 0.0, -dy ), shadowCoord.z ),
					 texture2DCompare( shadowMap, uv + vec2( 0.0, 2.0 * dy ), shadowCoord.z ),
					 f.y ) +
				mix( texture2DCompare( shadowMap, uv + vec2( dx, -dy ), shadowCoord.z ),
					 texture2DCompare( shadowMap, uv + vec2( dx, 2.0 * dy ), shadowCoord.z ),
					 f.y ) +
				mix( mix( texture2DCompare( shadowMap, uv + vec2( -dx, -dy ), shadowCoord.z ),
						  texture2DCompare( shadowMap, uv + vec2( 2.0 * dx, -dy ), shadowCoord.z ),
						  f.x ),
					 mix( texture2DCompare( shadowMap, uv + vec2( -dx, 2.0 * dy ), shadowCoord.z ),
						  texture2DCompare( shadowMap, uv + vec2( 2.0 * dx, 2.0 * dy ), shadowCoord.z ),
						  f.x ),
					 f.y )
			) * ( 1.0 / 9.0 );
		#elif defined( SHADOWMAP_TYPE_VSM )
			shadow = VSMShadow( shadowMap, shadowCoord.xy, shadowCoord.z );
		#else
			shadow = texture2DCompare( shadowMap, shadowCoord.xy, shadowCoord.z );
		#endif
		}
		return shadow;
	}
	vec2 cubeToUV( vec3 v, float texelSizeY ) {
		vec3 absV = abs( v );
		float scaleToCube = 1.0 / max( absV.x, max( absV.y, absV.z ) );
		absV *= scaleToCube;
		v *= scaleToCube * ( 1.0 - 2.0 * texelSizeY );
		vec2 planar = v.xy;
		float almostATexel = 1.5 * texelSizeY;
		float almostOne = 1.0 - almostATexel;
		if ( absV.z >= almostOne ) {
			if ( v.z > 0.0 )
				planar.x = 4.0 - v.x;
		} else if ( absV.x >= almostOne ) {
			float signX = sign( v.x );
			planar.x = v.z * signX + 2.0 * signX;
		} else if ( absV.y >= almostOne ) {
			float signY = sign( v.y );
			planar.x = v.x + 2.0 * signY + 2.0;
			planar.y = v.z * signY - 2.0;
		}
		return vec2( 0.125, 0.25 ) * planar + vec2( 0.375, 0.75 );
	}
	float getPointShadow( sampler2D shadowMap, vec2 shadowMapSize, float shadowBias, float shadowRadius, vec4 shadowCoord, float shadowCameraNear, float shadowCameraFar ) {
		vec2 texelSize = vec2( 1.0 ) / ( shadowMapSize * vec2( 4.0, 2.0 ) );
		vec3 lightToPosition = shadowCoord.xyz;
		float dp = ( length( lightToPosition ) - shadowCameraNear ) / ( shadowCameraFar - shadowCameraNear );		dp += shadowBias;
		vec3 bd3D = normalize( lightToPosition );
		#if defined( SHADOWMAP_TYPE_PCF ) || defined( SHADOWMAP_TYPE_PCF_SOFT ) || defined( SHADOWMAP_TYPE_VSM )
			vec2 offset = vec2( - 1, 1 ) * shadowRadius * texelSize.y;
			return (
				texture2DCompare( shadowMap, cubeToUV( bd3D + offset.xyy, texelSize.y ), dp ) +
				texture2DCompare( shadowMap, cubeToUV( bd3D + offset.yyy, texelSize.y ), dp ) +
				texture2DCompare( shadowMap, cubeToUV( bd3D + offset.xyx, texelSize.y ), dp ) +
				texture2DCompare( shadowMap, cubeToUV( bd3D + offset.yyx, texelSize.y ), dp ) +
				texture2DCompare( shadowMap, cubeToUV( bd3D, texelSize.y ), dp ) +
				texture2DCompare( shadowMap, cubeToUV( bd3D + offset.xxy, texelSize.y ), dp ) +
				texture2DCompare( shadowMap, cubeToUV( bd3D + offset.yxy, texelSize.y ), dp ) +
				texture2DCompare( shadowMap, cubeToUV( bd3D + offset.xxx, texelSize.y ), dp ) +
				texture2DCompare( shadowMap, cubeToUV( bd3D + offset.yxx, texelSize.y ), dp )
			) * ( 1.0 / 9.0 );
		#else
			return texture2DCompare( shadowMap, cubeToUV( bd3D, texelSize.y ), dp );
		#endif
	}
#endif`,x0=`#if NUM_SPOT_LIGHT_COORDS > 0
	uniform mat4 spotLightMatrix[ NUM_SPOT_LIGHT_COORDS ];
	varying vec4 vSpotLightCoord[ NUM_SPOT_LIGHT_COORDS ];
#endif
#ifdef USE_SHADOWMAP
	#if NUM_DIR_LIGHT_SHADOWS > 0
		uniform mat4 directionalShadowMatrix[ NUM_DIR_LIGHT_SHADOWS ];
		varying vec4 vDirectionalShadowCoord[ NUM_DIR_LIGHT_SHADOWS ];
		struct DirectionalLightShadow {
			float shadowBias;
			float shadowNormalBias;
			float shadowRadius;
			vec2 shadowMapSize;
		};
		uniform DirectionalLightShadow directionalLightShadows[ NUM_DIR_LIGHT_SHADOWS ];
	#endif
	#if NUM_SPOT_LIGHT_SHADOWS > 0
		struct SpotLightShadow {
			float shadowBias;
			float shadowNormalBias;
			float shadowRadius;
			vec2 shadowMapSize;
		};
		uniform SpotLightShadow spotLightShadows[ NUM_SPOT_LIGHT_SHADOWS ];
	#endif
	#if NUM_POINT_LIGHT_SHADOWS > 0
		uniform mat4 pointShadowMatrix[ NUM_POINT_LIGHT_SHADOWS ];
		varying vec4 vPointShadowCoord[ NUM_POINT_LIGHT_SHADOWS ];
		struct PointLightShadow {
			float shadowBias;
			float shadowNormalBias;
			float shadowRadius;
			vec2 shadowMapSize;
			float shadowCameraNear;
			float shadowCameraFar;
		};
		uniform PointLightShadow pointLightShadows[ NUM_POINT_LIGHT_SHADOWS ];
	#endif
#endif`,S0=`#if ( defined( USE_SHADOWMAP ) && ( NUM_DIR_LIGHT_SHADOWS > 0 || NUM_POINT_LIGHT_SHADOWS > 0 ) ) || ( NUM_SPOT_LIGHT_COORDS > 0 )
	vec3 shadowWorldNormal = inverseTransformDirection( transformedNormal, viewMatrix );
	vec4 shadowWorldPosition;
#endif
#if defined( USE_SHADOWMAP )
	#if NUM_DIR_LIGHT_SHADOWS > 0
		#pragma unroll_loop_start
		for ( int i = 0; i < NUM_DIR_LIGHT_SHADOWS; i ++ ) {
			shadowWorldPosition = worldPosition + vec4( shadowWorldNormal * directionalLightShadows[ i ].shadowNormalBias, 0 );
			vDirectionalShadowCoord[ i ] = directionalShadowMatrix[ i ] * shadowWorldPosition;
		}
		#pragma unroll_loop_end
	#endif
	#if NUM_POINT_LIGHT_SHADOWS > 0
		#pragma unroll_loop_start
		for ( int i = 0; i < NUM_POINT_LIGHT_SHADOWS; i ++ ) {
			shadowWorldPosition = worldPosition + vec4( shadowWorldNormal * pointLightShadows[ i ].shadowNormalBias, 0 );
			vPointShadowCoord[ i ] = pointShadowMatrix[ i ] * shadowWorldPosition;
		}
		#pragma unroll_loop_end
	#endif
#endif
#if NUM_SPOT_LIGHT_COORDS > 0
	#pragma unroll_loop_start
	for ( int i = 0; i < NUM_SPOT_LIGHT_COORDS; i ++ ) {
		shadowWorldPosition = worldPosition;
		#if ( defined( USE_SHADOWMAP ) && UNROLLED_LOOP_INDEX < NUM_SPOT_LIGHT_SHADOWS )
			shadowWorldPosition.xyz += shadowWorldNormal * spotLightShadows[ i ].shadowNormalBias;
		#endif
		vSpotLightCoord[ i ] = spotLightMatrix[ i ] * shadowWorldPosition;
	}
	#pragma unroll_loop_end
#endif`,C0=`float getShadowMask() {
	float shadow = 1.0;
	#ifdef USE_SHADOWMAP
	#if NUM_DIR_LIGHT_SHADOWS > 0
	DirectionalLightShadow directionalLight;
	#pragma unroll_loop_start
	for ( int i = 0; i < NUM_DIR_LIGHT_SHADOWS; i ++ ) {
		directionalLight = directionalLightShadows[ i ];
		shadow *= receiveShadow ? getShadow( directionalShadowMap[ i ], directionalLight.shadowMapSize, directionalLight.shadowBias, directionalLight.shadowRadius, vDirectionalShadowCoord[ i ] ) : 1.0;
	}
	#pragma unroll_loop_end
	#endif
	#if NUM_SPOT_LIGHT_SHADOWS > 0
	SpotLightShadow spotLight;
	#pragma unroll_loop_start
	for ( int i = 0; i < NUM_SPOT_LIGHT_SHADOWS; i ++ ) {
		spotLight = spotLightShadows[ i ];
		shadow *= receiveShadow ? getShadow( spotShadowMap[ i ], spotLight.shadowMapSize, spotLight.shadowBias, spotLight.shadowRadius, vSpotLightCoord[ i ] ) : 1.0;
	}
	#pragma unroll_loop_end
	#endif
	#if NUM_POINT_LIGHT_SHADOWS > 0
	PointLightShadow pointLight;
	#pragma unroll_loop_start
	for ( int i = 0; i < NUM_POINT_LIGHT_SHADOWS; i ++ ) {
		pointLight = pointLightShadows[ i ];
		shadow *= receiveShadow ? getPointShadow( pointShadowMap[ i ], pointLight.shadowMapSize, pointLight.shadowBias, pointLight.shadowRadius, vPointShadowCoord[ i ], pointLight.shadowCameraNear, pointLight.shadowCameraFar ) : 1.0;
	}
	#pragma unroll_loop_end
	#endif
	#endif
	return shadow;
}`,T0=`#ifdef USE_SKINNING
	mat4 boneMatX = getBoneMatrix( skinIndex.x );
	mat4 boneMatY = getBoneMatrix( skinIndex.y );
	mat4 boneMatZ = getBoneMatrix( skinIndex.z );
	mat4 boneMatW = getBoneMatrix( skinIndex.w );
#endif`,E0=`#ifdef USE_SKINNING
	uniform mat4 bindMatrix;
	uniform mat4 bindMatrixInverse;
	uniform highp sampler2D boneTexture;
	uniform int boneTextureSize;
	mat4 getBoneMatrix( const in float i ) {
		float j = i * 4.0;
		float x = mod( j, float( boneTextureSize ) );
		float y = floor( j / float( boneTextureSize ) );
		float dx = 1.0 / float( boneTextureSize );
		float dy = 1.0 / float( boneTextureSize );
		y = dy * ( y + 0.5 );
		vec4 v1 = texture2D( boneTexture, vec2( dx * ( x + 0.5 ), y ) );
		vec4 v2 = texture2D( boneTexture, vec2( dx * ( x + 1.5 ), y ) );
		vec4 v3 = texture2D( boneTexture, vec2( dx * ( x + 2.5 ), y ) );
		vec4 v4 = texture2D( boneTexture, vec2( dx * ( x + 3.5 ), y ) );
		mat4 bone = mat4( v1, v2, v3, v4 );
		return bone;
	}
#endif`,L0=`#ifdef USE_SKINNING
	vec4 skinVertex = bindMatrix * vec4( transformed, 1.0 );
	vec4 skinned = vec4( 0.0 );
	skinned += boneMatX * skinVertex * skinWeight.x;
	skinned += boneMatY * skinVertex * skinWeight.y;
	skinned += boneMatZ * skinVertex * skinWeight.z;
	skinned += boneMatW * skinVertex * skinWeight.w;
	transformed = ( bindMatrixInverse * skinned ).xyz;
#endif`,P0=`#ifdef USE_SKINNING
	mat4 skinMatrix = mat4( 0.0 );
	skinMatrix += skinWeight.x * boneMatX;
	skinMatrix += skinWeight.y * boneMatY;
	skinMatrix += skinWeight.z * boneMatZ;
	skinMatrix += skinWeight.w * boneMatW;
	skinMatrix = bindMatrixInverse * skinMatrix * bindMatrix;
	objectNormal = vec4( skinMatrix * vec4( objectNormal, 0.0 ) ).xyz;
	#ifdef USE_TANGENT
		objectTangent = vec4( skinMatrix * vec4( objectTangent, 0.0 ) ).xyz;
	#endif
#endif`,A0=`float specularStrength;
#ifdef USE_SPECULARMAP
	vec4 texelSpecular = texture2D( specularMap, vUv );
	specularStrength = texelSpecular.r;
#else
	specularStrength = 1.0;
#endif`,D0=`#ifdef USE_SPECULARMAP
	uniform sampler2D specularMap;
#endif`,R0=`#if defined( TONE_MAPPING )
	gl_FragColor.rgb = toneMapping( gl_FragColor.rgb );
#endif`,k0=`#ifndef saturate
#define saturate( a ) clamp( a, 0.0, 1.0 )
#endif
uniform float toneMappingExposure;
vec3 LinearToneMapping( vec3 color ) {
	return toneMappingExposure * color;
}
vec3 ReinhardToneMapping( vec3 color ) {
	color *= toneMappingExposure;
	return saturate( color / ( vec3( 1.0 ) + color ) );
}
vec3 OptimizedCineonToneMapping( vec3 color ) {
	color *= toneMappingExposure;
	color = max( vec3( 0.0 ), color - 0.004 );
	return pow( ( color * ( 6.2 * color + 0.5 ) ) / ( color * ( 6.2 * color + 1.7 ) + 0.06 ), vec3( 2.2 ) );
}
vec3 RRTAndODTFit( vec3 v ) {
	vec3 a = v * ( v + 0.0245786 ) - 0.000090537;
	vec3 b = v * ( 0.983729 * v + 0.4329510 ) + 0.238081;
	return a / b;
}
vec3 ACESFilmicToneMapping( vec3 color ) {
	const mat3 ACESInputMat = mat3(
		vec3( 0.59719, 0.07600, 0.02840 ),		vec3( 0.35458, 0.90834, 0.13383 ),
		vec3( 0.04823, 0.01566, 0.83777 )
	);
	const mat3 ACESOutputMat = mat3(
		vec3(  1.60475, -0.10208, -0.00327 ),		vec3( -0.53108,  1.10813, -0.07276 ),
		vec3( -0.07367, -0.00605,  1.07602 )
	);
	color *= toneMappingExposure / 0.6;
	color = ACESInputMat * color;
	color = RRTAndODTFit( color );
	color = ACESOutputMat * color;
	return saturate( color );
}
vec3 CustomToneMapping( vec3 color ) { return color; }`,I0=`#ifdef USE_TRANSMISSION
	material.transmission = transmission;
	material.transmissionAlpha = 1.0;
	material.thickness = thickness;
	material.attenuationDistance = attenuationDistance;
	material.attenuationColor = attenuationColor;
	#ifdef USE_TRANSMISSIONMAP
		material.transmission *= texture2D( transmissionMap, vUv ).r;
	#endif
	#ifdef USE_THICKNESSMAP
		material.thickness *= texture2D( thicknessMap, vUv ).g;
	#endif
	vec3 pos = vWorldPosition;
	vec3 v = normalize( cameraPosition - pos );
	vec3 n = inverseTransformDirection( normal, viewMatrix );
	vec4 transmission = getIBLVolumeRefraction(
		n, v, material.roughness, material.diffuseColor, material.specularColor, material.specularF90,
		pos, modelMatrix, viewMatrix, projectionMatrix, material.ior, material.thickness,
		material.attenuationColor, material.attenuationDistance );
	material.transmissionAlpha = mix( material.transmissionAlpha, transmission.a, material.transmission );
	totalDiffuse = mix( totalDiffuse, transmission.rgb, material.transmission );
#endif`,N0=`#ifdef USE_TRANSMISSION
	uniform float transmission;
	uniform float thickness;
	uniform float attenuationDistance;
	uniform vec3 attenuationColor;
	#ifdef USE_TRANSMISSIONMAP
		uniform sampler2D transmissionMap;
	#endif
	#ifdef USE_THICKNESSMAP
		uniform sampler2D thicknessMap;
	#endif
	uniform vec2 transmissionSamplerSize;
	uniform sampler2D transmissionSamplerMap;
	uniform mat4 modelMatrix;
	uniform mat4 projectionMatrix;
	varying vec3 vWorldPosition;
	float w0( float a ) {
		return ( 1.0 / 6.0 ) * ( a * ( a * ( - a + 3.0 ) - 3.0 ) + 1.0 );
	}
	float w1( float a ) {
		return ( 1.0 / 6.0 ) * ( a *  a * ( 3.0 * a - 6.0 ) + 4.0 );
	}
	float w2( float a ){
		return ( 1.0 / 6.0 ) * ( a * ( a * ( - 3.0 * a + 3.0 ) + 3.0 ) + 1.0 );
	}
	float w3( float a ) {
		return ( 1.0 / 6.0 ) * ( a * a * a );
	}
	float g0( float a ) {
		return w0( a ) + w1( a );
	}
	float g1( float a ) {
		return w2( a ) + w3( a );
	}
	float h0( float a ) {
		return - 1.0 + w1( a ) / ( w0( a ) + w1( a ) );
	}
	float h1( float a ) {
		return 1.0 + w3( a ) / ( w2( a ) + w3( a ) );
	}
	vec4 bicubic( sampler2D tex, vec2 uv, vec4 texelSize, vec2 fullSize, float lod ) {
		uv = uv * texelSize.zw + 0.5;
		vec2 iuv = floor( uv );
		vec2 fuv = fract( uv );
		float g0x = g0( fuv.x );
		float g1x = g1( fuv.x );
		float h0x = h0( fuv.x );
		float h1x = h1( fuv.x );
		float h0y = h0( fuv.y );
		float h1y = h1( fuv.y );
		vec2 p0 = ( vec2( iuv.x + h0x, iuv.y + h0y ) - 0.5 ) * texelSize.xy;
		vec2 p1 = ( vec2( iuv.x + h1x, iuv.y + h0y ) - 0.5 ) * texelSize.xy;
		vec2 p2 = ( vec2( iuv.x + h0x, iuv.y + h1y ) - 0.5 ) * texelSize.xy;
		vec2 p3 = ( vec2( iuv.x + h1x, iuv.y + h1y ) - 0.5 ) * texelSize.xy;
		
		vec2 lodFudge = pow( 1.95, lod ) / fullSize;
		return g0( fuv.y ) * ( g0x * textureLod( tex, p0, lod ) + g1x * textureLod( tex, p1, lod ) ) +
			g1( fuv.y ) * ( g0x * textureLod( tex, p2, lod ) + g1x * textureLod( tex, p3, lod ) );
	}
	vec4 textureBicubic( sampler2D sampler, vec2 uv, float lod ) {
		vec2 fLodSize = vec2( textureSize( sampler, int( lod ) ) );
		vec2 cLodSize = vec2( textureSize( sampler, int( lod + 1.0 ) ) );
		vec2 fLodSizeInv = 1.0 / fLodSize;
		vec2 cLodSizeInv = 1.0 / cLodSize;
		vec2 fullSize = vec2( textureSize( sampler, 0 ) );
		vec4 fSample = bicubic( sampler, uv, vec4( fLodSizeInv, fLodSize ), fullSize, floor( lod ) );
		vec4 cSample = bicubic( sampler, uv, vec4( cLodSizeInv, cLodSize ), fullSize, ceil( lod ) );
		return mix( fSample, cSample, fract( lod ) );
	}
	vec3 getVolumeTransmissionRay( const in vec3 n, const in vec3 v, const in float thickness, const in float ior, const in mat4 modelMatrix ) {
		vec3 refractionVector = refract( - v, normalize( n ), 1.0 / ior );
		vec3 modelScale;
		modelScale.x = length( vec3( modelMatrix[ 0 ].xyz ) );
		modelScale.y = length( vec3( modelMatrix[ 1 ].xyz ) );
		modelScale.z = length( vec3( modelMatrix[ 2 ].xyz ) );
		return normalize( refractionVector ) * thickness * modelScale;
	}
	float applyIorToRoughness( const in float roughness, const in float ior ) {
		return roughness * clamp( ior * 2.0 - 2.0, 0.0, 1.0 );
	}
	vec4 getTransmissionSample( const in vec2 fragCoord, const in float roughness, const in float ior ) {
		float lod = log2( transmissionSamplerSize.x ) * applyIorToRoughness( roughness, ior );
		return textureBicubic( transmissionSamplerMap, fragCoord.xy, lod );
	}
	vec3 applyVolumeAttenuation( const in vec3 radiance, const in float transmissionDistance, const in vec3 attenuationColor, const in float attenuationDistance ) {
		if ( isinf( attenuationDistance ) ) {
			return radiance;
		} else {
			vec3 attenuationCoefficient = -log( attenuationColor ) / attenuationDistance;
			vec3 transmittance = exp( - attenuationCoefficient * transmissionDistance );			return transmittance * radiance;
		}
	}
	vec4 getIBLVolumeRefraction( const in vec3 n, const in vec3 v, const in float roughness, const in vec3 diffuseColor,
		const in vec3 specularColor, const in float specularF90, const in vec3 position, const in mat4 modelMatrix,
		const in mat4 viewMatrix, const in mat4 projMatrix, const in float ior, const in float thickness,
		const in vec3 attenuationColor, const in float attenuationDistance ) {
		vec3 transmissionRay = getVolumeTransmissionRay( n, v, thickness, ior, modelMatrix );
		vec3 refractedRayExit = position + transmissionRay;
		vec4 ndcPos = projMatrix * viewMatrix * vec4( refractedRayExit, 1.0 );
		vec2 refractionCoords = ndcPos.xy / ndcPos.w;
		refractionCoords += 1.0;
		refractionCoords /= 2.0;
		vec4 transmittedLight = getTransmissionSample( refractionCoords, roughness, ior );
		vec3 attenuatedColor = applyVolumeAttenuation( transmittedLight.rgb, length( transmissionRay ), attenuationColor, attenuationDistance );
		vec3 F = EnvironmentBRDF( n, v, specularColor, specularF90, roughness );
		return vec4( ( 1.0 - F ) * attenuatedColor * diffuseColor, transmittedLight.a );
	}
#endif`,z0=`#if ( defined( USE_UV ) && ! defined( UVS_VERTEX_ONLY ) )
	varying vec2 vUv;
#endif`,F0=`#ifdef USE_UV
	#ifdef UVS_VERTEX_ONLY
		vec2 vUv;
	#else
		varying vec2 vUv;
	#endif
	uniform mat3 uvTransform;
#endif`,O0=`#ifdef USE_UV
	vUv = ( uvTransform * vec3( uv, 1 ) ).xy;
#endif`,U0=`#if defined( USE_LIGHTMAP ) || defined( USE_AOMAP )
	varying vec2 vUv2;
#endif`,B0=`#if defined( USE_LIGHTMAP ) || defined( USE_AOMAP )
	attribute vec2 uv2;
	varying vec2 vUv2;
	uniform mat3 uv2Transform;
#endif`,V0=`#if defined( USE_LIGHTMAP ) || defined( USE_AOMAP )
	vUv2 = ( uv2Transform * vec3( uv2, 1 ) ).xy;
#endif`,G0=`#if defined( USE_ENVMAP ) || defined( DISTANCE ) || defined ( USE_SHADOWMAP ) || defined ( USE_TRANSMISSION ) || NUM_SPOT_LIGHT_COORDS > 0
	vec4 worldPosition = vec4( transformed, 1.0 );
	#ifdef USE_INSTANCING
		worldPosition = instanceMatrix * worldPosition;
	#endif
	worldPosition = modelMatrix * worldPosition;
#endif`;const H0=`varying vec2 vUv;
uniform mat3 uvTransform;
void main() {
	vUv = ( uvTransform * vec3( uv, 1 ) ).xy;
	gl_Position = vec4( position.xy, 1.0, 1.0 );
}`,W0=`uniform sampler2D t2D;
uniform float backgroundIntensity;
varying vec2 vUv;
void main() {
	vec4 texColor = texture2D( t2D, vUv );
	#ifdef DECODE_VIDEO_TEXTURE
		texColor = vec4( mix( pow( texColor.rgb * 0.9478672986 + vec3( 0.0521327014 ), vec3( 2.4 ) ), texColor.rgb * 0.0773993808, vec3( lessThanEqual( texColor.rgb, vec3( 0.04045 ) ) ) ), texColor.w );
	#endif
	texColor.rgb *= backgroundIntensity;
	gl_FragColor = texColor;
	#include <tonemapping_fragment>
	#include <encodings_fragment>
}`,X0=`varying vec3 vWorldDirection;
#include <common>
void main() {
	vWorldDirection = transformDirection( position, modelMatrix );
	#include <begin_vertex>
	#include <project_vertex>
	gl_Position.z = gl_Position.w;
}`,j0=`#ifdef ENVMAP_TYPE_CUBE
	uniform samplerCube envMap;
#elif defined( ENVMAP_TYPE_CUBE_UV )
	uniform sampler2D envMap;
#endif
uniform float flipEnvMap;
uniform float backgroundBlurriness;
uniform float backgroundIntensity;
varying vec3 vWorldDirection;
#include <cube_uv_reflection_fragment>
void main() {
	#ifdef ENVMAP_TYPE_CUBE
		vec4 texColor = textureCube( envMap, vec3( flipEnvMap * vWorldDirection.x, vWorldDirection.yz ) );
	#elif defined( ENVMAP_TYPE_CUBE_UV )
		vec4 texColor = textureCubeUV( envMap, vWorldDirection, backgroundBlurriness );
	#else
		vec4 texColor = vec4( 0.0, 0.0, 0.0, 1.0 );
	#endif
	texColor.rgb *= backgroundIntensity;
	gl_FragColor = texColor;
	#include <tonemapping_fragment>
	#include <encodings_fragment>
}`,q0=`varying vec3 vWorldDirection;
#include <common>
void main() {
	vWorldDirection = transformDirection( position, modelMatrix );
	#include <begin_vertex>
	#include <project_vertex>
	gl_Position.z = gl_Position.w;
}`,Y0=`uniform samplerCube tCube;
uniform float tFlip;
uniform float opacity;
varying vec3 vWorldDirection;
void main() {
	vec4 texColor = textureCube( tCube, vec3( tFlip * vWorldDirection.x, vWorldDirection.yz ) );
	gl_FragColor = texColor;
	gl_FragColor.a *= opacity;
	#include <tonemapping_fragment>
	#include <encodings_fragment>
}`,Z0=`#include <common>
#include <uv_pars_vertex>
#include <displacementmap_pars_vertex>
#include <morphtarget_pars_vertex>
#include <skinning_pars_vertex>
#include <logdepthbuf_pars_vertex>
#include <clipping_planes_pars_vertex>
varying vec2 vHighPrecisionZW;
void main() {
	#include <uv_vertex>
	#include <skinbase_vertex>
	#ifdef USE_DISPLACEMENTMAP
		#include <beginnormal_vertex>
		#include <morphnormal_vertex>
		#include <skinnormal_vertex>
	#endif
	#include <begin_vertex>
	#include <morphtarget_vertex>
	#include <skinning_vertex>
	#include <displacementmap_vertex>
	#include <project_vertex>
	#include <logdepthbuf_vertex>
	#include <clipping_planes_vertex>
	vHighPrecisionZW = gl_Position.zw;
}`,K0=`#if DEPTH_PACKING == 3200
	uniform float opacity;
#endif
#include <common>
#include <packing>
#include <uv_pars_fragment>
#include <map_pars_fragment>
#include <alphamap_pars_fragment>
#include <alphatest_pars_fragment>
#include <logdepthbuf_pars_fragment>
#include <clipping_planes_pars_fragment>
varying vec2 vHighPrecisionZW;
void main() {
	#include <clipping_planes_fragment>
	vec4 diffuseColor = vec4( 1.0 );
	#if DEPTH_PACKING == 3200
		diffuseColor.a = opacity;
	#endif
	#include <map_fragment>
	#include <alphamap_fragment>
	#include <alphatest_fragment>
	#include <logdepthbuf_fragment>
	float fragCoordZ = 0.5 * vHighPrecisionZW[0] / vHighPrecisionZW[1] + 0.5;
	#if DEPTH_PACKING == 3200
		gl_FragColor = vec4( vec3( 1.0 - fragCoordZ ), opacity );
	#elif DEPTH_PACKING == 3201
		gl_FragColor = packDepthToRGBA( fragCoordZ );
	#endif
}`,J0=`#define DISTANCE
varying vec3 vWorldPosition;
#include <common>
#include <uv_pars_vertex>
#include <displacementmap_pars_vertex>
#include <morphtarget_pars_vertex>
#include <skinning_pars_vertex>
#include <clipping_planes_pars_vertex>
void main() {
	#include <uv_vertex>
	#include <skinbase_vertex>
	#ifdef USE_DISPLACEMENTMAP
		#include <beginnormal_vertex>
		#include <morphnormal_vertex>
		#include <skinnormal_vertex>
	#endif
	#include <begin_vertex>
	#include <morphtarget_vertex>
	#include <skinning_vertex>
	#include <displacementmap_vertex>
	#include <project_vertex>
	#include <worldpos_vertex>
	#include <clipping_planes_vertex>
	vWorldPosition = worldPosition.xyz;
}`,Q0=`#define DISTANCE
uniform vec3 referencePosition;
uniform float nearDistance;
uniform float farDistance;
varying vec3 vWorldPosition;
#include <common>
#include <packing>
#include <uv_pars_fragment>
#include <map_pars_fragment>
#include <alphamap_pars_fragment>
#include <alphatest_pars_fragment>
#include <clipping_planes_pars_fragment>
void main () {
	#include <clipping_planes_fragment>
	vec4 diffuseColor = vec4( 1.0 );
	#include <map_fragment>
	#include <alphamap_fragment>
	#include <alphatest_fragment>
	float dist = length( vWorldPosition - referencePosition );
	dist = ( dist - nearDistance ) / ( farDistance - nearDistance );
	dist = saturate( dist );
	gl_FragColor = packDepthToRGBA( dist );
}`,$0=`varying vec3 vWorldDirection;
#include <common>
void main() {
	vWorldDirection = transformDirection( position, modelMatrix );
	#include <begin_vertex>
	#include <project_vertex>
}`,e1=`uniform sampler2D tEquirect;
varying vec3 vWorldDirection;
#include <common>
void main() {
	vec3 direction = normalize( vWorldDirection );
	vec2 sampleUV = equirectUv( direction );
	gl_FragColor = texture2D( tEquirect, sampleUV );
	#include <tonemapping_fragment>
	#include <encodings_fragment>
}`,t1=`uniform float scale;
attribute float lineDistance;
varying float vLineDistance;
#include <common>
#include <color_pars_vertex>
#include <fog_pars_vertex>
#include <morphtarget_pars_vertex>
#include <logdepthbuf_pars_vertex>
#include <clipping_planes_pars_vertex>
void main() {
	vLineDistance = scale * lineDistance;
	#include <color_vertex>
	#include <morphcolor_vertex>
	#include <begin_vertex>
	#include <morphtarget_vertex>
	#include <project_vertex>
	#include <logdepthbuf_vertex>
	#include <clipping_planes_vertex>
	#include <fog_vertex>
}`,n1=`uniform vec3 diffuse;
uniform float opacity;
uniform float dashSize;
uniform float totalSize;
varying float vLineDistance;
#include <common>
#include <color_pars_fragment>
#include <fog_pars_fragment>
#include <logdepthbuf_pars_fragment>
#include <clipping_planes_pars_fragment>
void main() {
	#include <clipping_planes_fragment>
	if ( mod( vLineDistance, totalSize ) > dashSize ) {
		discard;
	}
	vec3 outgoingLight = vec3( 0.0 );
	vec4 diffuseColor = vec4( diffuse, opacity );
	#include <logdepthbuf_fragment>
	#include <color_fragment>
	outgoingLight = diffuseColor.rgb;
	#include <output_fragment>
	#include <tonemapping_fragment>
	#include <encodings_fragment>
	#include <fog_fragment>
	#include <premultiplied_alpha_fragment>
}`,i1=`#include <common>
#include <uv_pars_vertex>
#include <uv2_pars_vertex>
#include <envmap_pars_vertex>
#include <color_pars_vertex>
#include <fog_pars_vertex>
#include <morphtarget_pars_vertex>
#include <skinning_pars_vertex>
#include <logdepthbuf_pars_vertex>
#include <clipping_planes_pars_vertex>
void main() {
	#include <uv_vertex>
	#include <uv2_vertex>
	#include <color_vertex>
	#include <morphcolor_vertex>
	#if defined ( USE_ENVMAP ) || defined ( USE_SKINNING )
		#include <beginnormal_vertex>
		#include <morphnormal_vertex>
		#include <skinbase_vertex>
		#include <skinnormal_vertex>
		#include <defaultnormal_vertex>
	#endif
	#include <begin_vertex>
	#include <morphtarget_vertex>
	#include <skinning_vertex>
	#include <project_vertex>
	#include <logdepthbuf_vertex>
	#include <clipping_planes_vertex>
	#include <worldpos_vertex>
	#include <envmap_vertex>
	#include <fog_vertex>
}`,r1=`uniform vec3 diffuse;
uniform float opacity;
#ifndef FLAT_SHADED
	varying vec3 vNormal;
#endif
#include <common>
#include <dithering_pars_fragment>
#include <color_pars_fragment>
#include <uv_pars_fragment>
#include <uv2_pars_fragment>
#include <map_pars_fragment>
#include <alphamap_pars_fragment>
#include <alphatest_pars_fragment>
#include <aomap_pars_fragment>
#include <lightmap_pars_fragment>
#include <envmap_common_pars_fragment>
#include <envmap_pars_fragment>
#include <fog_pars_fragment>
#include <specularmap_pars_fragment>
#include <logdepthbuf_pars_fragment>
#include <clipping_planes_pars_fragment>
void main() {
	#include <clipping_planes_fragment>
	vec4 diffuseColor = vec4( diffuse, opacity );
	#include <logdepthbuf_fragment>
	#include <map_fragment>
	#include <color_fragment>
	#include <alphamap_fragment>
	#include <alphatest_fragment>
	#include <specularmap_fragment>
	ReflectedLight reflectedLight = ReflectedLight( vec3( 0.0 ), vec3( 0.0 ), vec3( 0.0 ), vec3( 0.0 ) );
	#ifdef USE_LIGHTMAP
		vec4 lightMapTexel = texture2D( lightMap, vUv2 );
		reflectedLight.indirectDiffuse += lightMapTexel.rgb * lightMapIntensity * RECIPROCAL_PI;
	#else
		reflectedLight.indirectDiffuse += vec3( 1.0 );
	#endif
	#include <aomap_fragment>
	reflectedLight.indirectDiffuse *= diffuseColor.rgb;
	vec3 outgoingLight = reflectedLight.indirectDiffuse;
	#include <envmap_fragment>
	#include <output_fragment>
	#include <tonemapping_fragment>
	#include <encodings_fragment>
	#include <fog_fragment>
	#include <premultiplied_alpha_fragment>
	#include <dithering_fragment>
}`,s1=`#define LAMBERT
varying vec3 vViewPosition;
#include <common>
#include <uv_pars_vertex>
#include <uv2_pars_vertex>
#include <displacementmap_pars_vertex>
#include <envmap_pars_vertex>
#include <color_pars_vertex>
#include <fog_pars_vertex>
#include <normal_pars_vertex>
#include <morphtarget_pars_vertex>
#include <skinning_pars_vertex>
#include <shadowmap_pars_vertex>
#include <logdepthbuf_pars_vertex>
#include <clipping_planes_pars_vertex>
void main() {
	#include <uv_vertex>
	#include <uv2_vertex>
	#include <color_vertex>
	#include <morphcolor_vertex>
	#include <beginnormal_vertex>
	#include <morphnormal_vertex>
	#include <skinbase_vertex>
	#include <skinnormal_vertex>
	#include <defaultnormal_vertex>
	#include <normal_vertex>
	#include <begin_vertex>
	#include <morphtarget_vertex>
	#include <skinning_vertex>
	#include <displacementmap_vertex>
	#include <project_vertex>
	#include <logdepthbuf_vertex>
	#include <clipping_planes_vertex>
	vViewPosition = - mvPosition.xyz;
	#include <worldpos_vertex>
	#include <envmap_vertex>
	#include <shadowmap_vertex>
	#include <fog_vertex>
}`,a1=`#define LAMBERT
uniform vec3 diffuse;
uniform vec3 emissive;
uniform float opacity;
#include <common>
#include <packing>
#include <dithering_pars_fragment>
#include <color_pars_fragment>
#include <uv_pars_fragment>
#include <uv2_pars_fragment>
#include <map_pars_fragment>
#include <alphamap_pars_fragment>
#include <alphatest_pars_fragment>
#include <aomap_pars_fragment>
#include <lightmap_pars_fragment>
#include <emissivemap_pars_fragment>
#include <envmap_common_pars_fragment>
#include <envmap_pars_fragment>
#include <fog_pars_fragment>
#include <bsdfs>
#include <lights_pars_begin>
#include <normal_pars_fragment>
#include <lights_lambert_pars_fragment>
#include <shadowmap_pars_fragment>
#include <bumpmap_pars_fragment>
#include <normalmap_pars_fragment>
#include <specularmap_pars_fragment>
#include <logdepthbuf_pars_fragment>
#include <clipping_planes_pars_fragment>
void main() {
	#include <clipping_planes_fragment>
	vec4 diffuseColor = vec4( diffuse, opacity );
	ReflectedLight reflectedLight = ReflectedLight( vec3( 0.0 ), vec3( 0.0 ), vec3( 0.0 ), vec3( 0.0 ) );
	vec3 totalEmissiveRadiance = emissive;
	#include <logdepthbuf_fragment>
	#include <map_fragment>
	#include <color_fragment>
	#include <alphamap_fragment>
	#include <alphatest_fragment>
	#include <specularmap_fragment>
	#include <normal_fragment_begin>
	#include <normal_fragment_maps>
	#include <emissivemap_fragment>
	#include <lights_lambert_fragment>
	#include <lights_fragment_begin>
	#include <lights_fragment_maps>
	#include <lights_fragment_end>
	#include <aomap_fragment>
	vec3 outgoingLight = reflectedLight.directDiffuse + reflectedLight.indirectDiffuse + totalEmissiveRadiance;
	#include <envmap_fragment>
	#include <output_fragment>
	#include <tonemapping_fragment>
	#include <encodings_fragment>
	#include <fog_fragment>
	#include <premultiplied_alpha_fragment>
	#include <dithering_fragment>
}`,o1=`#define MATCAP
varying vec3 vViewPosition;
#include <common>
#include <uv_pars_vertex>
#include <color_pars_vertex>
#include <displacementmap_pars_vertex>
#include <fog_pars_vertex>
#include <normal_pars_vertex>
#include <morphtarget_pars_vertex>
#include <skinning_pars_vertex>
#include <logdepthbuf_pars_vertex>
#include <clipping_planes_pars_vertex>
void main() {
	#include <uv_vertex>
	#include <color_vertex>
	#include <morphcolor_vertex>
	#include <beginnormal_vertex>
	#include <morphnormal_vertex>
	#include <skinbase_vertex>
	#include <skinnormal_vertex>
	#include <defaultnormal_vertex>
	#include <normal_vertex>
	#include <begin_vertex>
	#include <morphtarget_vertex>
	#include <skinning_vertex>
	#include <displacementmap_vertex>
	#include <project_vertex>
	#include <logdepthbuf_vertex>
	#include <clipping_planes_vertex>
	#include <fog_vertex>
	vViewPosition = - mvPosition.xyz;
}`,l1=`#define MATCAP
uniform vec3 diffuse;
uniform float opacity;
uniform sampler2D matcap;
varying vec3 vViewPosition;
#include <common>
#include <dithering_pars_fragment>
#include <color_pars_fragment>
#include <uv_pars_fragment>
#include <map_pars_fragment>
#include <alphamap_pars_fragment>
#include <alphatest_pars_fragment>
#include <fog_pars_fragment>
#include <normal_pars_fragment>
#include <bumpmap_pars_fragment>
#include <normalmap_pars_fragment>
#include <logdepthbuf_pars_fragment>
#include <clipping_planes_pars_fragment>
void main() {
	#include <clipping_planes_fragment>
	vec4 diffuseColor = vec4( diffuse, opacity );
	#include <logdepthbuf_fragment>
	#include <map_fragment>
	#include <color_fragment>
	#include <alphamap_fragment>
	#include <alphatest_fragment>
	#include <normal_fragment_begin>
	#include <normal_fragment_maps>
	vec3 viewDir = normalize( vViewPosition );
	vec3 x = normalize( vec3( viewDir.z, 0.0, - viewDir.x ) );
	vec3 y = cross( viewDir, x );
	vec2 uv = vec2( dot( x, normal ), dot( y, normal ) ) * 0.495 + 0.5;
	#ifdef USE_MATCAP
		vec4 matcapColor = texture2D( matcap, uv );
	#else
		vec4 matcapColor = vec4( vec3( mix( 0.2, 0.8, uv.y ) ), 1.0 );
	#endif
	vec3 outgoingLight = diffuseColor.rgb * matcapColor.rgb;
	#include <output_fragment>
	#include <tonemapping_fragment>
	#include <encodings_fragment>
	#include <fog_fragment>
	#include <premultiplied_alpha_fragment>
	#include <dithering_fragment>
}`,c1=`#define NORMAL
#if defined( FLAT_SHADED ) || defined( USE_BUMPMAP ) || defined( TANGENTSPACE_NORMALMAP )
	varying vec3 vViewPosition;
#endif
#include <common>
#include <uv_pars_vertex>
#include <displacementmap_pars_vertex>
#include <normal_pars_vertex>
#include <morphtarget_pars_vertex>
#include <skinning_pars_vertex>
#include <logdepthbuf_pars_vertex>
#include <clipping_planes_pars_vertex>
void main() {
	#include <uv_vertex>
	#include <beginnormal_vertex>
	#include <morphnormal_vertex>
	#include <skinbase_vertex>
	#include <skinnormal_vertex>
	#include <defaultnormal_vertex>
	#include <normal_vertex>
	#include <begin_vertex>
	#include <morphtarget_vertex>
	#include <skinning_vertex>
	#include <displacementmap_vertex>
	#include <project_vertex>
	#include <logdepthbuf_vertex>
	#include <clipping_planes_vertex>
#if defined( FLAT_SHADED ) || defined( USE_BUMPMAP ) || defined( TANGENTSPACE_NORMALMAP )
	vViewPosition = - mvPosition.xyz;
#endif
}`,u1=`#define NORMAL
uniform float opacity;
#if defined( FLAT_SHADED ) || defined( USE_BUMPMAP ) || defined( TANGENTSPACE_NORMALMAP )
	varying vec3 vViewPosition;
#endif
#include <packing>
#include <uv_pars_fragment>
#include <normal_pars_fragment>
#include <bumpmap_pars_fragment>
#include <normalmap_pars_fragment>
#include <logdepthbuf_pars_fragment>
#include <clipping_planes_pars_fragment>
void main() {
	#include <clipping_planes_fragment>
	#include <logdepthbuf_fragment>
	#include <normal_fragment_begin>
	#include <normal_fragment_maps>
	gl_FragColor = vec4( packNormalToRGB( normal ), opacity );
	#ifdef OPAQUE
		gl_FragColor.a = 1.0;
	#endif
}`,f1=`#define PHONG
varying vec3 vViewPosition;
#include <common>
#include <uv_pars_vertex>
#include <uv2_pars_vertex>
#include <displacementmap_pars_vertex>
#include <envmap_pars_vertex>
#include <color_pars_vertex>
#include <fog_pars_vertex>
#include <normal_pars_vertex>
#include <morphtarget_pars_vertex>
#include <skinning_pars_vertex>
#include <shadowmap_pars_vertex>
#include <logdepthbuf_pars_vertex>
#include <clipping_planes_pars_vertex>
void main() {
	#include <uv_vertex>
	#include <uv2_vertex>
	#include <color_vertex>
	#include <morphcolor_vertex>
	#include <beginnormal_vertex>
	#include <morphnormal_vertex>
	#include <skinbase_vertex>
	#include <skinnormal_vertex>
	#include <defaultnormal_vertex>
	#include <normal_vertex>
	#include <begin_vertex>
	#include <morphtarget_vertex>
	#include <skinning_vertex>
	#include <displacementmap_vertex>
	#include <project_vertex>
	#include <logdepthbuf_vertex>
	#include <clipping_planes_vertex>
	vViewPosition = - mvPosition.xyz;
	#include <worldpos_vertex>
	#include <envmap_vertex>
	#include <shadowmap_vertex>
	#include <fog_vertex>
}`,d1=`#define PHONG
uniform vec3 diffuse;
uniform vec3 emissive;
uniform vec3 specular;
uniform float shininess;
uniform float opacity;
#include <common>
#include <packing>
#include <dithering_pars_fragment>
#include <color_pars_fragment>
#include <uv_pars_fragment>
#include <uv2_pars_fragment>
#include <map_pars_fragment>
#include <alphamap_pars_fragment>
#include <alphatest_pars_fragment>
#include <aomap_pars_fragment>
#include <lightmap_pars_fragment>
#include <emissivemap_pars_fragment>
#include <envmap_common_pars_fragment>
#include <envmap_pars_fragment>
#include <fog_pars_fragment>
#include <bsdfs>
#include <lights_pars_begin>
#include <normal_pars_fragment>
#include <lights_phong_pars_fragment>
#include <shadowmap_pars_fragment>
#include <bumpmap_pars_fragment>
#include <normalmap_pars_fragment>
#include <specularmap_pars_fragment>
#include <logdepthbuf_pars_fragment>
#include <clipping_planes_pars_fragment>
void main() {
	#include <clipping_planes_fragment>
	vec4 diffuseColor = vec4( diffuse, opacity );
	ReflectedLight reflectedLight = ReflectedLight( vec3( 0.0 ), vec3( 0.0 ), vec3( 0.0 ), vec3( 0.0 ) );
	vec3 totalEmissiveRadiance = emissive;
	#include <logdepthbuf_fragment>
	#include <map_fragment>
	#include <color_fragment>
	#include <alphamap_fragment>
	#include <alphatest_fragment>
	#include <specularmap_fragment>
	#include <normal_fragment_begin>
	#include <normal_fragment_maps>
	#include <emissivemap_fragment>
	#include <lights_phong_fragment>
	#include <lights_fragment_begin>
	#include <lights_fragment_maps>
	#include <lights_fragment_end>
	#include <aomap_fragment>
	vec3 outgoingLight = reflectedLight.directDiffuse + reflectedLight.indirectDiffuse + reflectedLight.directSpecular + reflectedLight.indirectSpecular + totalEmissiveRadiance;
	#include <envmap_fragment>
	#include <output_fragment>
	#include <tonemapping_fragment>
	#include <encodings_fragment>
	#include <fog_fragment>
	#include <premultiplied_alpha_fragment>
	#include <dithering_fragment>
}`,h1=`#define STANDARD
varying vec3 vViewPosition;
#ifdef USE_TRANSMISSION
	varying vec3 vWorldPosition;
#endif
#include <common>
#include <uv_pars_vertex>
#include <uv2_pars_vertex>
#include <displacementmap_pars_vertex>
#include <color_pars_vertex>
#include <fog_pars_vertex>
#include <normal_pars_vertex>
#include <morphtarget_pars_vertex>
#include <skinning_pars_vertex>
#include <shadowmap_pars_vertex>
#include <logdepthbuf_pars_vertex>
#include <clipping_planes_pars_vertex>
void main() {
	#include <uv_vertex>
	#include <uv2_vertex>
	#include <color_vertex>
	#include <morphcolor_vertex>
	#include <beginnormal_vertex>
	#include <morphnormal_vertex>
	#include <skinbase_vertex>
	#include <skinnormal_vertex>
	#include <defaultnormal_vertex>
	#include <normal_vertex>
	#include <begin_vertex>
	#include <morphtarget_vertex>
	#include <skinning_vertex>
	#include <displacementmap_vertex>
	#include <project_vertex>
	#include <logdepthbuf_vertex>
	#include <clipping_planes_vertex>
	vViewPosition = - mvPosition.xyz;
	#include <worldpos_vertex>
	#include <shadowmap_vertex>
	#include <fog_vertex>
#ifdef USE_TRANSMISSION
	vWorldPosition = worldPosition.xyz;
#endif
}`,p1=`#define STANDARD
#ifdef PHYSICAL
	#define IOR
	#define SPECULAR
#endif
uniform vec3 diffuse;
uniform vec3 emissive;
uniform float roughness;
uniform float metalness;
uniform float opacity;
#ifdef IOR
	uniform float ior;
#endif
#ifdef SPECULAR
	uniform float specularIntensity;
	uniform vec3 specularColor;
	#ifdef USE_SPECULARINTENSITYMAP
		uniform sampler2D specularIntensityMap;
	#endif
	#ifdef USE_SPECULARCOLORMAP
		uniform sampler2D specularColorMap;
	#endif
#endif
#ifdef USE_CLEARCOAT
	uniform float clearcoat;
	uniform float clearcoatRoughness;
#endif
#ifdef USE_IRIDESCENCE
	uniform float iridescence;
	uniform float iridescenceIOR;
	uniform float iridescenceThicknessMinimum;
	uniform float iridescenceThicknessMaximum;
#endif
#ifdef USE_SHEEN
	uniform vec3 sheenColor;
	uniform float sheenRoughness;
	#ifdef USE_SHEENCOLORMAP
		uniform sampler2D sheenColorMap;
	#endif
	#ifdef USE_SHEENROUGHNESSMAP
		uniform sampler2D sheenRoughnessMap;
	#endif
#endif
varying vec3 vViewPosition;
#include <common>
#include <packing>
#include <dithering_pars_fragment>
#include <color_pars_fragment>
#include <uv_pars_fragment>
#include <uv2_pars_fragment>
#include <map_pars_fragment>
#include <alphamap_pars_fragment>
#include <alphatest_pars_fragment>
#include <aomap_pars_fragment>
#include <lightmap_pars_fragment>
#include <emissivemap_pars_fragment>
#include <bsdfs>
#include <iridescence_fragment>
#include <cube_uv_reflection_fragment>
#include <envmap_common_pars_fragment>
#include <envmap_physical_pars_fragment>
#include <fog_pars_fragment>
#include <lights_pars_begin>
#include <normal_pars_fragment>
#include <lights_physical_pars_fragment>
#include <transmission_pars_fragment>
#include <shadowmap_pars_fragment>
#include <bumpmap_pars_fragment>
#include <normalmap_pars_fragment>
#include <clearcoat_pars_fragment>
#include <iridescence_pars_fragment>
#include <roughnessmap_pars_fragment>
#include <metalnessmap_pars_fragment>
#include <logdepthbuf_pars_fragment>
#include <clipping_planes_pars_fragment>
void main() {
	#include <clipping_planes_fragment>
	vec4 diffuseColor = vec4( diffuse, opacity );
	ReflectedLight reflectedLight = ReflectedLight( vec3( 0.0 ), vec3( 0.0 ), vec3( 0.0 ), vec3( 0.0 ) );
	vec3 totalEmissiveRadiance = emissive;
	#include <logdepthbuf_fragment>
	#include <map_fragment>
	#include <color_fragment>
	#include <alphamap_fragment>
	#include <alphatest_fragment>
	#include <roughnessmap_fragment>
	#include <metalnessmap_fragment>
	#include <normal_fragment_begin>
	#include <normal_fragment_maps>
	#include <clearcoat_normal_fragment_begin>
	#include <clearcoat_normal_fragment_maps>
	#include <emissivemap_fragment>
	#include <lights_physical_fragment>
	#include <lights_fragment_begin>
	#include <lights_fragment_maps>
	#include <lights_fragment_end>
	#include <aomap_fragment>
	vec3 totalDiffuse = reflectedLight.directDiffuse + reflectedLight.indirectDiffuse;
	vec3 totalSpecular = reflectedLight.directSpecular + reflectedLight.indirectSpecular;
	#include <transmission_fragment>
	vec3 outgoingLight = totalDiffuse + totalSpecular + totalEmissiveRadiance;
	#ifdef USE_SHEEN
		float sheenEnergyComp = 1.0 - 0.157 * max3( material.sheenColor );
		outgoingLight = outgoingLight * sheenEnergyComp + sheenSpecular;
	#endif
	#ifdef USE_CLEARCOAT
		float dotNVcc = saturate( dot( geometry.clearcoatNormal, geometry.viewDir ) );
		vec3 Fcc = F_Schlick( material.clearcoatF0, material.clearcoatF90, dotNVcc );
		outgoingLight = outgoingLight * ( 1.0 - material.clearcoat * Fcc ) + clearcoatSpecular * material.clearcoat;
	#endif
	#include <output_fragment>
	#include <tonemapping_fragment>
	#include <encodings_fragment>
	#include <fog_fragment>
	#include <premultiplied_alpha_fragment>
	#include <dithering_fragment>
}`,m1=`#define TOON
varying vec3 vViewPosition;
#include <common>
#include <uv_pars_vertex>
#include <uv2_pars_vertex>
#include <displacementmap_pars_vertex>
#include <color_pars_vertex>
#include <fog_pars_vertex>
#include <normal_pars_vertex>
#include <morphtarget_pars_vertex>
#include <skinning_pars_vertex>
#include <shadowmap_pars_vertex>
#include <logdepthbuf_pars_vertex>
#include <clipping_planes_pars_vertex>
void main() {
	#include <uv_vertex>
	#include <uv2_vertex>
	#include <color_vertex>
	#include <morphcolor_vertex>
	#include <beginnormal_vertex>
	#include <morphnormal_vertex>
	#include <skinbase_vertex>
	#include <skinnormal_vertex>
	#include <defaultnormal_vertex>
	#include <normal_vertex>
	#include <begin_vertex>
	#include <morphtarget_vertex>
	#include <skinning_vertex>
	#include <displacementmap_vertex>
	#include <project_vertex>
	#include <logdepthbuf_vertex>
	#include <clipping_planes_vertex>
	vViewPosition = - mvPosition.xyz;
	#include <worldpos_vertex>
	#include <shadowmap_vertex>
	#include <fog_vertex>
}`,_1=`#define TOON
uniform vec3 diffuse;
uniform vec3 emissive;
uniform float opacity;
#include <common>
#include <packing>
#include <dithering_pars_fragment>
#include <color_pars_fragment>
#include <uv_pars_fragment>
#include <uv2_pars_fragment>
#include <map_pars_fragment>
#include <alphamap_pars_fragment>
#include <alphatest_pars_fragment>
#include <aomap_pars_fragment>
#include <lightmap_pars_fragment>
#include <emissivemap_pars_fragment>
#include <gradientmap_pars_fragment>
#include <fog_pars_fragment>
#include <bsdfs>
#include <lights_pars_begin>
#include <normal_pars_fragment>
#include <lights_toon_pars_fragment>
#include <shadowmap_pars_fragment>
#include <bumpmap_pars_fragment>
#include <normalmap_pars_fragment>
#include <logdepthbuf_pars_fragment>
#include <clipping_planes_pars_fragment>
void main() {
	#include <clipping_planes_fragment>
	vec4 diffuseColor = vec4( diffuse, opacity );
	ReflectedLight reflectedLight = ReflectedLight( vec3( 0.0 ), vec3( 0.0 ), vec3( 0.0 ), vec3( 0.0 ) );
	vec3 totalEmissiveRadiance = emissive;
	#include <logdepthbuf_fragment>
	#include <map_fragment>
	#include <color_fragment>
	#include <alphamap_fragment>
	#include <alphatest_fragment>
	#include <normal_fragment_begin>
	#include <normal_fragment_maps>
	#include <emissivemap_fragment>
	#include <lights_toon_fragment>
	#include <lights_fragment_begin>
	#include <lights_fragment_maps>
	#include <lights_fragment_end>
	#include <aomap_fragment>
	vec3 outgoingLight = reflectedLight.directDiffuse + reflectedLight.indirectDiffuse + totalEmissiveRadiance;
	#include <output_fragment>
	#include <tonemapping_fragment>
	#include <encodings_fragment>
	#include <fog_fragment>
	#include <premultiplied_alpha_fragment>
	#include <dithering_fragment>
}`,g1=`uniform float size;
uniform float scale;
#include <common>
#include <color_pars_vertex>
#include <fog_pars_vertex>
#include <morphtarget_pars_vertex>
#include <logdepthbuf_pars_vertex>
#include <clipping_planes_pars_vertex>
void main() {
	#include <color_vertex>
	#include <morphcolor_vertex>
	#include <begin_vertex>
	#include <morphtarget_vertex>
	#include <project_vertex>
	gl_PointSize = size;
	#ifdef USE_SIZEATTENUATION
		bool isPerspective = isPerspectiveMatrix( projectionMatrix );
		if ( isPerspective ) gl_PointSize *= ( scale / - mvPosition.z );
	#endif
	#include <logdepthbuf_vertex>
	#include <clipping_planes_vertex>
	#include <worldpos_vertex>
	#include <fog_vertex>
}`,b1=`uniform vec3 diffuse;
uniform float opacity;
#include <common>
#include <color_pars_fragment>
#include <map_particle_pars_fragment>
#include <alphatest_pars_fragment>
#include <fog_pars_fragment>
#include <logdepthbuf_pars_fragment>
#include <clipping_planes_pars_fragment>
void main() {
	#include <clipping_planes_fragment>
	vec3 outgoingLight = vec3( 0.0 );
	vec4 diffuseColor = vec4( diffuse, opacity );
	#include <logdepthbuf_fragment>
	#include <map_particle_fragment>
	#include <color_fragment>
	#include <alphatest_fragment>
	outgoingLight = diffuseColor.rgb;
	#include <output_fragment>
	#include <tonemapping_fragment>
	#include <encodings_fragment>
	#include <fog_fragment>
	#include <premultiplied_alpha_fragment>
}`,v1=`#include <common>
#include <fog_pars_vertex>
#include <morphtarget_pars_vertex>
#include <skinning_pars_vertex>
#include <logdepthbuf_pars_vertex>
#include <shadowmap_pars_vertex>
void main() {
	#include <beginnormal_vertex>
	#include <morphnormal_vertex>
	#include <skinbase_vertex>
	#include <skinnormal_vertex>
	#include <defaultnormal_vertex>
	#include <begin_vertex>
	#include <morphtarget_vertex>
	#include <skinning_vertex>
	#include <project_vertex>
	#include <logdepthbuf_vertex>
	#include <worldpos_vertex>
	#include <shadowmap_vertex>
	#include <fog_vertex>
}`,y1=`uniform vec3 color;
uniform float opacity;
#include <common>
#include <packing>
#include <fog_pars_fragment>
#include <bsdfs>
#include <lights_pars_begin>
#include <logdepthbuf_pars_fragment>
#include <shadowmap_pars_fragment>
#include <shadowmask_pars_fragment>
void main() {
	#include <logdepthbuf_fragment>
	gl_FragColor = vec4( color, opacity * ( 1.0 - getShadowMask() ) );
	#include <tonemapping_fragment>
	#include <encodings_fragment>
	#include <fog_fragment>
}`,w1=`uniform float rotation;
uniform vec2 center;
#include <common>
#include <uv_pars_vertex>
#include <fog_pars_vertex>
#include <logdepthbuf_pars_vertex>
#include <clipping_planes_pars_vertex>
void main() {
	#include <uv_vertex>
	vec4 mvPosition = modelViewMatrix * vec4( 0.0, 0.0, 0.0, 1.0 );
	vec2 scale;
	scale.x = length( vec3( modelMatrix[ 0 ].x, modelMatrix[ 0 ].y, modelMatrix[ 0 ].z ) );
	scale.y = length( vec3( modelMatrix[ 1 ].x, modelMatrix[ 1 ].y, modelMatrix[ 1 ].z ) );
	#ifndef USE_SIZEATTENUATION
		bool isPerspective = isPerspectiveMatrix( projectionMatrix );
		if ( isPerspective ) scale *= - mvPosition.z;
	#endif
	vec2 alignedPosition = ( position.xy - ( center - vec2( 0.5 ) ) ) * scale;
	vec2 rotatedPosition;
	rotatedPosition.x = cos( rotation ) * alignedPosition.x - sin( rotation ) * alignedPosition.y;
	rotatedPosition.y = sin( rotation ) * alignedPosition.x + cos( rotation ) * alignedPosition.y;
	mvPosition.xy += rotatedPosition;
	gl_Position = projectionMatrix * mvPosition;
	#include <logdepthbuf_vertex>
	#include <clipping_planes_vertex>
	#include <fog_vertex>
}`,M1=`uniform vec3 diffuse;
uniform float opacity;
#include <common>
#include <uv_pars_fragment>
#include <map_pars_fragment>
#include <alphamap_pars_fragment>
#include <alphatest_pars_fragment>
#include <fog_pars_fragment>
#include <logdepthbuf_pars_fragment>
#include <clipping_planes_pars_fragment>
void main() {
	#include <clipping_planes_fragment>
	vec3 outgoingLight = vec3( 0.0 );
	vec4 diffuseColor = vec4( diffuse, opacity );
	#include <logdepthbuf_fragment>
	#include <map_fragment>
	#include <alphamap_fragment>
	#include <alphatest_fragment>
	outgoingLight = diffuseColor.rgb;
	#include <output_fragment>
	#include <tonemapping_fragment>
	#include <encodings_fragment>
	#include <fog_fragment>
}`,Ze={alphamap_fragment:X_,alphamap_pars_fragment:j_,alphatest_fragment:q_,alphatest_pars_fragment:Y_,aomap_fragment:Z_,aomap_pars_fragment:K_,begin_vertex:J_,beginnormal_vertex:Q_,bsdfs:$_,iridescence_fragment:eg,bumpmap_pars_fragment:tg,clipping_planes_fragment:ng,clipping_planes_pars_fragment:ig,clipping_planes_pars_vertex:rg,clipping_planes_vertex:sg,color_fragment:ag,color_pars_fragment:og,color_pars_vertex:lg,color_vertex:cg,common:ug,cube_uv_reflection_fragment:fg,defaultnormal_vertex:dg,displacementmap_pars_vertex:hg,displacementmap_vertex:pg,emissivemap_fragment:mg,emissivemap_pars_fragment:_g,encodings_fragment:gg,encodings_pars_fragment:bg,envmap_fragment:vg,envmap_common_pars_fragment:yg,envmap_pars_fragment:wg,envmap_pars_vertex:Mg,envmap_physical_pars_fragment:Ig,envmap_vertex:xg,fog_vertex:Sg,fog_pars_vertex:Cg,fog_fragment:Tg,fog_pars_fragment:Eg,gradientmap_pars_fragment:Lg,lightmap_fragment:Pg,lightmap_pars_fragment:Ag,lights_lambert_fragment:Dg,lights_lambert_pars_fragment:Rg,lights_pars_begin:kg,lights_toon_fragment:Ng,lights_toon_pars_fragment:zg,lights_phong_fragment:Fg,lights_phong_pars_fragment:Og,lights_physical_fragment:Ug,lights_physical_pars_fragment:Bg,lights_fragment_begin:Vg,lights_fragment_maps:Gg,lights_fragment_end:Hg,logdepthbuf_fragment:Wg,logdepthbuf_pars_fragment:Xg,logdepthbuf_pars_vertex:jg,logdepthbuf_vertex:qg,map_fragment:Yg,map_pars_fragment:Zg,map_particle_fragment:Kg,map_particle_pars_fragment:Jg,metalnessmap_fragment:Qg,metalnessmap_pars_fragment:$g,morphcolor_vertex:e0,morphnormal_vertex:t0,morphtarget_pars_vertex:n0,morphtarget_vertex:i0,normal_fragment_begin:r0,normal_fragment_maps:s0,normal_pars_fragment:a0,normal_pars_vertex:o0,normal_vertex:l0,normalmap_pars_fragment:c0,clearcoat_normal_fragment_begin:u0,clearcoat_normal_fragment_maps:f0,clearcoat_pars_fragment:d0,iridescence_pars_fragment:h0,output_fragment:p0,packing:m0,premultiplied_alpha_fragment:_0,project_vertex:g0,dithering_fragment:b0,dithering_pars_fragment:v0,roughnessmap_fragment:y0,roughnessmap_pars_fragment:w0,shadowmap_pars_fragment:M0,shadowmap_pars_vertex:x0,shadowmap_vertex:S0,shadowmask_pars_fragment:C0,skinbase_vertex:T0,skinning_pars_vertex:E0,skinning_vertex:L0,skinnormal_vertex:P0,specularmap_fragment:A0,specularmap_pars_fragment:D0,tonemapping_fragment:R0,tonemapping_pars_fragment:k0,transmission_fragment:I0,transmission_pars_fragment:N0,uv_pars_fragment:z0,uv_pars_vertex:F0,uv_vertex:O0,uv2_pars_fragment:U0,uv2_pars_vertex:B0,uv2_vertex:V0,worldpos_vertex:G0,background_vert:H0,background_frag:W0,backgroundCube_vert:X0,backgroundCube_frag:j0,cube_vert:q0,cube_frag:Y0,depth_vert:Z0,depth_frag:K0,distanceRGBA_vert:J0,distanceRGBA_frag:Q0,equirect_vert:$0,equirect_frag:e1,linedashed_vert:t1,linedashed_frag:n1,meshbasic_vert:i1,meshbasic_frag:r1,meshlambert_vert:s1,meshlambert_frag:a1,meshmatcap_vert:o1,meshmatcap_frag:l1,meshnormal_vert:c1,meshnormal_frag:u1,meshphong_vert:f1,meshphong_frag:d1,meshphysical_vert:h1,meshphysical_frag:p1,meshtoon_vert:m1,meshtoon_frag:_1,points_vert:g1,points_frag:b1,shadow_vert:v1,shadow_frag:y1,sprite_vert:w1,sprite_frag:M1},ge={common:{diffuse:{value:new mt(16777215)},opacity:{value:1},map:{value:null},uvTransform:{value:new Kt},uv2Transform:{value:new Kt},alphaMap:{value:null},alphaTest:{value:0}},specularmap:{specularMap:{value:null}},envmap:{envMap:{value:null},flipEnvMap:{value:-1},reflectivity:{value:1},ior:{value:1.5},refractionRatio:{value:.98}},aomap:{aoMap:{value:null},aoMapIntensity:{value:1}},lightmap:{lightMap:{value:null},lightMapIntensity:{value:1}},emissivemap:{emissiveMap:{value:null}},bumpmap:{bumpMap:{value:null},bumpScale:{value:1}},normalmap:{normalMap:{value:null},normalScale:{value:new lt(1,1)}},displacementmap:{displacementMap:{value:null},displacementScale:{value:1},displacementBias:{value:0}},roughnessmap:{roughnessMap:{value:null}},metalnessmap:{metalnessMap:{value:null}},gradientmap:{gradientMap:{value:null}},fog:{fogDensity:{value:25e-5},fogNear:{value:1},fogFar:{value:2e3},fogColor:{value:new mt(16777215)}},lights:{ambientLightColor:{value:[]},lightProbe:{value:[]},directionalLights:{value:[],properties:{direction:{},color:{}}},directionalLightShadows:{value:[],properties:{shadowBias:{},shadowNormalBias:{},shadowRadius:{},shadowMapSize:{}}},directionalShadowMap:{value:[]},directionalShadowMatrix:{value:[]},spotLights:{value:[],properties:{color:{},position:{},direction:{},distance:{},coneCos:{},penumbraCos:{},decay:{}}},spotLightShadows:{value:[],properties:{shadowBias:{},shadowNormalBias:{},shadowRadius:{},shadowMapSize:{}}},spotLightMap:{value:[]},spotShadowMap:{value:[]},spotLightMatrix:{value:[]},pointLights:{value:[],properties:{color:{},position:{},decay:{},distance:{}}},pointLightShadows:{value:[],properties:{shadowBias:{},shadowNormalBias:{},shadowRadius:{},shadowMapSize:{},shadowCameraNear:{},shadowCameraFar:{}}},pointShadowMap:{value:[]},pointShadowMatrix:{value:[]},hemisphereLights:{value:[],properties:{direction:{},skyColor:{},groundColor:{}}},rectAreaLights:{value:[],properties:{color:{},position:{},width:{},height:{}}},ltc_1:{value:null},ltc_2:{value:null}},points:{diffuse:{value:new mt(16777215)},opacity:{value:1},size:{value:1},scale:{value:1},map:{value:null},alphaMap:{value:null},alphaTest:{value:0},uvTransform:{value:new Kt}},sprite:{diffuse:{value:new mt(16777215)},opacity:{value:1},center:{value:new lt(.5,.5)},rotation:{value:0},map:{value:null},alphaMap:{value:null},alphaTest:{value:0},uvTransform:{value:new Kt}}},Sn={basic:{uniforms:qt([ge.common,ge.specularmap,ge.envmap,ge.aomap,ge.lightmap,ge.fog]),vertexShader:Ze.meshbasic_vert,fragmentShader:Ze.meshbasic_frag},lambert:{uniforms:qt([ge.common,ge.specularmap,ge.envmap,ge.aomap,ge.lightmap,ge.emissivemap,ge.bumpmap,ge.normalmap,ge.displacementmap,ge.fog,ge.lights,{emissive:{value:new mt(0)}}]),vertexShader:Ze.meshlambert_vert,fragmentShader:Ze.meshlambert_frag},phong:{uniforms:qt([ge.common,ge.specularmap,ge.envmap,ge.aomap,ge.lightmap,ge.emissivemap,ge.bumpmap,ge.normalmap,ge.displacementmap,ge.fog,ge.lights,{emissive:{value:new mt(0)},specular:{value:new mt(1118481)},shininess:{value:30}}]),vertexShader:Ze.meshphong_vert,fragmentShader:Ze.meshphong_frag},standard:{uniforms:qt([ge.common,ge.envmap,ge.aomap,ge.lightmap,ge.emissivemap,ge.bumpmap,ge.normalmap,ge.displacementmap,ge.roughnessmap,ge.metalnessmap,ge.fog,ge.lights,{emissive:{value:new mt(0)},roughness:{value:1},metalness:{value:0},envMapIntensity:{value:1}}]),vertexShader:Ze.meshphysical_vert,fragmentShader:Ze.meshphysical_frag},toon:{uniforms:qt([ge.common,ge.aomap,ge.lightmap,ge.emissivemap,ge.bumpmap,ge.normalmap,ge.displacementmap,ge.gradientmap,ge.fog,ge.lights,{emissive:{value:new mt(0)}}]),vertexShader:Ze.meshtoon_vert,fragmentShader:Ze.meshtoon_frag},matcap:{uniforms:qt([ge.common,ge.bumpmap,ge.normalmap,ge.displacementmap,ge.fog,{matcap:{value:null}}]),vertexShader:Ze.meshmatcap_vert,fragmentShader:Ze.meshmatcap_frag},points:{uniforms:qt([ge.points,ge.fog]),vertexShader:Ze.points_vert,fragmentShader:Ze.points_frag},dashed:{uniforms:qt([ge.common,ge.fog,{scale:{value:1},dashSize:{value:1},totalSize:{value:2}}]),vertexShader:Ze.linedashed_vert,fragmentShader:Ze.linedashed_frag},depth:{uniforms:qt([ge.common,ge.displacementmap]),vertexShader:Ze.depth_vert,fragmentShader:Ze.depth_frag},normal:{uniforms:qt([ge.common,ge.bumpmap,ge.normalmap,ge.displacementmap,{opacity:{value:1}}]),vertexShader:Ze.meshnormal_vert,fragmentShader:Ze.meshnormal_frag},sprite:{uniforms:qt([ge.sprite,ge.fog]),vertexShader:Ze.sprite_vert,fragmentShader:Ze.sprite_frag},background:{uniforms:{uvTransform:{value:new Kt},t2D:{value:null},backgroundIntensity:{value:1}},vertexShader:Ze.background_vert,fragmentShader:Ze.background_frag},backgroundCube:{uniforms:{envMap:{value:null},flipEnvMap:{value:-1},backgroundBlurriness:{value:0},backgroundIntensity:{value:1}},vertexShader:Ze.backgroundCube_vert,fragmentShader:Ze.backgroundCube_frag},cube:{uniforms:{tCube:{value:null},tFlip:{value:-1},opacity:{value:1}},vertexShader:Ze.cube_vert,fragmentShader:Ze.cube_frag},equirect:{uniforms:{tEquirect:{value:null}},vertexShader:Ze.equirect_vert,fragmentShader:Ze.equirect_frag},distanceRGBA:{uniforms:qt([ge.common,ge.displacementmap,{referencePosition:{value:new V},nearDistance:{value:1},farDistance:{value:1e3}}]),vertexShader:Ze.distanceRGBA_vert,fragmentShader:Ze.distanceRGBA_frag},shadow:{uniforms:qt([ge.lights,ge.fog,{color:{value:new mt(0)},opacity:{value:1}}]),vertexShader:Ze.shadow_vert,fragmentShader:Ze.shadow_frag}};Sn.physical={uniforms:qt([Sn.standard.uniforms,{clearcoat:{value:0},clearcoatMap:{value:null},clearcoatRoughness:{value:0},clearcoatRoughnessMap:{value:null},clearcoatNormalScale:{value:new lt(1,1)},clearcoatNormalMap:{value:null},iridescence:{value:0},iridescenceMap:{value:null},iridescenceIOR:{value:1.3},iridescenceThicknessMinimum:{value:100},iridescenceThicknessMaximum:{value:400},iridescenceThicknessMap:{value:null},sheen:{value:0},sheenColor:{value:new mt(0)},sheenColorMap:{value:null},sheenRoughness:{value:1},sheenRoughnessMap:{value:null},transmission:{value:0},transmissionMap:{value:null},transmissionSamplerSize:{value:new lt},transmissionSamplerMap:{value:null},thickness:{value:0},thicknessMap:{value:null},attenuationDistance:{value:0},attenuationColor:{value:new mt(0)},specularIntensity:{value:1},specularIntensityMap:{value:null},specularColor:{value:new mt(1,1,1)},specularColorMap:{value:null}}]),vertexShader:Ze.meshphysical_vert,fragmentShader:Ze.meshphysical_frag};const jr={r:0,b:0,g:0};function x1(r,e,t,n,i,s,a){const o=new mt(0);let l=s===!0?0:1,c,u,f=null,d=0,p=null;function m(_,g){let v=!1,b=g.isScene===!0?g.background:null;b&&b.isTexture&&(b=(g.backgroundBlurriness>0?t:e).get(b));const w=r.xr,y=w.getSession&&w.getSession();y&&y.environmentBlendMode==="additive"&&(b=null),b===null?h(o,l):b&&b.isColor&&(h(b,1),v=!0),(r.autoClear||v)&&r.clear(r.autoClearColor,r.autoClearDepth,r.autoClearStencil),b&&(b.isCubeTexture||b.mapping===ms)?(u===void 0&&(u=new Te(new Et(1,1,1),new mi({name:"BackgroundCubeMaterial",uniforms:Hi(Sn.backgroundCube.uniforms),vertexShader:Sn.backgroundCube.vertexShader,fragmentShader:Sn.backgroundCube.fragmentShader,side:an,depthTest:!1,depthWrite:!1,fog:!1})),u.geometry.deleteAttribute("normal"),u.geometry.deleteAttribute("uv"),u.onBeforeRender=function(x,S,M){this.matrixWorld.copyPosition(M.matrixWorld)},Object.defineProperty(u.material,"envMap",{get:function(){return this.uniforms.envMap.value}}),i.update(u)),u.material.uniforms.envMap.value=b,u.material.uniforms.flipEnvMap.value=b.isCubeTexture&&b.isRenderTargetTexture===!1?-1:1,u.material.uniforms.backgroundBlurriness.value=g.backgroundBlurriness,u.material.uniforms.backgroundIntensity.value=g.backgroundIntensity,u.material.toneMapped=b.encoding!==pt,(f!==b||d!==b.version||p!==r.toneMapping)&&(u.material.needsUpdate=!0,f=b,d=b.version,p=r.toneMapping),u.layers.enableAll(),_.unshift(u,u.geometry,u.material,0,0,null)):b&&b.isTexture&&(c===void 0&&(c=new Te(new bs(2,2),new mi({name:"BackgroundMaterial",uniforms:Hi(Sn.background.uniforms),vertexShader:Sn.background.vertexShader,fragmentShader:Sn.background.fragmentShader,side:Zn,depthTest:!1,depthWrite:!1,fog:!1})),c.geometry.deleteAttribute("normal"),Object.defineProperty(c.material,"map",{get:function(){return this.uniforms.t2D.value}}),i.update(c)),c.material.uniforms.t2D.value=b,c.material.uniforms.backgroundIntensity.value=g.backgroundIntensity,c.material.toneMapped=b.encoding!==pt,b.matrixAutoUpdate===!0&&b.updateMatrix(),c.material.uniforms.uvTransform.value.copy(b.matrix),(f!==b||d!==b.version||p!==r.toneMapping)&&(c.material.needsUpdate=!0,f=b,d=b.version,p=r.toneMapping),c.layers.enableAll(),_.unshift(c,c.geometry,c.material,0,0,null))}function h(_,g){_.getRGB(jr,tu(r)),n.buffers.color.setClear(jr.r,jr.g,jr.b,g,a)}return{getClearColor:function(){return o},setClearColor:function(_,g=1){o.set(_),l=g,h(o,l)},getClearAlpha:function(){return l},setClearAlpha:function(_){l=_,h(o,l)},render:m}}function S1(r,e,t,n){const i=r.getParameter(34921),s=n.isWebGL2?null:e.get("OES_vertex_array_object"),a=n.isWebGL2||s!==null,o={},l=_(null);let c=l,u=!1;function f(O,X,le,ce,te){let ne=!1;if(a){const ue=h(ce,le,X);c!==ue&&(c=ue,p(c.object)),ne=g(O,ce,le,te),ne&&v(O,ce,le,te)}else{const ue=X.wireframe===!0;(c.geometry!==ce.id||c.program!==le.id||c.wireframe!==ue)&&(c.geometry=ce.id,c.program=le.id,c.wireframe=ue,ne=!0)}te!==null&&t.update(te,34963),(ne||u)&&(u=!1,M(O,X,le,ce),te!==null&&r.bindBuffer(34963,t.get(te).buffer))}function d(){return n.isWebGL2?r.createVertexArray():s.createVertexArrayOES()}function p(O){return n.isWebGL2?r.bindVertexArray(O):s.bindVertexArrayOES(O)}function m(O){return n.isWebGL2?r.deleteVertexArray(O):s.deleteVertexArrayOES(O)}function h(O,X,le){const ce=le.wireframe===!0;let te=o[O.id];te===void 0&&(te={},o[O.id]=te);let ne=te[X.id];ne===void 0&&(ne={},te[X.id]=ne);let ue=ne[ce];return ue===void 0&&(ue=_(d()),ne[ce]=ue),ue}function _(O){const X=[],le=[],ce=[];for(let te=0;te<i;te++)X[te]=0,le[te]=0,ce[te]=0;return{geometry:null,program:null,wireframe:!1,newAttributes:X,enabledAttributes:le,attributeDivisors:ce,object:O,attributes:{},index:null}}function g(O,X,le,ce){const te=c.attributes,ne=X.attributes;let ue=0;const be=le.getAttributes();for(const q in be)if(be[q].location>=0){const he=te[q];let W=ne[q];if(W===void 0&&(q==="instanceMatrix"&&O.instanceMatrix&&(W=O.instanceMatrix),q==="instanceColor"&&O.instanceColor&&(W=O.instanceColor)),he===void 0||he.attribute!==W||W&&he.data!==W.data)return!0;ue++}return c.attributesNum!==ue||c.index!==ce}function v(O,X,le,ce){const te={},ne=X.attributes;let ue=0;const be=le.getAttributes();for(const q in be)if(be[q].location>=0){let he=ne[q];he===void 0&&(q==="instanceMatrix"&&O.instanceMatrix&&(he=O.instanceMatrix),q==="instanceColor"&&O.instanceColor&&(he=O.instanceColor));const W={};W.attribute=he,he&&he.data&&(W.data=he.data),te[q]=W,ue++}c.attributes=te,c.attributesNum=ue,c.index=ce}function b(){const O=c.newAttributes;for(let X=0,le=O.length;X<le;X++)O[X]=0}function w(O){y(O,0)}function y(O,X){const le=c.newAttributes,ce=c.enabledAttributes,te=c.attributeDivisors;le[O]=1,ce[O]===0&&(r.enableVertexAttribArray(O),ce[O]=1),te[O]!==X&&((n.isWebGL2?r:e.get("ANGLE_instanced_arrays"))[n.isWebGL2?"vertexAttribDivisor":"vertexAttribDivisorANGLE"](O,X),te[O]=X)}function x(){const O=c.newAttributes,X=c.enabledAttributes;for(let le=0,ce=X.length;le<ce;le++)X[le]!==O[le]&&(r.disableVertexAttribArray(le),X[le]=0)}function S(O,X,le,ce,te,ne){n.isWebGL2===!0&&(le===5124||le===5125)?r.vertexAttribIPointer(O,X,le,te,ne):r.vertexAttribPointer(O,X,le,ce,te,ne)}function M(O,X,le,ce){if(n.isWebGL2===!1&&(O.isInstancedMesh||ce.isInstancedBufferGeometry)&&e.get("ANGLE_instanced_arrays")===null)return;b();const te=ce.attributes,ne=le.getAttributes(),ue=X.defaultAttributeValues;for(const be in ne){const q=ne[be];if(q.location>=0){let ae=te[be];if(ae===void 0&&(be==="instanceMatrix"&&O.instanceMatrix&&(ae=O.instanceMatrix),be==="instanceColor"&&O.instanceColor&&(ae=O.instanceColor)),ae!==void 0){const he=ae.normalized,W=ae.itemSize,xe=t.get(ae);if(xe===void 0)continue;const ye=xe.buffer,Ee=xe.type,Ce=xe.bytesPerElement;if(ae.isInterleavedBufferAttribute){const Ne=ae.data,ke=Ne.stride,Ge=ae.offset;if(Ne.isInstancedInterleavedBuffer){for(let qe=0;qe<q.locationSize;qe++)y(q.location+qe,Ne.meshPerAttribute);O.isInstancedMesh!==!0&&ce._maxInstanceCount===void 0&&(ce._maxInstanceCount=Ne.meshPerAttribute*Ne.count)}else for(let qe=0;qe<q.locationSize;qe++)w(q.location+qe);r.bindBuffer(34962,ye);for(let qe=0;qe<q.locationSize;qe++)S(q.location+qe,W/q.locationSize,Ee,he,ke*Ce,(Ge+W/q.locationSize*qe)*Ce)}else{if(ae.isInstancedBufferAttribute){for(let Ne=0;Ne<q.locationSize;Ne++)y(q.location+Ne,ae.meshPerAttribute);O.isInstancedMesh!==!0&&ce._maxInstanceCount===void 0&&(ce._maxInstanceCount=ae.meshPerAttribute*ae.count)}else for(let Ne=0;Ne<q.locationSize;Ne++)w(q.location+Ne);r.bindBuffer(34962,ye);for(let Ne=0;Ne<q.locationSize;Ne++)S(q.location+Ne,W/q.locationSize,Ee,he,W*Ce,W/q.locationSize*Ne*Ce)}}else if(ue!==void 0){const he=ue[be];if(he!==void 0)switch(he.length){case 2:r.vertexAttrib2fv(q.location,he);break;case 3:r.vertexAttrib3fv(q.location,he);break;case 4:r.vertexAttrib4fv(q.location,he);break;default:r.vertexAttrib1fv(q.location,he)}}}}x()}function T(){G();for(const O in o){const X=o[O];for(const le in X){const ce=X[le];for(const te in ce)m(ce[te].object),delete ce[te];delete X[le]}delete o[O]}}function R(O){if(o[O.id]===void 0)return;const X=o[O.id];for(const le in X){const ce=X[le];for(const te in ce)m(ce[te].object),delete ce[te];delete X[le]}delete o[O.id]}function k(O){for(const X in o){const le=o[X];if(le[O.id]===void 0)continue;const ce=le[O.id];for(const te in ce)m(ce[te].object),delete ce[te];delete le[O.id]}}function G(){F(),u=!0,c!==l&&(c=l,p(c.object))}function F(){l.geometry=null,l.program=null,l.wireframe=!1}return{setup:f,reset:G,resetDefaultState:F,dispose:T,releaseStatesOfGeometry:R,releaseStatesOfProgram:k,initAttributes:b,enableAttribute:w,disableUnusedAttributes:x}}function C1(r,e,t,n){const i=n.isWebGL2;let s;function a(c){s=c}function o(c,u){r.drawArrays(s,c,u),t.update(u,s,1)}function l(c,u,f){if(f===0)return;let d,p;if(i)d=r,p="drawArraysInstanced";else if(d=e.get("ANGLE_instanced_arrays"),p="drawArraysInstancedANGLE",d===null){console.error("THREE.WebGLBufferRenderer: using THREE.InstancedBufferGeometry but hardware does not support extension ANGLE_instanced_arrays.");return}d[p](s,c,u,f),t.update(u,s,f)}this.setMode=a,this.render=o,this.renderInstances=l}function T1(r,e,t){let n;function i(){if(n!==void 0)return n;if(e.has("EXT_texture_filter_anisotropic")===!0){const S=e.get("EXT_texture_filter_anisotropic");n=r.getParameter(S.MAX_TEXTURE_MAX_ANISOTROPY_EXT)}else n=0;return n}function s(S){if(S==="highp"){if(r.getShaderPrecisionFormat(35633,36338).precision>0&&r.getShaderPrecisionFormat(35632,36338).precision>0)return"highp";S="mediump"}return S==="mediump"&&r.getShaderPrecisionFormat(35633,36337).precision>0&&r.getShaderPrecisionFormat(35632,36337).precision>0?"mediump":"lowp"}const a=typeof WebGL2RenderingContext<"u"&&r instanceof WebGL2RenderingContext;let o=t.precision!==void 0?t.precision:"highp";const l=s(o);l!==o&&(console.warn("THREE.WebGLRenderer:",o,"not supported, using",l,"instead."),o=l);const c=a||e.has("WEBGL_draw_buffers"),u=t.logarithmicDepthBuffer===!0,f=r.getParameter(34930),d=r.getParameter(35660),p=r.getParameter(3379),m=r.getParameter(34076),h=r.getParameter(34921),_=r.getParameter(36347),g=r.getParameter(36348),v=r.getParameter(36349),b=d>0,w=a||e.has("OES_texture_float"),y=b&&w,x=a?r.getParameter(36183):0;return{isWebGL2:a,drawBuffers:c,getMaxAnisotropy:i,getMaxPrecision:s,precision:o,logarithmicDepthBuffer:u,maxTextures:f,maxVertexTextures:d,maxTextureSize:p,maxCubemapSize:m,maxAttributes:h,maxVertexUniforms:_,maxVaryings:g,maxFragmentUniforms:v,vertexTextures:b,floatFragmentTextures:w,floatVertexTextures:y,maxSamples:x}}function E1(r){const e=this;let t=null,n=0,i=!1,s=!1;const a=new ii,o=new Kt,l={value:null,needsUpdate:!1};this.uniform=l,this.numPlanes=0,this.numIntersection=0,this.init=function(f,d){const p=f.length!==0||d||n!==0||i;return i=d,n=f.length,p},this.beginShadows=function(){s=!0,u(null)},this.endShadows=function(){s=!1},this.setGlobalState=function(f,d){t=u(f,d,0)},this.setState=function(f,d,p){const m=f.clippingPlanes,h=f.clipIntersection,_=f.clipShadows,g=r.get(f);if(!i||m===null||m.length===0||s&&!_)s?u(null):c();else{const v=s?0:n,b=v*4;let w=g.clippingState||null;l.value=w,w=u(m,d,b,p);for(let y=0;y!==b;++y)w[y]=t[y];g.clippingState=w,this.numIntersection=h?this.numPlanes:0,this.numPlanes+=v}};function c(){l.value!==t&&(l.value=t,l.needsUpdate=n>0),e.numPlanes=n,e.numIntersection=0}function u(f,d,p,m){const h=f!==null?f.length:0;let _=null;if(h!==0){if(_=l.value,m!==!0||_===null){const g=p+h*4,v=d.matrixWorldInverse;o.getNormalMatrix(v),(_===null||_.length<g)&&(_=new Float32Array(g));for(let b=0,w=p;b!==h;++b,w+=4)a.copy(f[b]).applyMatrix4(v,o),a.normal.toArray(_,w),_[w+3]=a.constant}l.value=_,l.needsUpdate=!0}return e.numPlanes=h,e.numIntersection=0,_}}function L1(r){let e=new WeakMap;function t(a,o){return o===ca?a.mapping=Bi:o===ua&&(a.mapping=Vi),a}function n(a){if(a&&a.isTexture&&a.isRenderTargetTexture===!1){const o=a.mapping;if(o===ca||o===ua)if(e.has(a)){const l=e.get(a).texture;return t(l,a.mapping)}else{const l=a.image;if(l&&l.height>0){const c=new V_(l.height/2);return c.fromEquirectangularTexture(r,a),e.set(a,c),a.addEventListener("dispose",i),t(c.texture,a.mapping)}else return null}}return a}function i(a){const o=a.target;o.removeEventListener("dispose",i);const l=e.get(o);l!==void 0&&(e.delete(o),l.dispose())}function s(){e=new WeakMap}return{get:n,dispose:s}}class P1 extends nu{constructor(e=-1,t=1,n=1,i=-1,s=.1,a=2e3){super(),this.isOrthographicCamera=!0,this.type="OrthographicCamera",this.zoom=1,this.view=null,this.left=e,this.right=t,this.top=n,this.bottom=i,this.near=s,this.far=a,this.updateProjectionMatrix()}copy(e,t){return super.copy(e,t),this.left=e.left,this.right=e.right,this.top=e.top,this.bottom=e.bottom,this.near=e.near,this.far=e.far,this.zoom=e.zoom,this.view=e.view===null?null:Object.assign({},e.view),this}setViewOffset(e,t,n,i,s,a){this.view===null&&(this.view={enabled:!0,fullWidth:1,fullHeight:1,offsetX:0,offsetY:0,width:1,height:1}),this.view.enabled=!0,this.view.fullWidth=e,this.view.fullHeight=t,this.view.offsetX=n,this.view.offsetY=i,this.view.width=s,this.view.height=a,this.updateProjectionMatrix()}clearViewOffset(){this.view!==null&&(this.view.enabled=!1),this.updateProjectionMatrix()}updateProjectionMatrix(){const e=(this.right-this.left)/(2*this.zoom),t=(this.top-this.bottom)/(2*this.zoom),n=(this.right+this.left)/2,i=(this.top+this.bottom)/2;let s=n-e,a=n+e,o=i+t,l=i-t;if(this.view!==null&&this.view.enabled){const c=(this.right-this.left)/this.view.fullWidth/this.zoom,u=(this.top-this.bottom)/this.view.fullHeight/this.zoom;s+=c*this.view.offsetX,a=s+c*this.view.width,o-=u*this.view.offsetY,l=o-u*this.view.height}this.projectionMatrix.makeOrthographic(s,a,o,l,this.near,this.far),this.projectionMatrixInverse.copy(this.projectionMatrix).invert()}toJSON(e){const t=super.toJSON(e);return t.object.zoom=this.zoom,t.object.left=this.left,t.object.right=this.right,t.object.top=this.top,t.object.bottom=this.bottom,t.object.near=this.near,t.object.far=this.far,this.view!==null&&(t.object.view=Object.assign({},this.view)),t}}const Di=4,Xl=[.125,.215,.35,.446,.526,.582],ai=20,Qs=new P1,jl=new mt;let $s=null;const ri=(1+Math.sqrt(5))/2,Pi=1/ri,ql=[new V(1,1,1),new V(-1,1,1),new V(1,1,-1),new V(-1,1,-1),new V(0,ri,Pi),new V(0,ri,-Pi),new V(Pi,0,ri),new V(-Pi,0,ri),new V(ri,Pi,0),new V(-ri,Pi,0)];class Yl{constructor(e){this._renderer=e,this._pingPongRenderTarget=null,this._lodMax=0,this._cubeSize=0,this._lodPlanes=[],this._sizeLods=[],this._sigmas=[],this._blurMaterial=null,this._cubemapMaterial=null,this._equirectMaterial=null,this._compileMaterial(this._blurMaterial)}fromScene(e,t=0,n=.1,i=100){$s=this._renderer.getRenderTarget(),this._setSize(256);const s=this._allocateTargets();return s.depthBuffer=!0,this._sceneToCubeUV(e,n,i,s),t>0&&this._blur(s,0,0,t),this._applyPMREM(s),this._cleanup(s),s}fromEquirectangular(e,t=null){return this._fromTexture(e,t)}fromCubemap(e,t=null){return this._fromTexture(e,t)}compileCubemapShader(){this._cubemapMaterial===null&&(this._cubemapMaterial=Jl(),this._compileMaterial(this._cubemapMaterial))}compileEquirectangularShader(){this._equirectMaterial===null&&(this._equirectMaterial=Kl(),this._compileMaterial(this._equirectMaterial))}dispose(){this._dispose(),this._cubemapMaterial!==null&&this._cubemapMaterial.dispose(),this._equirectMaterial!==null&&this._equirectMaterial.dispose()}_setSize(e){this._lodMax=Math.floor(Math.log2(e)),this._cubeSize=Math.pow(2,this._lodMax)}_dispose(){this._blurMaterial!==null&&this._blurMaterial.dispose(),this._pingPongRenderTarget!==null&&this._pingPongRenderTarget.dispose();for(let e=0;e<this._lodPlanes.length;e++)this._lodPlanes[e].dispose()}_cleanup(e){this._renderer.setRenderTarget($s),e.scissorTest=!1,qr(e,0,0,e.width,e.height)}_fromTexture(e,t){e.mapping===Bi||e.mapping===Vi?this._setSize(e.image.length===0?16:e.image[0].width||e.image[0].image.width):this._setSize(e.image.width/4),$s=this._renderer.getRenderTarget();const n=t||this._allocateTargets();return this._textureToCubeUV(e,n),this._applyPMREM(n),this._cleanup(n),n}_allocateTargets(){const e=3*Math.max(this._cubeSize,112),t=4*this._cubeSize,n={magFilter:fn,minFilter:fn,generateMipmaps:!1,type:vr,format:gn,encoding:hi,depthBuffer:!1},i=Zl(e,t,n);if(this._pingPongRenderTarget===null||this._pingPongRenderTarget.width!==e||this._pingPongRenderTarget.height!==t){this._pingPongRenderTarget!==null&&this._dispose(),this._pingPongRenderTarget=Zl(e,t,n);const{_lodMax:s}=this;({sizeLods:this._sizeLods,lodPlanes:this._lodPlanes,sigmas:this._sigmas}=A1(s)),this._blurMaterial=D1(s,e,t)}return i}_compileMaterial(e){const t=new Te(this._lodPlanes[0],e);this._renderer.compile(t,Qs)}_sceneToCubeUV(e,t,n,i){const o=new dn(90,1,t,n),l=[1,-1,1,1,1,1],c=[1,1,1,-1,-1,-1],u=this._renderer,f=u.autoClear,d=u.toneMapping;u.getClearColor(jl),u.toneMapping=Un,u.autoClear=!1;const p=new gs({name:"PMREM.Background",side:an,depthWrite:!1,depthTest:!1}),m=new Te(new Et,p);let h=!1;const _=e.background;_?_.isColor&&(p.color.copy(_),e.background=null,h=!0):(p.color.copy(jl),h=!0);for(let g=0;g<6;g++){const v=g%3;v===0?(o.up.set(0,l[g],0),o.lookAt(c[g],0,0)):v===1?(o.up.set(0,0,l[g]),o.lookAt(0,c[g],0)):(o.up.set(0,l[g],0),o.lookAt(0,0,c[g]));const b=this._cubeSize;qr(i,v*b,g>2?b:0,b,b),u.setRenderTarget(i),h&&u.render(m,o),u.render(e,o)}m.geometry.dispose(),m.material.dispose(),u.toneMapping=d,u.autoClear=f,e.background=_}_textureToCubeUV(e,t){const n=this._renderer,i=e.mapping===Bi||e.mapping===Vi;i?(this._cubemapMaterial===null&&(this._cubemapMaterial=Jl()),this._cubemapMaterial.uniforms.flipEnvMap.value=e.isRenderTargetTexture===!1?-1:1):this._equirectMaterial===null&&(this._equirectMaterial=Kl());const s=i?this._cubemapMaterial:this._equirectMaterial,a=new Te(this._lodPlanes[0],s),o=s.uniforms;o.envMap.value=e;const l=this._cubeSize;qr(t,0,0,3*l,2*l),n.setRenderTarget(t),n.render(a,Qs)}_applyPMREM(e){const t=this._renderer,n=t.autoClear;t.autoClear=!1;for(let i=1;i<this._lodPlanes.length;i++){const s=Math.sqrt(this._sigmas[i]*this._sigmas[i]-this._sigmas[i-1]*this._sigmas[i-1]),a=ql[(i-1)%ql.length];this._blur(e,i-1,i,s,a)}t.autoClear=n}_blur(e,t,n,i,s){const a=this._pingPongRenderTarget;this._halfBlur(e,a,t,n,i,"latitudinal",s),this._halfBlur(a,e,n,n,i,"longitudinal",s)}_halfBlur(e,t,n,i,s,a,o){const l=this._renderer,c=this._blurMaterial;a!=="latitudinal"&&a!=="longitudinal"&&console.error("blur direction must be either latitudinal or longitudinal!");const u=3,f=new Te(this._lodPlanes[i],c),d=c.uniforms,p=this._sizeLods[n]-1,m=isFinite(s)?Math.PI/(2*p):2*Math.PI/(2*ai-1),h=s/m,_=isFinite(s)?1+Math.floor(u*h):ai;_>ai&&console.warn(`sigmaRadians, ${s}, is too large and will clip, as it requested ${_} samples when the maximum is set to ${ai}`);const g=[];let v=0;for(let S=0;S<ai;++S){const M=S/h,T=Math.exp(-M*M/2);g.push(T),S===0?v+=T:S<_&&(v+=2*T)}for(let S=0;S<g.length;S++)g[S]=g[S]/v;d.envMap.value=e.texture,d.samples.value=_,d.weights.value=g,d.latitudinal.value=a==="latitudinal",o&&(d.poleAxis.value=o);const{_lodMax:b}=this;d.dTheta.value=m,d.mipInt.value=b-n;const w=this._sizeLods[i],y=3*w*(i>b-Di?i-b+Di:0),x=4*(this._cubeSize-w);qr(t,y,x,3*w,2*w),l.setRenderTarget(t),l.render(f,Qs)}}function A1(r){const e=[],t=[],n=[];let i=r;const s=r-Di+1+Xl.length;for(let a=0;a<s;a++){const o=Math.pow(2,i);t.push(o);let l=1/o;a>r-Di?l=Xl[a-r+Di-1]:a===0&&(l=0),n.push(l);const c=1/(o-2),u=-c,f=1+c,d=[u,u,f,u,f,f,u,u,f,f,u,f],p=6,m=6,h=3,_=2,g=1,v=new Float32Array(h*m*p),b=new Float32Array(_*m*p),w=new Float32Array(g*m*p);for(let x=0;x<p;x++){const S=x%3*2/3-1,M=x>2?0:-1,T=[S,M,0,S+2/3,M,0,S+2/3,M+1,0,S,M,0,S+2/3,M+1,0,S,M+1,0];v.set(T,h*m*x),b.set(d,_*m*x);const R=[x,x,x,x,x,x];w.set(R,g*m*x)}const y=new en;y.setAttribute("position",new Cn(v,h)),y.setAttribute("uv",new Cn(b,_)),y.setAttribute("faceIndex",new Cn(w,g)),e.push(y),i>Di&&i--}return{lodPlanes:e,sizeLods:t,sigmas:n}}function Zl(r,e,t){const n=new pi(r,e,t);return n.texture.mapping=ms,n.texture.name="PMREM.cubeUv",n.scissorTest=!0,n}function qr(r,e,t,n,i){r.viewport.set(e,t,n,i),r.scissor.set(e,t,n,i)}function D1(r,e,t){const n=new Float32Array(ai),i=new V(0,1,0);return new mi({name:"SphericalGaussianBlur",defines:{n:ai,CUBEUV_TEXEL_WIDTH:1/e,CUBEUV_TEXEL_HEIGHT:1/t,CUBEUV_MAX_MIP:`${r}.0`},uniforms:{envMap:{value:null},samples:{value:1},weights:{value:n},latitudinal:{value:!1},dTheta:{value:0},mipInt:{value:0},poleAxis:{value:i}},vertexShader:Sa(),fragmentShader:`

			precision mediump float;
			precision mediump int;

			varying vec3 vOutputDirection;

			uniform sampler2D envMap;
			uniform int samples;
			uniform float weights[ n ];
			uniform bool latitudinal;
			uniform float dTheta;
			uniform float mipInt;
			uniform vec3 poleAxis;

			#define ENVMAP_TYPE_CUBE_UV
			#include <cube_uv_reflection_fragment>

			vec3 getSample( float theta, vec3 axis ) {

				float cosTheta = cos( theta );
				// Rodrigues' axis-angle rotation
				vec3 sampleDirection = vOutputDirection * cosTheta
					+ cross( axis, vOutputDirection ) * sin( theta )
					+ axis * dot( axis, vOutputDirection ) * ( 1.0 - cosTheta );

				return bilinearCubeUV( envMap, sampleDirection, mipInt );

			}

			void main() {

				vec3 axis = latitudinal ? poleAxis : cross( poleAxis, vOutputDirection );

				if ( all( equal( axis, vec3( 0.0 ) ) ) ) {

					axis = vec3( vOutputDirection.z, 0.0, - vOutputDirection.x );

				}

				axis = normalize( axis );

				gl_FragColor = vec4( 0.0, 0.0, 0.0, 1.0 );
				gl_FragColor.rgb += weights[ 0 ] * getSample( 0.0, axis );

				for ( int i = 1; i < n; i++ ) {

					if ( i >= samples ) {

						break;

					}

					float theta = dTheta * float( i );
					gl_FragColor.rgb += weights[ i ] * getSample( -1.0 * theta, axis );
					gl_FragColor.rgb += weights[ i ] * getSample( theta, axis );

				}

			}
		`,blending:Yn,depthTest:!1,depthWrite:!1})}function Kl(){return new mi({name:"EquirectangularToCubeUV",uniforms:{envMap:{value:null}},vertexShader:Sa(),fragmentShader:`

			precision mediump float;
			precision mediump int;

			varying vec3 vOutputDirection;

			uniform sampler2D envMap;

			#include <common>

			void main() {

				vec3 outputDirection = normalize( vOutputDirection );
				vec2 uv = equirectUv( outputDirection );

				gl_FragColor = vec4( texture2D ( envMap, uv ).rgb, 1.0 );

			}
		`,blending:Yn,depthTest:!1,depthWrite:!1})}function Jl(){return new mi({name:"CubemapToCubeUV",uniforms:{envMap:{value:null},flipEnvMap:{value:-1}},vertexShader:Sa(),fragmentShader:`

			precision mediump float;
			precision mediump int;

			uniform float flipEnvMap;

			varying vec3 vOutputDirection;

			uniform samplerCube envMap;

			void main() {

				gl_FragColor = textureCube( envMap, vec3( flipEnvMap * vOutputDirection.x, vOutputDirection.yz ) );

			}
		`,blending:Yn,depthTest:!1,depthWrite:!1})}function Sa(){return`

		precision mediump float;
		precision mediump int;

		attribute float faceIndex;

		varying vec3 vOutputDirection;

		// RH coordinate system; PMREM face-indexing convention
		vec3 getDirection( vec2 uv, float face ) {

			uv = 2.0 * uv - 1.0;

			vec3 direction = vec3( uv, 1.0 );

			if ( face == 0.0 ) {

				direction = direction.zyx; // ( 1, v, u ) pos x

			} else if ( face == 1.0 ) {

				direction = direction.xzy;
				direction.xz *= -1.0; // ( -u, 1, -v ) pos y

			} else if ( face == 2.0 ) {

				direction.x *= -1.0; // ( -u, v, 1 ) pos z

			} else if ( face == 3.0 ) {

				direction = direction.zyx;
				direction.xz *= -1.0; // ( -1, v, -u ) neg x

			} else if ( face == 4.0 ) {

				direction = direction.xzy;
				direction.xy *= -1.0; // ( -u, -1, v ) neg y

			} else if ( face == 5.0 ) {

				direction.z *= -1.0; // ( u, v, -1 ) neg z

			}

			return direction;

		}

		void main() {

			vOutputDirection = getDirection( uv, faceIndex );
			gl_Position = vec4( position, 1.0 );

		}
	`}function R1(r){let e=new WeakMap,t=null;function n(o){if(o&&o.isTexture){const l=o.mapping,c=l===ca||l===ua,u=l===Bi||l===Vi;if(c||u)if(o.isRenderTargetTexture&&o.needsPMREMUpdate===!0){o.needsPMREMUpdate=!1;let f=e.get(o);return t===null&&(t=new Yl(r)),f=c?t.fromEquirectangular(o,f):t.fromCubemap(o,f),e.set(o,f),f.texture}else{if(e.has(o))return e.get(o).texture;{const f=o.image;if(c&&f&&f.height>0||u&&f&&i(f)){t===null&&(t=new Yl(r));const d=c?t.fromEquirectangular(o):t.fromCubemap(o);return e.set(o,d),o.addEventListener("dispose",s),d.texture}else return null}}}return o}function i(o){let l=0;const c=6;for(let u=0;u<c;u++)o[u]!==void 0&&l++;return l===c}function s(o){const l=o.target;l.removeEventListener("dispose",s);const c=e.get(l);c!==void 0&&(e.delete(l),c.dispose())}function a(){e=new WeakMap,t!==null&&(t.dispose(),t=null)}return{get:n,dispose:a}}function k1(r){const e={};function t(n){if(e[n]!==void 0)return e[n];let i;switch(n){case"WEBGL_depth_texture":i=r.getExtension("WEBGL_depth_texture")||r.getExtension("MOZ_WEBGL_depth_texture")||r.getExtension("WEBKIT_WEBGL_depth_texture");break;case"EXT_texture_filter_anisotropic":i=r.getExtension("EXT_texture_filter_anisotropic")||r.getExtension("MOZ_EXT_texture_filter_anisotropic")||r.getExtension("WEBKIT_EXT_texture_filter_anisotropic");break;case"WEBGL_compressed_texture_s3tc":i=r.getExtension("WEBGL_compressed_texture_s3tc")||r.getExtension("MOZ_WEBGL_compressed_texture_s3tc")||r.getExtension("WEBKIT_WEBGL_compressed_texture_s3tc");break;case"WEBGL_compressed_texture_pvrtc":i=r.getExtension("WEBGL_compressed_texture_pvrtc")||r.getExtension("WEBKIT_WEBGL_compressed_texture_pvrtc");break;default:i=r.getExtension(n)}return e[n]=i,i}return{has:function(n){return t(n)!==null},init:function(n){n.isWebGL2?t("EXT_color_buffer_float"):(t("WEBGL_depth_texture"),t("OES_texture_float"),t("OES_texture_half_float"),t("OES_texture_half_float_linear"),t("OES_standard_derivatives"),t("OES_element_index_uint"),t("OES_vertex_array_object"),t("ANGLE_instanced_arrays")),t("OES_texture_float_linear"),t("EXT_color_buffer_half_float"),t("WEBGL_multisampled_render_to_texture")},get:function(n){const i=t(n);return i===null&&console.warn("THREE.WebGLRenderer: "+n+" extension not supported."),i}}}function I1(r,e,t,n){const i={},s=new WeakMap;function a(f){const d=f.target;d.index!==null&&e.remove(d.index);for(const m in d.attributes)e.remove(d.attributes[m]);d.removeEventListener("dispose",a),delete i[d.id];const p=s.get(d);p&&(e.remove(p),s.delete(d)),n.releaseStatesOfGeometry(d),d.isInstancedBufferGeometry===!0&&delete d._maxInstanceCount,t.memory.geometries--}function o(f,d){return i[d.id]===!0||(d.addEventListener("dispose",a),i[d.id]=!0,t.memory.geometries++),d}function l(f){const d=f.attributes;for(const m in d)e.update(d[m],34962);const p=f.morphAttributes;for(const m in p){const h=p[m];for(let _=0,g=h.length;_<g;_++)e.update(h[_],34962)}}function c(f){const d=[],p=f.index,m=f.attributes.position;let h=0;if(p!==null){const v=p.array;h=p.version;for(let b=0,w=v.length;b<w;b+=3){const y=v[b+0],x=v[b+1],S=v[b+2];d.push(y,x,x,S,S,y)}}else{const v=m.array;h=m.version;for(let b=0,w=v.length/3-1;b<w;b+=3){const y=b+0,x=b+1,S=b+2;d.push(y,x,x,S,S,y)}}const _=new(Yc(d)?eu:$c)(d,1);_.version=h;const g=s.get(f);g&&e.remove(g),s.set(f,_)}function u(f){const d=s.get(f);if(d){const p=f.index;p!==null&&d.version<p.version&&c(f)}else c(f);return s.get(f)}return{get:o,update:l,getWireframeAttribute:u}}function N1(r,e,t,n){const i=n.isWebGL2;let s;function a(d){s=d}let o,l;function c(d){o=d.type,l=d.bytesPerElement}function u(d,p){r.drawElements(s,p,o,d*l),t.update(p,s,1)}function f(d,p,m){if(m===0)return;let h,_;if(i)h=r,_="drawElementsInstanced";else if(h=e.get("ANGLE_instanced_arrays"),_="drawElementsInstancedANGLE",h===null){console.error("THREE.WebGLIndexedBufferRenderer: using THREE.InstancedBufferGeometry but hardware does not support extension ANGLE_instanced_arrays.");return}h[_](s,p,o,d*l,m),t.update(p,s,m)}this.setMode=a,this.setIndex=c,this.render=u,this.renderInstances=f}function z1(r){const e={geometries:0,textures:0},t={frame:0,calls:0,triangles:0,points:0,lines:0};function n(s,a,o){switch(t.calls++,a){case 4:t.triangles+=o*(s/3);break;case 1:t.lines+=o*(s/2);break;case 3:t.lines+=o*(s-1);break;case 2:t.lines+=o*s;break;case 0:t.points+=o*s;break;default:console.error("THREE.WebGLInfo: Unknown draw mode:",a);break}}function i(){t.frame++,t.calls=0,t.triangles=0,t.points=0,t.lines=0}return{memory:e,render:t,programs:null,autoReset:!0,reset:i,update:n}}function F1(r,e){return r[0]-e[0]}function O1(r,e){return Math.abs(e[1])-Math.abs(r[1])}function U1(r,e,t){const n={},i=new Float32Array(8),s=new WeakMap,a=new Ot,o=[];for(let c=0;c<8;c++)o[c]=[c,0];function l(c,u,f){const d=c.morphTargetInfluences;if(e.isWebGL2===!0){const p=u.morphAttributes.position||u.morphAttributes.normal||u.morphAttributes.color,m=p!==void 0?p.length:0;let h=s.get(u);if(h===void 0||h.count!==m){let O=function(){G.dispose(),s.delete(u),u.removeEventListener("dispose",O)};h!==void 0&&h.texture.dispose();const v=u.morphAttributes.position!==void 0,b=u.morphAttributes.normal!==void 0,w=u.morphAttributes.color!==void 0,y=u.morphAttributes.position||[],x=u.morphAttributes.normal||[],S=u.morphAttributes.color||[];let M=0;v===!0&&(M=1),b===!0&&(M=2),w===!0&&(M=3);let T=u.attributes.position.count*M,R=1;T>e.maxTextureSize&&(R=Math.ceil(T/e.maxTextureSize),T=e.maxTextureSize);const k=new Float32Array(T*R*4*m),G=new Jc(k,T,R,m);G.type=ci,G.needsUpdate=!0;const F=M*4;for(let X=0;X<m;X++){const le=y[X],ce=x[X],te=S[X],ne=T*R*4*X;for(let ue=0;ue<le.count;ue++){const be=ue*F;v===!0&&(a.fromBufferAttribute(le,ue),k[ne+be+0]=a.x,k[ne+be+1]=a.y,k[ne+be+2]=a.z,k[ne+be+3]=0),b===!0&&(a.fromBufferAttribute(ce,ue),k[ne+be+4]=a.x,k[ne+be+5]=a.y,k[ne+be+6]=a.z,k[ne+be+7]=0),w===!0&&(a.fromBufferAttribute(te,ue),k[ne+be+8]=a.x,k[ne+be+9]=a.y,k[ne+be+10]=a.z,k[ne+be+11]=te.itemSize===4?a.w:1)}}h={count:m,texture:G,size:new lt(T,R)},s.set(u,h),u.addEventListener("dispose",O)}let _=0;for(let v=0;v<d.length;v++)_+=d[v];const g=u.morphTargetsRelative?1:1-_;f.getUniforms().setValue(r,"morphTargetBaseInfluence",g),f.getUniforms().setValue(r,"morphTargetInfluences",d),f.getUniforms().setValue(r,"morphTargetsTexture",h.texture,t),f.getUniforms().setValue(r,"morphTargetsTextureSize",h.size)}else{const p=d===void 0?0:d.length;let m=n[u.id];if(m===void 0||m.length!==p){m=[];for(let b=0;b<p;b++)m[b]=[b,0];n[u.id]=m}for(let b=0;b<p;b++){const w=m[b];w[0]=b,w[1]=d[b]}m.sort(O1);for(let b=0;b<8;b++)b<p&&m[b][1]?(o[b][0]=m[b][0],o[b][1]=m[b][1]):(o[b][0]=Number.MAX_SAFE_INTEGER,o[b][1]=0);o.sort(F1);const h=u.morphAttributes.position,_=u.morphAttributes.normal;let g=0;for(let b=0;b<8;b++){const w=o[b],y=w[0],x=w[1];y!==Number.MAX_SAFE_INTEGER&&x?(h&&u.getAttribute("morphTarget"+b)!==h[y]&&u.setAttribute("morphTarget"+b,h[y]),_&&u.getAttribute("morphNormal"+b)!==_[y]&&u.setAttribute("morphNormal"+b,_[y]),i[b]=x,g+=x):(h&&u.hasAttribute("morphTarget"+b)===!0&&u.deleteAttribute("morphTarget"+b),_&&u.hasAttribute("morphNormal"+b)===!0&&u.deleteAttribute("morphNormal"+b),i[b]=0)}const v=u.morphTargetsRelative?1:1-g;f.getUniforms().setValue(r,"morphTargetBaseInfluence",v),f.getUniforms().setValue(r,"morphTargetInfluences",i)}}return{update:l}}function B1(r,e,t,n){let i=new WeakMap;function s(l){const c=n.render.frame,u=l.geometry,f=e.get(l,u);return i.get(f)!==c&&(e.update(f),i.set(f,c)),l.isInstancedMesh&&(l.hasEventListener("dispose",o)===!1&&l.addEventListener("dispose",o),t.update(l.instanceMatrix,34962),l.instanceColor!==null&&t.update(l.instanceColor,34962)),f}function a(){i=new WeakMap}function o(l){const c=l.target;c.removeEventListener("dispose",o),t.remove(c.instanceMatrix),c.instanceColor!==null&&t.remove(c.instanceColor)}return{update:s,dispose:a}}const au=new on,ou=new Jc,lu=new C_,cu=new iu,Ql=[],$l=[],ec=new Float32Array(16),tc=new Float32Array(9),nc=new Float32Array(4);function qi(r,e,t){const n=r[0];if(n<=0||n>0)return r;const i=e*t;let s=Ql[i];if(s===void 0&&(s=new Float32Array(i),Ql[i]=s),e!==0){n.toArray(s,0);for(let a=1,o=0;a!==e;++a)o+=t,r[a].toArray(s,o)}return s}function At(r,e){if(r.length!==e.length)return!1;for(let t=0,n=r.length;t<n;t++)if(r[t]!==e[t])return!1;return!0}function Dt(r,e){for(let t=0,n=e.length;t<n;t++)r[t]=e[t]}function vs(r,e){let t=$l[e];t===void 0&&(t=new Int32Array(e),$l[e]=t);for(let n=0;n!==e;++n)t[n]=r.allocateTextureUnit();return t}function V1(r,e){const t=this.cache;t[0]!==e&&(r.uniform1f(this.addr,e),t[0]=e)}function G1(r,e){const t=this.cache;if(e.x!==void 0)(t[0]!==e.x||t[1]!==e.y)&&(r.uniform2f(this.addr,e.x,e.y),t[0]=e.x,t[1]=e.y);else{if(At(t,e))return;r.uniform2fv(this.addr,e),Dt(t,e)}}function H1(r,e){const t=this.cache;if(e.x!==void 0)(t[0]!==e.x||t[1]!==e.y||t[2]!==e.z)&&(r.uniform3f(this.addr,e.x,e.y,e.z),t[0]=e.x,t[1]=e.y,t[2]=e.z);else if(e.r!==void 0)(t[0]!==e.r||t[1]!==e.g||t[2]!==e.b)&&(r.uniform3f(this.addr,e.r,e.g,e.b),t[0]=e.r,t[1]=e.g,t[2]=e.b);else{if(At(t,e))return;r.uniform3fv(this.addr,e),Dt(t,e)}}function W1(r,e){const t=this.cache;if(e.x!==void 0)(t[0]!==e.x||t[1]!==e.y||t[2]!==e.z||t[3]!==e.w)&&(r.uniform4f(this.addr,e.x,e.y,e.z,e.w),t[0]=e.x,t[1]=e.y,t[2]=e.z,t[3]=e.w);else{if(At(t,e))return;r.uniform4fv(this.addr,e),Dt(t,e)}}function X1(r,e){const t=this.cache,n=e.elements;if(n===void 0){if(At(t,e))return;r.uniformMatrix2fv(this.addr,!1,e),Dt(t,e)}else{if(At(t,n))return;nc.set(n),r.uniformMatrix2fv(this.addr,!1,nc),Dt(t,n)}}function j1(r,e){const t=this.cache,n=e.elements;if(n===void 0){if(At(t,e))return;r.uniformMatrix3fv(this.addr,!1,e),Dt(t,e)}else{if(At(t,n))return;tc.set(n),r.uniformMatrix3fv(this.addr,!1,tc),Dt(t,n)}}function q1(r,e){const t=this.cache,n=e.elements;if(n===void 0){if(At(t,e))return;r.uniformMatrix4fv(this.addr,!1,e),Dt(t,e)}else{if(At(t,n))return;ec.set(n),r.uniformMatrix4fv(this.addr,!1,ec),Dt(t,n)}}function Y1(r,e){const t=this.cache;t[0]!==e&&(r.uniform1i(this.addr,e),t[0]=e)}function Z1(r,e){const t=this.cache;if(e.x!==void 0)(t[0]!==e.x||t[1]!==e.y)&&(r.uniform2i(this.addr,e.x,e.y),t[0]=e.x,t[1]=e.y);else{if(At(t,e))return;r.uniform2iv(this.addr,e),Dt(t,e)}}function K1(r,e){const t=this.cache;if(e.x!==void 0)(t[0]!==e.x||t[1]!==e.y||t[2]!==e.z)&&(r.uniform3i(this.addr,e.x,e.y,e.z),t[0]=e.x,t[1]=e.y,t[2]=e.z);else{if(At(t,e))return;r.uniform3iv(this.addr,e),Dt(t,e)}}function J1(r,e){const t=this.cache;if(e.x!==void 0)(t[0]!==e.x||t[1]!==e.y||t[2]!==e.z||t[3]!==e.w)&&(r.uniform4i(this.addr,e.x,e.y,e.z,e.w),t[0]=e.x,t[1]=e.y,t[2]=e.z,t[3]=e.w);else{if(At(t,e))return;r.uniform4iv(this.addr,e),Dt(t,e)}}function Q1(r,e){const t=this.cache;t[0]!==e&&(r.uniform1ui(this.addr,e),t[0]=e)}function $1(r,e){const t=this.cache;if(e.x!==void 0)(t[0]!==e.x||t[1]!==e.y)&&(r.uniform2ui(this.addr,e.x,e.y),t[0]=e.x,t[1]=e.y);else{if(At(t,e))return;r.uniform2uiv(this.addr,e),Dt(t,e)}}function eb(r,e){const t=this.cache;if(e.x!==void 0)(t[0]!==e.x||t[1]!==e.y||t[2]!==e.z)&&(r.uniform3ui(this.addr,e.x,e.y,e.z),t[0]=e.x,t[1]=e.y,t[2]=e.z);else{if(At(t,e))return;r.uniform3uiv(this.addr,e),Dt(t,e)}}function tb(r,e){const t=this.cache;if(e.x!==void 0)(t[0]!==e.x||t[1]!==e.y||t[2]!==e.z||t[3]!==e.w)&&(r.uniform4ui(this.addr,e.x,e.y,e.z,e.w),t[0]=e.x,t[1]=e.y,t[2]=e.z,t[3]=e.w);else{if(At(t,e))return;r.uniform4uiv(this.addr,e),Dt(t,e)}}function nb(r,e,t){const n=this.cache,i=t.allocateTextureUnit();n[0]!==i&&(r.uniform1i(this.addr,i),n[0]=i),t.setTexture2D(e||au,i)}function ib(r,e,t){const n=this.cache,i=t.allocateTextureUnit();n[0]!==i&&(r.uniform1i(this.addr,i),n[0]=i),t.setTexture3D(e||lu,i)}function rb(r,e,t){const n=this.cache,i=t.allocateTextureUnit();n[0]!==i&&(r.uniform1i(this.addr,i),n[0]=i),t.setTextureCube(e||cu,i)}function sb(r,e,t){const n=this.cache,i=t.allocateTextureUnit();n[0]!==i&&(r.uniform1i(this.addr,i),n[0]=i),t.setTexture2DArray(e||ou,i)}function ab(r){switch(r){case 5126:return V1;case 35664:return G1;case 35665:return H1;case 35666:return W1;case 35674:return X1;case 35675:return j1;case 35676:return q1;case 5124:case 35670:return Y1;case 35667:case 35671:return Z1;case 35668:case 35672:return K1;case 35669:case 35673:return J1;case 5125:return Q1;case 36294:return $1;case 36295:return eb;case 36296:return tb;case 35678:case 36198:case 36298:case 36306:case 35682:return nb;case 35679:case 36299:case 36307:return ib;case 35680:case 36300:case 36308:case 36293:return rb;case 36289:case 36303:case 36311:case 36292:return sb}}function ob(r,e){r.uniform1fv(this.addr,e)}function lb(r,e){const t=qi(e,this.size,2);r.uniform2fv(this.addr,t)}function cb(r,e){const t=qi(e,this.size,3);r.uniform3fv(this.addr,t)}function ub(r,e){const t=qi(e,this.size,4);r.uniform4fv(this.addr,t)}function fb(r,e){const t=qi(e,this.size,4);r.uniformMatrix2fv(this.addr,!1,t)}function db(r,e){const t=qi(e,this.size,9);r.uniformMatrix3fv(this.addr,!1,t)}function hb(r,e){const t=qi(e,this.size,16);r.uniformMatrix4fv(this.addr,!1,t)}function pb(r,e){r.uniform1iv(this.addr,e)}function mb(r,e){r.uniform2iv(this.addr,e)}function _b(r,e){r.uniform3iv(this.addr,e)}function gb(r,e){r.uniform4iv(this.addr,e)}function bb(r,e){r.uniform1uiv(this.addr,e)}function vb(r,e){r.uniform2uiv(this.addr,e)}function yb(r,e){r.uniform3uiv(this.addr,e)}function wb(r,e){r.uniform4uiv(this.addr,e)}function Mb(r,e,t){const n=this.cache,i=e.length,s=vs(t,i);At(n,s)||(r.uniform1iv(this.addr,s),Dt(n,s));for(let a=0;a!==i;++a)t.setTexture2D(e[a]||au,s[a])}function xb(r,e,t){const n=this.cache,i=e.length,s=vs(t,i);At(n,s)||(r.uniform1iv(this.addr,s),Dt(n,s));for(let a=0;a!==i;++a)t.setTexture3D(e[a]||lu,s[a])}function Sb(r,e,t){const n=this.cache,i=e.length,s=vs(t,i);At(n,s)||(r.uniform1iv(this.addr,s),Dt(n,s));for(let a=0;a!==i;++a)t.setTextureCube(e[a]||cu,s[a])}function Cb(r,e,t){const n=this.cache,i=e.length,s=vs(t,i);At(n,s)||(r.uniform1iv(this.addr,s),Dt(n,s));for(let a=0;a!==i;++a)t.setTexture2DArray(e[a]||ou,s[a])}function Tb(r){switch(r){case 5126:return ob;case 35664:return lb;case 35665:return cb;case 35666:return ub;case 35674:return fb;case 35675:return db;case 35676:return hb;case 5124:case 35670:return pb;case 35667:case 35671:return mb;case 35668:case 35672:return _b;case 35669:case 35673:return gb;case 5125:return bb;case 36294:return vb;case 36295:return yb;case 36296:return wb;case 35678:case 36198:case 36298:case 36306:case 35682:return Mb;case 35679:case 36299:case 36307:return xb;case 35680:case 36300:case 36308:case 36293:return Sb;case 36289:case 36303:case 36311:case 36292:return Cb}}class Eb{constructor(e,t,n){this.id=e,this.addr=n,this.cache=[],this.setValue=ab(t.type)}}class Lb{constructor(e,t,n){this.id=e,this.addr=n,this.cache=[],this.size=t.size,this.setValue=Tb(t.type)}}class Pb{constructor(e){this.id=e,this.seq=[],this.map={}}setValue(e,t,n){const i=this.seq;for(let s=0,a=i.length;s!==a;++s){const o=i[s];o.setValue(e,t[o.id],n)}}}const ea=/(\w+)(\])?(\[|\.)?/g;function ic(r,e){r.seq.push(e),r.map[e.id]=e}function Ab(r,e,t){const n=r.name,i=n.length;for(ea.lastIndex=0;;){const s=ea.exec(n),a=ea.lastIndex;let o=s[1];const l=s[2]==="]",c=s[3];if(l&&(o=o|0),c===void 0||c==="["&&a+2===i){ic(t,c===void 0?new Eb(o,r,e):new Lb(o,r,e));break}else{let f=t.map[o];f===void 0&&(f=new Pb(o),ic(t,f)),t=f}}}class ts{constructor(e,t){this.seq=[],this.map={};const n=e.getProgramParameter(t,35718);for(let i=0;i<n;++i){const s=e.getActiveUniform(t,i),a=e.getUniformLocation(t,s.name);Ab(s,a,this)}}setValue(e,t,n,i){const s=this.map[t];s!==void 0&&s.setValue(e,n,i)}setOptional(e,t,n){const i=t[n];i!==void 0&&this.setValue(e,n,i)}static upload(e,t,n,i){for(let s=0,a=t.length;s!==a;++s){const o=t[s],l=n[o.id];l.needsUpdate!==!1&&o.setValue(e,l.value,i)}}static seqWithValue(e,t){const n=[];for(let i=0,s=e.length;i!==s;++i){const a=e[i];a.id in t&&n.push(a)}return n}}function rc(r,e,t){const n=r.createShader(e);return r.shaderSource(n,t),r.compileShader(n),n}let Db=0;function Rb(r,e){const t=r.split(`
`),n=[],i=Math.max(e-6,0),s=Math.min(e+6,t.length);for(let a=i;a<s;a++){const o=a+1;n.push(`${o===e?">":" "} ${o}: ${t[a]}`)}return n.join(`
`)}function kb(r){switch(r){case hi:return["Linear","( value )"];case pt:return["sRGB","( value )"];default:return console.warn("THREE.WebGLProgram: Unsupported encoding:",r),["Linear","( value )"]}}function sc(r,e,t){const n=r.getShaderParameter(e,35713),i=r.getShaderInfoLog(e).trim();if(n&&i==="")return"";const s=/ERROR: 0:(\d+)/.exec(i);if(s){const a=parseInt(s[1]);return t.toUpperCase()+`

`+i+`

`+Rb(r.getShaderSource(e),a)}else return i}function Ib(r,e){const t=kb(e);return"vec4 "+r+"( vec4 value ) { return LinearTo"+t[0]+t[1]+"; }"}function Nb(r,e){let t;switch(e){case Rm:t="Linear";break;case km:t="Reinhard";break;case Im:t="OptimizedCineon";break;case Nm:t="ACESFilmic";break;case zm:t="Custom";break;default:console.warn("THREE.WebGLProgram: Unsupported toneMapping:",e),t="Linear"}return"vec3 "+r+"( vec3 color ) { return "+t+"ToneMapping( color ); }"}function zb(r){return[r.extensionDerivatives||!!r.envMapCubeUVHeight||r.bumpMap||r.tangentSpaceNormalMap||r.clearcoatNormalMap||r.flatShading||r.shaderID==="physical"?"#extension GL_OES_standard_derivatives : enable":"",(r.extensionFragDepth||r.logarithmicDepthBuffer)&&r.rendererExtensionFragDepth?"#extension GL_EXT_frag_depth : enable":"",r.extensionDrawBuffers&&r.rendererExtensionDrawBuffers?"#extension GL_EXT_draw_buffers : require":"",(r.extensionShaderTextureLOD||r.envMap||r.transmission)&&r.rendererExtensionShaderTextureLod?"#extension GL_EXT_shader_texture_lod : enable":""].filter(lr).join(`
`)}function Fb(r){const e=[];for(const t in r){const n=r[t];n!==!1&&e.push("#define "+t+" "+n)}return e.join(`
`)}function Ob(r,e){const t={},n=r.getProgramParameter(e,35721);for(let i=0;i<n;i++){const s=r.getActiveAttrib(e,i),a=s.name;let o=1;s.type===35674&&(o=2),s.type===35675&&(o=3),s.type===35676&&(o=4),t[a]={type:s.type,location:r.getAttribLocation(e,a),locationSize:o}}return t}function lr(r){return r!==""}function ac(r,e){const t=e.numSpotLightShadows+e.numSpotLightMaps-e.numSpotLightShadowsWithMaps;return r.replace(/NUM_DIR_LIGHTS/g,e.numDirLights).replace(/NUM_SPOT_LIGHTS/g,e.numSpotLights).replace(/NUM_SPOT_LIGHT_MAPS/g,e.numSpotLightMaps).replace(/NUM_SPOT_LIGHT_COORDS/g,t).replace(/NUM_RECT_AREA_LIGHTS/g,e.numRectAreaLights).replace(/NUM_POINT_LIGHTS/g,e.numPointLights).replace(/NUM_HEMI_LIGHTS/g,e.numHemiLights).replace(/NUM_DIR_LIGHT_SHADOWS/g,e.numDirLightShadows).replace(/NUM_SPOT_LIGHT_SHADOWS_WITH_MAPS/g,e.numSpotLightShadowsWithMaps).replace(/NUM_SPOT_LIGHT_SHADOWS/g,e.numSpotLightShadows).replace(/NUM_POINT_LIGHT_SHADOWS/g,e.numPointLightShadows)}function oc(r,e){return r.replace(/NUM_CLIPPING_PLANES/g,e.numClippingPlanes).replace(/UNION_CLIPPING_PLANES/g,e.numClippingPlanes-e.numClipIntersection)}const Ub=/^[ \t]*#include +<([\w\d./]+)>/gm;function ma(r){return r.replace(Ub,Bb)}function Bb(r,e){const t=Ze[e];if(t===void 0)throw new Error("Can not resolve #include <"+e+">");return ma(t)}const Vb=/#pragma unroll_loop_start\s+for\s*\(\s*int\s+i\s*=\s*(\d+)\s*;\s*i\s*<\s*(\d+)\s*;\s*i\s*\+\+\s*\)\s*{([\s\S]+?)}\s+#pragma unroll_loop_end/g;function lc(r){return r.replace(Vb,Gb)}function Gb(r,e,t,n){let i="";for(let s=parseInt(e);s<parseInt(t);s++)i+=n.replace(/\[\s*i\s*\]/g,"[ "+s+" ]").replace(/UNROLLED_LOOP_INDEX/g,s);return i}function cc(r){let e="precision "+r.precision+` float;
precision `+r.precision+" int;";return r.precision==="highp"?e+=`
#define HIGH_PRECISION`:r.precision==="mediump"?e+=`
#define MEDIUM_PRECISION`:r.precision==="lowp"&&(e+=`
#define LOW_PRECISION`),e}function Hb(r){let e="SHADOWMAP_TYPE_BASIC";return r.shadowMapType===Bc?e="SHADOWMAP_TYPE_PCF":r.shadowMapType===um?e="SHADOWMAP_TYPE_PCF_SOFT":r.shadowMapType===ar&&(e="SHADOWMAP_TYPE_VSM"),e}function Wb(r){let e="ENVMAP_TYPE_CUBE";if(r.envMap)switch(r.envMapMode){case Bi:case Vi:e="ENVMAP_TYPE_CUBE";break;case ms:e="ENVMAP_TYPE_CUBE_UV";break}return e}function Xb(r){let e="ENVMAP_MODE_REFLECTION";if(r.envMap)switch(r.envMapMode){case Vi:e="ENVMAP_MODE_REFRACTION";break}return e}function jb(r){let e="ENVMAP_BLENDING_NONE";if(r.envMap)switch(r.combine){case Hc:e="ENVMAP_BLENDING_MULTIPLY";break;case Am:e="ENVMAP_BLENDING_MIX";break;case Dm:e="ENVMAP_BLENDING_ADD";break}return e}function qb(r){const e=r.envMapCubeUVHeight;if(e===null)return null;const t=Math.log2(e)-2,n=1/e;return{texelWidth:1/(3*Math.max(Math.pow(2,t),7*16)),texelHeight:n,maxMip:t}}function Yb(r,e,t,n){const i=r.getContext(),s=t.defines;let a=t.vertexShader,o=t.fragmentShader;const l=Hb(t),c=Wb(t),u=Xb(t),f=jb(t),d=qb(t),p=t.isWebGL2?"":zb(t),m=Fb(s),h=i.createProgram();let _,g,v=t.glslVersion?"#version "+t.glslVersion+`
`:"";t.isRawShaderMaterial?(_=[m].filter(lr).join(`
`),_.length>0&&(_+=`
`),g=[p,m].filter(lr).join(`
`),g.length>0&&(g+=`
`)):(_=[cc(t),"#define SHADER_NAME "+t.shaderName,m,t.instancing?"#define USE_INSTANCING":"",t.instancingColor?"#define USE_INSTANCING_COLOR":"",t.supportsVertexTextures?"#define VERTEX_TEXTURES":"",t.useFog&&t.fog?"#define USE_FOG":"",t.useFog&&t.fogExp2?"#define FOG_EXP2":"",t.map?"#define USE_MAP":"",t.envMap?"#define USE_ENVMAP":"",t.envMap?"#define "+u:"",t.lightMap?"#define USE_LIGHTMAP":"",t.aoMap?"#define USE_AOMAP":"",t.emissiveMap?"#define USE_EMISSIVEMAP":"",t.bumpMap?"#define USE_BUMPMAP":"",t.normalMap?"#define USE_NORMALMAP":"",t.normalMap&&t.objectSpaceNormalMap?"#define OBJECTSPACE_NORMALMAP":"",t.normalMap&&t.tangentSpaceNormalMap?"#define TANGENTSPACE_NORMALMAP":"",t.clearcoatMap?"#define USE_CLEARCOATMAP":"",t.clearcoatRoughnessMap?"#define USE_CLEARCOAT_ROUGHNESSMAP":"",t.clearcoatNormalMap?"#define USE_CLEARCOAT_NORMALMAP":"",t.iridescenceMap?"#define USE_IRIDESCENCEMAP":"",t.iridescenceThicknessMap?"#define USE_IRIDESCENCE_THICKNESSMAP":"",t.displacementMap&&t.supportsVertexTextures?"#define USE_DISPLACEMENTMAP":"",t.specularMap?"#define USE_SPECULARMAP":"",t.specularIntensityMap?"#define USE_SPECULARINTENSITYMAP":"",t.specularColorMap?"#define USE_SPECULARCOLORMAP":"",t.roughnessMap?"#define USE_ROUGHNESSMAP":"",t.metalnessMap?"#define USE_METALNESSMAP":"",t.alphaMap?"#define USE_ALPHAMAP":"",t.transmission?"#define USE_TRANSMISSION":"",t.transmissionMap?"#define USE_TRANSMISSIONMAP":"",t.thicknessMap?"#define USE_THICKNESSMAP":"",t.sheenColorMap?"#define USE_SHEENCOLORMAP":"",t.sheenRoughnessMap?"#define USE_SHEENROUGHNESSMAP":"",t.vertexTangents?"#define USE_TANGENT":"",t.vertexColors?"#define USE_COLOR":"",t.vertexAlphas?"#define USE_COLOR_ALPHA":"",t.vertexUvs?"#define USE_UV":"",t.uvsVertexOnly?"#define UVS_VERTEX_ONLY":"",t.flatShading?"#define FLAT_SHADED":"",t.skinning?"#define USE_SKINNING":"",t.morphTargets?"#define USE_MORPHTARGETS":"",t.morphNormals&&t.flatShading===!1?"#define USE_MORPHNORMALS":"",t.morphColors&&t.isWebGL2?"#define USE_MORPHCOLORS":"",t.morphTargetsCount>0&&t.isWebGL2?"#define MORPHTARGETS_TEXTURE":"",t.morphTargetsCount>0&&t.isWebGL2?"#define MORPHTARGETS_TEXTURE_STRIDE "+t.morphTextureStride:"",t.morphTargetsCount>0&&t.isWebGL2?"#define MORPHTARGETS_COUNT "+t.morphTargetsCount:"",t.doubleSided?"#define DOUBLE_SIDED":"",t.flipSided?"#define FLIP_SIDED":"",t.shadowMapEnabled?"#define USE_SHADOWMAP":"",t.shadowMapEnabled?"#define "+l:"",t.sizeAttenuation?"#define USE_SIZEATTENUATION":"",t.logarithmicDepthBuffer?"#define USE_LOGDEPTHBUF":"",t.logarithmicDepthBuffer&&t.rendererExtensionFragDepth?"#define USE_LOGDEPTHBUF_EXT":"","uniform mat4 modelMatrix;","uniform mat4 modelViewMatrix;","uniform mat4 projectionMatrix;","uniform mat4 viewMatrix;","uniform mat3 normalMatrix;","uniform vec3 cameraPosition;","uniform bool isOrthographic;","#ifdef USE_INSTANCING","	attribute mat4 instanceMatrix;","#endif","#ifdef USE_INSTANCING_COLOR","	attribute vec3 instanceColor;","#endif","attribute vec3 position;","attribute vec3 normal;","attribute vec2 uv;","#ifdef USE_TANGENT","	attribute vec4 tangent;","#endif","#if defined( USE_COLOR_ALPHA )","	attribute vec4 color;","#elif defined( USE_COLOR )","	attribute vec3 color;","#endif","#if ( defined( USE_MORPHTARGETS ) && ! defined( MORPHTARGETS_TEXTURE ) )","	attribute vec3 morphTarget0;","	attribute vec3 morphTarget1;","	attribute vec3 morphTarget2;","	attribute vec3 morphTarget3;","	#ifdef USE_MORPHNORMALS","		attribute vec3 morphNormal0;","		attribute vec3 morphNormal1;","		attribute vec3 morphNormal2;","		attribute vec3 morphNormal3;","	#else","		attribute vec3 morphTarget4;","		attribute vec3 morphTarget5;","		attribute vec3 morphTarget6;","		attribute vec3 morphTarget7;","	#endif","#endif","#ifdef USE_SKINNING","	attribute vec4 skinIndex;","	attribute vec4 skinWeight;","#endif",`
`].filter(lr).join(`
`),g=[p,cc(t),"#define SHADER_NAME "+t.shaderName,m,t.useFog&&t.fog?"#define USE_FOG":"",t.useFog&&t.fogExp2?"#define FOG_EXP2":"",t.map?"#define USE_MAP":"",t.matcap?"#define USE_MATCAP":"",t.envMap?"#define USE_ENVMAP":"",t.envMap?"#define "+c:"",t.envMap?"#define "+u:"",t.envMap?"#define "+f:"",d?"#define CUBEUV_TEXEL_WIDTH "+d.texelWidth:"",d?"#define CUBEUV_TEXEL_HEIGHT "+d.texelHeight:"",d?"#define CUBEUV_MAX_MIP "+d.maxMip+".0":"",t.lightMap?"#define USE_LIGHTMAP":"",t.aoMap?"#define USE_AOMAP":"",t.emissiveMap?"#define USE_EMISSIVEMAP":"",t.bumpMap?"#define USE_BUMPMAP":"",t.normalMap?"#define USE_NORMALMAP":"",t.normalMap&&t.objectSpaceNormalMap?"#define OBJECTSPACE_NORMALMAP":"",t.normalMap&&t.tangentSpaceNormalMap?"#define TANGENTSPACE_NORMALMAP":"",t.clearcoat?"#define USE_CLEARCOAT":"",t.clearcoatMap?"#define USE_CLEARCOATMAP":"",t.clearcoatRoughnessMap?"#define USE_CLEARCOAT_ROUGHNESSMAP":"",t.clearcoatNormalMap?"#define USE_CLEARCOAT_NORMALMAP":"",t.iridescence?"#define USE_IRIDESCENCE":"",t.iridescenceMap?"#define USE_IRIDESCENCEMAP":"",t.iridescenceThicknessMap?"#define USE_IRIDESCENCE_THICKNESSMAP":"",t.specularMap?"#define USE_SPECULARMAP":"",t.specularIntensityMap?"#define USE_SPECULARINTENSITYMAP":"",t.specularColorMap?"#define USE_SPECULARCOLORMAP":"",t.roughnessMap?"#define USE_ROUGHNESSMAP":"",t.metalnessMap?"#define USE_METALNESSMAP":"",t.alphaMap?"#define USE_ALPHAMAP":"",t.alphaTest?"#define USE_ALPHATEST":"",t.sheen?"#define USE_SHEEN":"",t.sheenColorMap?"#define USE_SHEENCOLORMAP":"",t.sheenRoughnessMap?"#define USE_SHEENROUGHNESSMAP":"",t.transmission?"#define USE_TRANSMISSION":"",t.transmissionMap?"#define USE_TRANSMISSIONMAP":"",t.thicknessMap?"#define USE_THICKNESSMAP":"",t.decodeVideoTexture?"#define DECODE_VIDEO_TEXTURE":"",t.vertexTangents?"#define USE_TANGENT":"",t.vertexColors||t.instancingColor?"#define USE_COLOR":"",t.vertexAlphas?"#define USE_COLOR_ALPHA":"",t.vertexUvs?"#define USE_UV":"",t.uvsVertexOnly?"#define UVS_VERTEX_ONLY":"",t.gradientMap?"#define USE_GRADIENTMAP":"",t.flatShading?"#define FLAT_SHADED":"",t.doubleSided?"#define DOUBLE_SIDED":"",t.flipSided?"#define FLIP_SIDED":"",t.shadowMapEnabled?"#define USE_SHADOWMAP":"",t.shadowMapEnabled?"#define "+l:"",t.premultipliedAlpha?"#define PREMULTIPLIED_ALPHA":"",t.useLegacyLights?"#define LEGACY_LIGHTS":"",t.logarithmicDepthBuffer?"#define USE_LOGDEPTHBUF":"",t.logarithmicDepthBuffer&&t.rendererExtensionFragDepth?"#define USE_LOGDEPTHBUF_EXT":"","uniform mat4 viewMatrix;","uniform vec3 cameraPosition;","uniform bool isOrthographic;",t.toneMapping!==Un?"#define TONE_MAPPING":"",t.toneMapping!==Un?Ze.tonemapping_pars_fragment:"",t.toneMapping!==Un?Nb("toneMapping",t.toneMapping):"",t.dithering?"#define DITHERING":"",t.opaque?"#define OPAQUE":"",Ze.encodings_pars_fragment,Ib("linearToOutputTexel",t.outputEncoding),t.useDepthPacking?"#define DEPTH_PACKING "+t.depthPacking:"",`
`].filter(lr).join(`
`)),a=ma(a),a=ac(a,t),a=oc(a,t),o=ma(o),o=ac(o,t),o=oc(o,t),a=lc(a),o=lc(o),t.isWebGL2&&t.isRawShaderMaterial!==!0&&(v=`#version 300 es
`,_=["precision mediump sampler2DArray;","#define attribute in","#define varying out","#define texture2D texture"].join(`
`)+`
`+_,g=["#define varying in",t.glslVersion===Rl?"":"layout(location = 0) out highp vec4 pc_fragColor;",t.glslVersion===Rl?"":"#define gl_FragColor pc_fragColor","#define gl_FragDepthEXT gl_FragDepth","#define texture2D texture","#define textureCube texture","#define texture2DProj textureProj","#define texture2DLodEXT textureLod","#define texture2DProjLodEXT textureProjLod","#define textureCubeLodEXT textureLod","#define texture2DGradEXT textureGrad","#define texture2DProjGradEXT textureProjGrad","#define textureCubeGradEXT textureGrad"].join(`
`)+`
`+g);const b=v+_+a,w=v+g+o,y=rc(i,35633,b),x=rc(i,35632,w);if(i.attachShader(h,y),i.attachShader(h,x),t.index0AttributeName!==void 0?i.bindAttribLocation(h,0,t.index0AttributeName):t.morphTargets===!0&&i.bindAttribLocation(h,0,"position"),i.linkProgram(h),r.debug.checkShaderErrors){const T=i.getProgramInfoLog(h).trim(),R=i.getShaderInfoLog(y).trim(),k=i.getShaderInfoLog(x).trim();let G=!0,F=!0;if(i.getProgramParameter(h,35714)===!1){G=!1;const O=sc(i,y,"vertex"),X=sc(i,x,"fragment");console.error("THREE.WebGLProgram: Shader Error "+i.getError()+" - VALIDATE_STATUS "+i.getProgramParameter(h,35715)+`

Program Info Log: `+T+`
`+O+`
`+X)}else T!==""?console.warn("THREE.WebGLProgram: Program Info Log:",T):(R===""||k==="")&&(F=!1);F&&(this.diagnostics={runnable:G,programLog:T,vertexShader:{log:R,prefix:_},fragmentShader:{log:k,prefix:g}})}i.deleteShader(y),i.deleteShader(x);let S;this.getUniforms=function(){return S===void 0&&(S=new ts(i,h)),S};let M;return this.getAttributes=function(){return M===void 0&&(M=Ob(i,h)),M},this.destroy=function(){n.releaseStatesOfProgram(this),i.deleteProgram(h),this.program=void 0},this.name=t.shaderName,this.id=Db++,this.cacheKey=e,this.usedTimes=1,this.program=h,this.vertexShader=y,this.fragmentShader=x,this}let Zb=0;class Kb{constructor(){this.shaderCache=new Map,this.materialCache=new Map}update(e){const t=e.vertexShader,n=e.fragmentShader,i=this._getShaderStage(t),s=this._getShaderStage(n),a=this._getShaderCacheForMaterial(e);return a.has(i)===!1&&(a.add(i),i.usedTimes++),a.has(s)===!1&&(a.add(s),s.usedTimes++),this}remove(e){const t=this.materialCache.get(e);for(const n of t)n.usedTimes--,n.usedTimes===0&&this.shaderCache.delete(n.code);return this.materialCache.delete(e),this}getVertexShaderID(e){return this._getShaderStage(e.vertexShader).id}getFragmentShaderID(e){return this._getShaderStage(e.fragmentShader).id}dispose(){this.shaderCache.clear(),this.materialCache.clear()}_getShaderCacheForMaterial(e){const t=this.materialCache;let n=t.get(e);return n===void 0&&(n=new Set,t.set(e,n)),n}_getShaderStage(e){const t=this.shaderCache;let n=t.get(e);return n===void 0&&(n=new Jb(e),t.set(e,n)),n}}class Jb{constructor(e){this.id=Zb++,this.code=e,this.usedTimes=0}}function Qb(r,e,t,n,i,s,a){const o=new xa,l=new Kb,c=[],u=i.isWebGL2,f=i.logarithmicDepthBuffer,d=i.vertexTextures;let p=i.precision;const m={MeshDepthMaterial:"depth",MeshDistanceMaterial:"distanceRGBA",MeshNormalMaterial:"normal",MeshBasicMaterial:"basic",MeshLambertMaterial:"lambert",MeshPhongMaterial:"phong",MeshToonMaterial:"toon",MeshStandardMaterial:"physical",MeshPhysicalMaterial:"physical",MeshMatcapMaterial:"matcap",LineBasicMaterial:"basic",LineDashedMaterial:"dashed",PointsMaterial:"points",ShadowMaterial:"shadow",SpriteMaterial:"sprite"};function h(M,T,R,k,G){const F=k.fog,O=G.geometry,X=M.isMeshStandardMaterial?k.environment:null,le=(M.isMeshStandardMaterial?t:e).get(M.envMap||X),ce=!!le&&le.mapping===ms?le.image.height:null,te=m[M.type];M.precision!==null&&(p=i.getMaxPrecision(M.precision),p!==M.precision&&console.warn("THREE.WebGLProgram.getParameters:",M.precision,"not supported, using",p,"instead."));const ne=O.morphAttributes.position||O.morphAttributes.normal||O.morphAttributes.color,ue=ne!==void 0?ne.length:0;let be=0;O.morphAttributes.position!==void 0&&(be=1),O.morphAttributes.normal!==void 0&&(be=2),O.morphAttributes.color!==void 0&&(be=3);let q,ae,he,W;if(te){const ke=Sn[te];q=ke.vertexShader,ae=ke.fragmentShader}else q=M.vertexShader,ae=M.fragmentShader,l.update(M),he=l.getVertexShaderID(M),W=l.getFragmentShaderID(M);const xe=r.getRenderTarget(),ye=M.alphaTest>0,Ee=M.clearcoat>0,Ce=M.iridescence>0;return{isWebGL2:u,shaderID:te,shaderName:M.type,vertexShader:q,fragmentShader:ae,defines:M.defines,customVertexShaderID:he,customFragmentShaderID:W,isRawShaderMaterial:M.isRawShaderMaterial===!0,glslVersion:M.glslVersion,precision:p,instancing:G.isInstancedMesh===!0,instancingColor:G.isInstancedMesh===!0&&G.instanceColor!==null,supportsVertexTextures:d,outputEncoding:xe===null?r.outputEncoding:xe.isXRRenderTarget===!0?xe.texture.encoding:hi,map:!!M.map,matcap:!!M.matcap,envMap:!!le,envMapMode:le&&le.mapping,envMapCubeUVHeight:ce,lightMap:!!M.lightMap,aoMap:!!M.aoMap,emissiveMap:!!M.emissiveMap,bumpMap:!!M.bumpMap,normalMap:!!M.normalMap,objectSpaceNormalMap:M.normalMapType===n_,tangentSpaceNormalMap:M.normalMapType===t_,decodeVideoTexture:!!M.map&&M.map.isVideoTexture===!0&&M.map.encoding===pt,clearcoat:Ee,clearcoatMap:Ee&&!!M.clearcoatMap,clearcoatRoughnessMap:Ee&&!!M.clearcoatRoughnessMap,clearcoatNormalMap:Ee&&!!M.clearcoatNormalMap,iridescence:Ce,iridescenceMap:Ce&&!!M.iridescenceMap,iridescenceThicknessMap:Ce&&!!M.iridescenceThicknessMap,displacementMap:!!M.displacementMap,roughnessMap:!!M.roughnessMap,metalnessMap:!!M.metalnessMap,specularMap:!!M.specularMap,specularIntensityMap:!!M.specularIntensityMap,specularColorMap:!!M.specularColorMap,opaque:M.transparent===!1&&M.blending===Ni,alphaMap:!!M.alphaMap,alphaTest:ye,gradientMap:!!M.gradientMap,sheen:M.sheen>0,sheenColorMap:!!M.sheenColorMap,sheenRoughnessMap:!!M.sheenRoughnessMap,transmission:M.transmission>0,transmissionMap:!!M.transmissionMap,thicknessMap:!!M.thicknessMap,combine:M.combine,vertexTangents:!!M.normalMap&&!!O.attributes.tangent,vertexColors:M.vertexColors,vertexAlphas:M.vertexColors===!0&&!!O.attributes.color&&O.attributes.color.itemSize===4,vertexUvs:!!M.map||!!M.bumpMap||!!M.normalMap||!!M.specularMap||!!M.alphaMap||!!M.emissiveMap||!!M.roughnessMap||!!M.metalnessMap||!!M.clearcoatMap||!!M.clearcoatRoughnessMap||!!M.clearcoatNormalMap||!!M.iridescenceMap||!!M.iridescenceThicknessMap||!!M.displacementMap||!!M.transmissionMap||!!M.thicknessMap||!!M.specularIntensityMap||!!M.specularColorMap||!!M.sheenColorMap||!!M.sheenRoughnessMap,uvsVertexOnly:!(!!M.map||!!M.bumpMap||!!M.normalMap||!!M.specularMap||!!M.alphaMap||!!M.emissiveMap||!!M.roughnessMap||!!M.metalnessMap||!!M.clearcoatNormalMap||!!M.iridescenceMap||!!M.iridescenceThicknessMap||M.transmission>0||!!M.transmissionMap||!!M.thicknessMap||!!M.specularIntensityMap||!!M.specularColorMap||M.sheen>0||!!M.sheenColorMap||!!M.sheenRoughnessMap)&&!!M.displacementMap,fog:!!F,useFog:M.fog===!0,fogExp2:F&&F.isFogExp2,flatShading:!!M.flatShading,sizeAttenuation:M.sizeAttenuation,logarithmicDepthBuffer:f,skinning:G.isSkinnedMesh===!0,morphTargets:O.morphAttributes.position!==void 0,morphNormals:O.morphAttributes.normal!==void 0,morphColors:O.morphAttributes.color!==void 0,morphTargetsCount:ue,morphTextureStride:be,numDirLights:T.directional.length,numPointLights:T.point.length,numSpotLights:T.spot.length,numSpotLightMaps:T.spotLightMap.length,numRectAreaLights:T.rectArea.length,numHemiLights:T.hemi.length,numDirLightShadows:T.directionalShadowMap.length,numPointLightShadows:T.pointShadowMap.length,numSpotLightShadows:T.spotShadowMap.length,numSpotLightShadowsWithMaps:T.numSpotLightShadowsWithMaps,numClippingPlanes:a.numPlanes,numClipIntersection:a.numIntersection,dithering:M.dithering,shadowMapEnabled:r.shadowMap.enabled&&R.length>0,shadowMapType:r.shadowMap.type,toneMapping:M.toneMapped?r.toneMapping:Un,useLegacyLights:r.useLegacyLights,premultipliedAlpha:M.premultipliedAlpha,doubleSided:M.side===zn,flipSided:M.side===an,useDepthPacking:!!M.depthPacking,depthPacking:M.depthPacking||0,index0AttributeName:M.index0AttributeName,extensionDerivatives:M.extensions&&M.extensions.derivatives,extensionFragDepth:M.extensions&&M.extensions.fragDepth,extensionDrawBuffers:M.extensions&&M.extensions.drawBuffers,extensionShaderTextureLOD:M.extensions&&M.extensions.shaderTextureLOD,rendererExtensionFragDepth:u||n.has("EXT_frag_depth"),rendererExtensionDrawBuffers:u||n.has("WEBGL_draw_buffers"),rendererExtensionShaderTextureLod:u||n.has("EXT_shader_texture_lod"),customProgramCacheKey:M.customProgramCacheKey()}}function _(M){const T=[];if(M.shaderID?T.push(M.shaderID):(T.push(M.customVertexShaderID),T.push(M.customFragmentShaderID)),M.defines!==void 0)for(const R in M.defines)T.push(R),T.push(M.defines[R]);return M.isRawShaderMaterial===!1&&(g(T,M),v(T,M),T.push(r.outputEncoding)),T.push(M.customProgramCacheKey),T.join()}function g(M,T){M.push(T.precision),M.push(T.outputEncoding),M.push(T.envMapMode),M.push(T.envMapCubeUVHeight),M.push(T.combine),M.push(T.vertexUvs),M.push(T.fogExp2),M.push(T.sizeAttenuation),M.push(T.morphTargetsCount),M.push(T.morphAttributeCount),M.push(T.numDirLights),M.push(T.numPointLights),M.push(T.numSpotLights),M.push(T.numSpotLightMaps),M.push(T.numHemiLights),M.push(T.numRectAreaLights),M.push(T.numDirLightShadows),M.push(T.numPointLightShadows),M.push(T.numSpotLightShadows),M.push(T.numSpotLightShadowsWithMaps),M.push(T.shadowMapType),M.push(T.toneMapping),M.push(T.numClippingPlanes),M.push(T.numClipIntersection),M.push(T.depthPacking)}function v(M,T){o.disableAll(),T.isWebGL2&&o.enable(0),T.supportsVertexTextures&&o.enable(1),T.instancing&&o.enable(2),T.instancingColor&&o.enable(3),T.map&&o.enable(4),T.matcap&&o.enable(5),T.envMap&&o.enable(6),T.lightMap&&o.enable(7),T.aoMap&&o.enable(8),T.emissiveMap&&o.enable(9),T.bumpMap&&o.enable(10),T.normalMap&&o.enable(11),T.objectSpaceNormalMap&&o.enable(12),T.tangentSpaceNormalMap&&o.enable(13),T.clearcoat&&o.enable(14),T.clearcoatMap&&o.enable(15),T.clearcoatRoughnessMap&&o.enable(16),T.clearcoatNormalMap&&o.enable(17),T.iridescence&&o.enable(18),T.iridescenceMap&&o.enable(19),T.iridescenceThicknessMap&&o.enable(20),T.displacementMap&&o.enable(21),T.specularMap&&o.enable(22),T.roughnessMap&&o.enable(23),T.metalnessMap&&o.enable(24),T.gradientMap&&o.enable(25),T.alphaMap&&o.enable(26),T.alphaTest&&o.enable(27),T.vertexColors&&o.enable(28),T.vertexAlphas&&o.enable(29),T.vertexUvs&&o.enable(30),T.vertexTangents&&o.enable(31),T.uvsVertexOnly&&o.enable(32),M.push(o.mask),o.disableAll(),T.fog&&o.enable(0),T.useFog&&o.enable(1),T.flatShading&&o.enable(2),T.logarithmicDepthBuffer&&o.enable(3),T.skinning&&o.enable(4),T.morphTargets&&o.enable(5),T.morphNormals&&o.enable(6),T.morphColors&&o.enable(7),T.premultipliedAlpha&&o.enable(8),T.shadowMapEnabled&&o.enable(9),T.useLegacyLights&&o.enable(10),T.doubleSided&&o.enable(11),T.flipSided&&o.enable(12),T.useDepthPacking&&o.enable(13),T.dithering&&o.enable(14),T.specularIntensityMap&&o.enable(15),T.specularColorMap&&o.enable(16),T.transmission&&o.enable(17),T.transmissionMap&&o.enable(18),T.thicknessMap&&o.enable(19),T.sheen&&o.enable(20),T.sheenColorMap&&o.enable(21),T.sheenRoughnessMap&&o.enable(22),T.decodeVideoTexture&&o.enable(23),T.opaque&&o.enable(24),M.push(o.mask)}function b(M){const T=m[M.type];let R;if(T){const k=Sn[T];R=F_.clone(k.uniforms)}else R=M.uniforms;return R}function w(M,T){let R;for(let k=0,G=c.length;k<G;k++){const F=c[k];if(F.cacheKey===T){R=F,++R.usedTimes;break}}return R===void 0&&(R=new Yb(r,T,M,s),c.push(R)),R}function y(M){if(--M.usedTimes===0){const T=c.indexOf(M);c[T]=c[c.length-1],c.pop(),M.destroy()}}function x(M){l.remove(M)}function S(){l.dispose()}return{getParameters:h,getProgramCacheKey:_,getUniforms:b,acquireProgram:w,releaseProgram:y,releaseShaderCache:x,programs:c,dispose:S}}function $b(){let r=new WeakMap;function e(s){let a=r.get(s);return a===void 0&&(a={},r.set(s,a)),a}function t(s){r.delete(s)}function n(s,a,o){r.get(s)[a]=o}function i(){r=new WeakMap}return{get:e,remove:t,update:n,dispose:i}}function e2(r,e){return r.groupOrder!==e.groupOrder?r.groupOrder-e.groupOrder:r.renderOrder!==e.renderOrder?r.renderOrder-e.renderOrder:r.material.id!==e.material.id?r.material.id-e.material.id:r.z!==e.z?r.z-e.z:r.id-e.id}function uc(r,e){return r.groupOrder!==e.groupOrder?r.groupOrder-e.groupOrder:r.renderOrder!==e.renderOrder?r.renderOrder-e.renderOrder:r.z!==e.z?e.z-r.z:r.id-e.id}function fc(){const r=[];let e=0;const t=[],n=[],i=[];function s(){e=0,t.length=0,n.length=0,i.length=0}function a(f,d,p,m,h,_){let g=r[e];return g===void 0?(g={id:f.id,object:f,geometry:d,material:p,groupOrder:m,renderOrder:f.renderOrder,z:h,group:_},r[e]=g):(g.id=f.id,g.object=f,g.geometry=d,g.material=p,g.groupOrder=m,g.renderOrder=f.renderOrder,g.z=h,g.group=_),e++,g}function o(f,d,p,m,h,_){const g=a(f,d,p,m,h,_);p.transmission>0?n.push(g):p.transparent===!0?i.push(g):t.push(g)}function l(f,d,p,m,h,_){const g=a(f,d,p,m,h,_);p.transmission>0?n.unshift(g):p.transparent===!0?i.unshift(g):t.unshift(g)}function c(f,d){t.length>1&&t.sort(f||e2),n.length>1&&n.sort(d||uc),i.length>1&&i.sort(d||uc)}function u(){for(let f=e,d=r.length;f<d;f++){const p=r[f];if(p.id===null)break;p.id=null,p.object=null,p.geometry=null,p.material=null,p.group=null}}return{opaque:t,transmissive:n,transparent:i,init:s,push:o,unshift:l,finish:u,sort:c}}function t2(){let r=new WeakMap;function e(n,i){const s=r.get(n);let a;return s===void 0?(a=new fc,r.set(n,[a])):i>=s.length?(a=new fc,s.push(a)):a=s[i],a}function t(){r=new WeakMap}return{get:e,dispose:t}}function n2(){const r={};return{get:function(e){if(r[e.id]!==void 0)return r[e.id];let t;switch(e.type){case"DirectionalLight":t={direction:new V,color:new mt};break;case"SpotLight":t={position:new V,direction:new V,color:new mt,distance:0,coneCos:0,penumbraCos:0,decay:0};break;case"PointLight":t={position:new V,color:new mt,distance:0,decay:0};break;case"HemisphereLight":t={direction:new V,skyColor:new mt,groundColor:new mt};break;case"RectAreaLight":t={color:new mt,position:new V,halfWidth:new V,halfHeight:new V};break}return r[e.id]=t,t}}}function i2(){const r={};return{get:function(e){if(r[e.id]!==void 0)return r[e.id];let t;switch(e.type){case"DirectionalLight":t={shadowBias:0,shadowNormalBias:0,shadowRadius:1,shadowMapSize:new lt};break;case"SpotLight":t={shadowBias:0,shadowNormalBias:0,shadowRadius:1,shadowMapSize:new lt};break;case"PointLight":t={shadowBias:0,shadowNormalBias:0,shadowRadius:1,shadowMapSize:new lt,shadowCameraNear:1,shadowCameraFar:1e3};break}return r[e.id]=t,t}}}let r2=0;function s2(r,e){return(e.castShadow?2:0)-(r.castShadow?2:0)+(e.map?1:0)-(r.map?1:0)}function a2(r,e){const t=new n2,n=i2(),i={version:0,hash:{directionalLength:-1,pointLength:-1,spotLength:-1,rectAreaLength:-1,hemiLength:-1,numDirectionalShadows:-1,numPointShadows:-1,numSpotShadows:-1,numSpotMaps:-1},ambient:[0,0,0],probe:[],directional:[],directionalShadow:[],directionalShadowMap:[],directionalShadowMatrix:[],spot:[],spotLightMap:[],spotShadow:[],spotShadowMap:[],spotLightMatrix:[],rectArea:[],rectAreaLTC1:null,rectAreaLTC2:null,point:[],pointShadow:[],pointShadowMap:[],pointShadowMatrix:[],hemi:[],numSpotLightShadowsWithMaps:0};for(let u=0;u<9;u++)i.probe.push(new V);const s=new V,a=new Lt,o=new Lt;function l(u,f){let d=0,p=0,m=0;for(let k=0;k<9;k++)i.probe[k].set(0,0,0);let h=0,_=0,g=0,v=0,b=0,w=0,y=0,x=0,S=0,M=0;u.sort(s2);const T=f===!0?Math.PI:1;for(let k=0,G=u.length;k<G;k++){const F=u[k],O=F.color,X=F.intensity,le=F.distance,ce=F.shadow&&F.shadow.map?F.shadow.map.texture:null;if(F.isAmbientLight)d+=O.r*X*T,p+=O.g*X*T,m+=O.b*X*T;else if(F.isLightProbe)for(let te=0;te<9;te++)i.probe[te].addScaledVector(F.sh.coefficients[te],X);else if(F.isDirectionalLight){const te=t.get(F);if(te.color.copy(F.color).multiplyScalar(F.intensity*T),F.castShadow){const ne=F.shadow,ue=n.get(F);ue.shadowBias=ne.bias,ue.shadowNormalBias=ne.normalBias,ue.shadowRadius=ne.radius,ue.shadowMapSize=ne.mapSize,i.directionalShadow[h]=ue,i.directionalShadowMap[h]=ce,i.directionalShadowMatrix[h]=F.shadow.matrix,w++}i.directional[h]=te,h++}else if(F.isSpotLight){const te=t.get(F);te.position.setFromMatrixPosition(F.matrixWorld),te.color.copy(O).multiplyScalar(X*T),te.distance=le,te.coneCos=Math.cos(F.angle),te.penumbraCos=Math.cos(F.angle*(1-F.penumbra)),te.decay=F.decay,i.spot[g]=te;const ne=F.shadow;if(F.map&&(i.spotLightMap[S]=F.map,S++,ne.updateMatrices(F),F.castShadow&&M++),i.spotLightMatrix[g]=ne.matrix,F.castShadow){const ue=n.get(F);ue.shadowBias=ne.bias,ue.shadowNormalBias=ne.normalBias,ue.shadowRadius=ne.radius,ue.shadowMapSize=ne.mapSize,i.spotShadow[g]=ue,i.spotShadowMap[g]=ce,x++}g++}else if(F.isRectAreaLight){const te=t.get(F);te.color.copy(O).multiplyScalar(X),te.halfWidth.set(F.width*.5,0,0),te.halfHeight.set(0,F.height*.5,0),i.rectArea[v]=te,v++}else if(F.isPointLight){const te=t.get(F);if(te.color.copy(F.color).multiplyScalar(F.intensity*T),te.distance=F.distance,te.decay=F.decay,F.castShadow){const ne=F.shadow,ue=n.get(F);ue.shadowBias=ne.bias,ue.shadowNormalBias=ne.normalBias,ue.shadowRadius=ne.radius,ue.shadowMapSize=ne.mapSize,ue.shadowCameraNear=ne.camera.near,ue.shadowCameraFar=ne.camera.far,i.pointShadow[_]=ue,i.pointShadowMap[_]=ce,i.pointShadowMatrix[_]=F.shadow.matrix,y++}i.point[_]=te,_++}else if(F.isHemisphereLight){const te=t.get(F);te.skyColor.copy(F.color).multiplyScalar(X*T),te.groundColor.copy(F.groundColor).multiplyScalar(X*T),i.hemi[b]=te,b++}}v>0&&(e.isWebGL2||r.has("OES_texture_float_linear")===!0?(i.rectAreaLTC1=ge.LTC_FLOAT_1,i.rectAreaLTC2=ge.LTC_FLOAT_2):r.has("OES_texture_half_float_linear")===!0?(i.rectAreaLTC1=ge.LTC_HALF_1,i.rectAreaLTC2=ge.LTC_HALF_2):console.error("THREE.WebGLRenderer: Unable to use RectAreaLight. Missing WebGL extensions.")),i.ambient[0]=d,i.ambient[1]=p,i.ambient[2]=m;const R=i.hash;(R.directionalLength!==h||R.pointLength!==_||R.spotLength!==g||R.rectAreaLength!==v||R.hemiLength!==b||R.numDirectionalShadows!==w||R.numPointShadows!==y||R.numSpotShadows!==x||R.numSpotMaps!==S)&&(i.directional.length=h,i.spot.length=g,i.rectArea.length=v,i.point.length=_,i.hemi.length=b,i.directionalShadow.length=w,i.directionalShadowMap.length=w,i.pointShadow.length=y,i.pointShadowMap.length=y,i.spotShadow.length=x,i.spotShadowMap.length=x,i.directionalShadowMatrix.length=w,i.pointShadowMatrix.length=y,i.spotLightMatrix.length=x+S-M,i.spotLightMap.length=S,i.numSpotLightShadowsWithMaps=M,R.directionalLength=h,R.pointLength=_,R.spotLength=g,R.rectAreaLength=v,R.hemiLength=b,R.numDirectionalShadows=w,R.numPointShadows=y,R.numSpotShadows=x,R.numSpotMaps=S,i.version=r2++)}function c(u,f){let d=0,p=0,m=0,h=0,_=0;const g=f.matrixWorldInverse;for(let v=0,b=u.length;v<b;v++){const w=u[v];if(w.isDirectionalLight){const y=i.directional[d];y.direction.setFromMatrixPosition(w.matrixWorld),s.setFromMatrixPosition(w.target.matrixWorld),y.direction.sub(s),y.direction.transformDirection(g),d++}else if(w.isSpotLight){const y=i.spot[m];y.position.setFromMatrixPosition(w.matrixWorld),y.position.applyMatrix4(g),y.direction.setFromMatrixPosition(w.matrixWorld),s.setFromMatrixPosition(w.target.matrixWorld),y.direction.sub(s),y.direction.transformDirection(g),m++}else if(w.isRectAreaLight){const y=i.rectArea[h];y.position.setFromMatrixPosition(w.matrixWorld),y.position.applyMatrix4(g),o.identity(),a.copy(w.matrixWorld),a.premultiply(g),o.extractRotation(a),y.halfWidth.set(w.width*.5,0,0),y.halfHeight.set(0,w.height*.5,0),y.halfWidth.applyMatrix4(o),y.halfHeight.applyMatrix4(o),h++}else if(w.isPointLight){const y=i.point[p];y.position.setFromMatrixPosition(w.matrixWorld),y.position.applyMatrix4(g),p++}else if(w.isHemisphereLight){const y=i.hemi[_];y.direction.setFromMatrixPosition(w.matrixWorld),y.direction.transformDirection(g),_++}}}return{setup:l,setupView:c,state:i}}function dc(r,e){const t=new a2(r,e),n=[],i=[];function s(){n.length=0,i.length=0}function a(f){n.push(f)}function o(f){i.push(f)}function l(f){t.setup(n,f)}function c(f){t.setupView(n,f)}return{init:s,state:{lightsArray:n,shadowsArray:i,lights:t},setupLights:l,setupLightsView:c,pushLight:a,pushShadow:o}}function o2(r,e){let t=new WeakMap;function n(s,a=0){const o=t.get(s);let l;return o===void 0?(l=new dc(r,e),t.set(s,[l])):a>=o.length?(l=new dc(r,e),o.push(l)):l=o[a],l}function i(){t=new WeakMap}return{get:n,dispose:i}}class l2 extends Er{constructor(e){super(),this.isMeshDepthMaterial=!0,this.type="MeshDepthMaterial",this.depthPacking=$m,this.map=null,this.alphaMap=null,this.displacementMap=null,this.displacementScale=1,this.displacementBias=0,this.wireframe=!1,this.wireframeLinewidth=1,this.setValues(e)}copy(e){return super.copy(e),this.depthPacking=e.depthPacking,this.map=e.map,this.alphaMap=e.alphaMap,this.displacementMap=e.displacementMap,this.displacementScale=e.displacementScale,this.displacementBias=e.displacementBias,this.wireframe=e.wireframe,this.wireframeLinewidth=e.wireframeLinewidth,this}}class c2 extends Er{constructor(e){super(),this.isMeshDistanceMaterial=!0,this.type="MeshDistanceMaterial",this.referencePosition=new V,this.nearDistance=1,this.farDistance=1e3,this.map=null,this.alphaMap=null,this.displacementMap=null,this.displacementScale=1,this.displacementBias=0,this.setValues(e)}copy(e){return super.copy(e),this.referencePosition.copy(e.referencePosition),this.nearDistance=e.nearDistance,this.farDistance=e.farDistance,this.map=e.map,this.alphaMap=e.alphaMap,this.displacementMap=e.displacementMap,this.displacementScale=e.displacementScale,this.displacementBias=e.displacementBias,this}}const u2=`void main() {
	gl_Position = vec4( position, 1.0 );
}`,f2=`uniform sampler2D shadow_pass;
uniform vec2 resolution;
uniform float radius;
#include <packing>
void main() {
	const float samples = float( VSM_SAMPLES );
	float mean = 0.0;
	float squared_mean = 0.0;
	float uvStride = samples <= 1.0 ? 0.0 : 2.0 / ( samples - 1.0 );
	float uvStart = samples <= 1.0 ? 0.0 : - 1.0;
	for ( float i = 0.0; i < samples; i ++ ) {
		float uvOffset = uvStart + i * uvStride;
		#ifdef HORIZONTAL_PASS
			vec2 distribution = unpackRGBATo2Half( texture2D( shadow_pass, ( gl_FragCoord.xy + vec2( uvOffset, 0.0 ) * radius ) / resolution ) );
			mean += distribution.x;
			squared_mean += distribution.y * distribution.y + distribution.x * distribution.x;
		#else
			float depth = unpackRGBAToDepth( texture2D( shadow_pass, ( gl_FragCoord.xy + vec2( 0.0, uvOffset ) * radius ) / resolution ) );
			mean += depth;
			squared_mean += depth * depth;
		#endif
	}
	mean = mean / samples;
	squared_mean = squared_mean / samples;
	float std_dev = sqrt( squared_mean - mean * mean );
	gl_FragColor = pack2HalfToRGBA( vec2( mean, std_dev ) );
}`;function d2(r,e,t){let n=new ru;const i=new lt,s=new lt,a=new Ot,o=new l2({depthPacking:e_}),l=new c2,c={},u=t.maxTextureSize,f={[Zn]:an,[an]:Zn,[zn]:zn},d=new mi({defines:{VSM_SAMPLES:8},uniforms:{shadow_pass:{value:null},resolution:{value:new lt},radius:{value:4}},vertexShader:u2,fragmentShader:f2}),p=d.clone();p.defines.HORIZONTAL_PASS=1;const m=new en;m.setAttribute("position",new Cn(new Float32Array([-1,-1,.5,3,-1,.5,-1,3,.5]),3));const h=new Te(m,d),_=this;this.enabled=!1,this.autoUpdate=!0,this.needsUpdate=!1,this.type=Bc,this.render=function(w,y,x){if(_.enabled===!1||_.autoUpdate===!1&&_.needsUpdate===!1||w.length===0)return;const S=r.getRenderTarget(),M=r.getActiveCubeFace(),T=r.getActiveMipmapLevel(),R=r.state;R.setBlending(Yn),R.buffers.color.setClear(1,1,1,1),R.buffers.depth.setTest(!0),R.setScissorTest(!1);for(let k=0,G=w.length;k<G;k++){const F=w[k],O=F.shadow;if(O===void 0){console.warn("THREE.WebGLShadowMap:",F,"has no shadow.");continue}if(O.autoUpdate===!1&&O.needsUpdate===!1)continue;i.copy(O.mapSize);const X=O.getFrameExtents();if(i.multiply(X),s.copy(O.mapSize),(i.x>u||i.y>u)&&(i.x>u&&(s.x=Math.floor(u/X.x),i.x=s.x*X.x,O.mapSize.x=s.x),i.y>u&&(s.y=Math.floor(u/X.y),i.y=s.y*X.y,O.mapSize.y=s.y)),O.map===null){const ce=this.type!==ar?{minFilter:Yt,magFilter:Yt}:{};O.map=new pi(i.x,i.y,ce),O.map.texture.name=F.name+".shadowMap",O.camera.updateProjectionMatrix()}r.setRenderTarget(O.map),r.clear();const le=O.getViewportCount();for(let ce=0;ce<le;ce++){const te=O.getViewport(ce);a.set(s.x*te.x,s.y*te.y,s.x*te.z,s.y*te.w),R.viewport(a),O.updateMatrices(F,ce),n=O.getFrustum(),b(y,x,O.camera,F,this.type)}O.isPointLightShadow!==!0&&this.type===ar&&g(O,x),O.needsUpdate=!1}_.needsUpdate=!1,r.setRenderTarget(S,M,T)};function g(w,y){const x=e.update(h);d.defines.VSM_SAMPLES!==w.blurSamples&&(d.defines.VSM_SAMPLES=w.blurSamples,p.defines.VSM_SAMPLES=w.blurSamples,d.needsUpdate=!0,p.needsUpdate=!0),w.mapPass===null&&(w.mapPass=new pi(i.x,i.y)),d.uniforms.shadow_pass.value=w.map.texture,d.uniforms.resolution.value=w.mapSize,d.uniforms.radius.value=w.radius,r.setRenderTarget(w.mapPass),r.clear(),r.renderBufferDirect(y,null,x,d,h,null),p.uniforms.shadow_pass.value=w.mapPass.texture,p.uniforms.resolution.value=w.mapSize,p.uniforms.radius.value=w.radius,r.setRenderTarget(w.map),r.clear(),r.renderBufferDirect(y,null,x,p,h,null)}function v(w,y,x,S,M,T){let R=null;const k=x.isPointLight===!0?w.customDistanceMaterial:w.customDepthMaterial;if(k!==void 0)R=k;else if(R=x.isPointLight===!0?l:o,r.localClippingEnabled&&y.clipShadows===!0&&Array.isArray(y.clippingPlanes)&&y.clippingPlanes.length!==0||y.displacementMap&&y.displacementScale!==0||y.alphaMap&&y.alphaTest>0||y.map&&y.alphaTest>0){const G=R.uuid,F=y.uuid;let O=c[G];O===void 0&&(O={},c[G]=O);let X=O[F];X===void 0&&(X=R.clone(),O[F]=X),R=X}return R.visible=y.visible,R.wireframe=y.wireframe,T===ar?R.side=y.shadowSide!==null?y.shadowSide:y.side:R.side=y.shadowSide!==null?y.shadowSide:f[y.side],R.alphaMap=y.alphaMap,R.alphaTest=y.alphaTest,R.map=y.map,R.clipShadows=y.clipShadows,R.clippingPlanes=y.clippingPlanes,R.clipIntersection=y.clipIntersection,R.displacementMap=y.displacementMap,R.displacementScale=y.displacementScale,R.displacementBias=y.displacementBias,R.wireframeLinewidth=y.wireframeLinewidth,R.linewidth=y.linewidth,x.isPointLight===!0&&R.isMeshDistanceMaterial===!0&&(R.referencePosition.setFromMatrixPosition(x.matrixWorld),R.nearDistance=S,R.farDistance=M),R}function b(w,y,x,S,M){if(w.visible===!1)return;if(w.layers.test(y.layers)&&(w.isMesh||w.isLine||w.isPoints)&&(w.castShadow||w.receiveShadow&&M===ar)&&(!w.frustumCulled||n.intersectsObject(w))){w.modelViewMatrix.multiplyMatrices(x.matrixWorldInverse,w.matrixWorld);const k=e.update(w),G=w.material;if(Array.isArray(G)){const F=k.groups;for(let O=0,X=F.length;O<X;O++){const le=F[O],ce=G[le.materialIndex];if(ce&&ce.visible){const te=v(w,ce,S,x.near,x.far,M);r.renderBufferDirect(x,null,k,te,w,le)}}}else if(G.visible){const F=v(w,G,S,x.near,x.far,M);r.renderBufferDirect(x,null,k,F,w,null)}}const R=w.children;for(let k=0,G=R.length;k<G;k++)b(R[k],y,x,S,M)}}function h2(r,e,t){const n=t.isWebGL2;function i(){let N=!1;const Y=new Ot;let ie=null;const ve=new Ot(0,0,0,0);return{setMask:function(Ae){ie!==Ae&&!N&&(r.colorMask(Ae,Ae,Ae,Ae),ie=Ae)},setLocked:function(Ae){N=Ae},setClear:function(Ae,ht,Rt,Wt,vn){vn===!0&&(Ae*=Wt,ht*=Wt,Rt*=Wt),Y.set(Ae,ht,Rt,Wt),ve.equals(Y)===!1&&(r.clearColor(Ae,ht,Rt,Wt),ve.copy(Y))},reset:function(){N=!1,ie=null,ve.set(-1,0,0,0)}}}function s(){let N=!1,Y=null,ie=null,ve=null;return{setTest:function(Ae){Ae?ye(2929):Ee(2929)},setMask:function(Ae){Y!==Ae&&!N&&(r.depthMask(Ae),Y=Ae)},setFunc:function(Ae){if(ie!==Ae){switch(Ae){case xm:r.depthFunc(512);break;case Sm:r.depthFunc(519);break;case Cm:r.depthFunc(513);break;case la:r.depthFunc(515);break;case Tm:r.depthFunc(514);break;case Em:r.depthFunc(518);break;case Lm:r.depthFunc(516);break;case Pm:r.depthFunc(517);break;default:r.depthFunc(515)}ie=Ae}},setLocked:function(Ae){N=Ae},setClear:function(Ae){ve!==Ae&&(r.clearDepth(Ae),ve=Ae)},reset:function(){N=!1,Y=null,ie=null,ve=null}}}function a(){let N=!1,Y=null,ie=null,ve=null,Ae=null,ht=null,Rt=null,Wt=null,vn=null;return{setTest:function(Mt){N||(Mt?ye(2960):Ee(2960))},setMask:function(Mt){Y!==Mt&&!N&&(r.stencilMask(Mt),Y=Mt)},setFunc:function(Mt,cn,yn){(ie!==Mt||ve!==cn||Ae!==yn)&&(r.stencilFunc(Mt,cn,yn),ie=Mt,ve=cn,Ae=yn)},setOp:function(Mt,cn,yn){(ht!==Mt||Rt!==cn||Wt!==yn)&&(r.stencilOp(Mt,cn,yn),ht=Mt,Rt=cn,Wt=yn)},setLocked:function(Mt){N=Mt},setClear:function(Mt){vn!==Mt&&(r.clearStencil(Mt),vn=Mt)},reset:function(){N=!1,Y=null,ie=null,ve=null,Ae=null,ht=null,Rt=null,Wt=null,vn=null}}}const o=new i,l=new s,c=new a,u=new WeakMap,f=new WeakMap;let d={},p={},m=new WeakMap,h=[],_=null,g=!1,v=null,b=null,w=null,y=null,x=null,S=null,M=null,T=!1,R=null,k=null,G=null,F=null,O=null;const X=r.getParameter(35661);let le=!1,ce=0;const te=r.getParameter(7938);te.indexOf("WebGL")!==-1?(ce=parseFloat(/^WebGL (\d)/.exec(te)[1]),le=ce>=1):te.indexOf("OpenGL ES")!==-1&&(ce=parseFloat(/^OpenGL ES (\d)/.exec(te)[1]),le=ce>=2);let ne=null,ue={};const be=r.getParameter(3088),q=r.getParameter(2978),ae=new Ot().fromArray(be),he=new Ot().fromArray(q);function W(N,Y,ie){const ve=new Uint8Array(4),Ae=r.createTexture();r.bindTexture(N,Ae),r.texParameteri(N,10241,9728),r.texParameteri(N,10240,9728);for(let ht=0;ht<ie;ht++)r.texImage2D(Y+ht,0,6408,1,1,0,6408,5121,ve);return Ae}const xe={};xe[3553]=W(3553,3553,1),xe[34067]=W(34067,34069,6),o.setClear(0,0,0,1),l.setClear(1),c.setClear(0),ye(2929),l.setFunc(la),wt(!1),gt(tl),ye(2884),Ye(Yn);function ye(N){d[N]!==!0&&(r.enable(N),d[N]=!0)}function Ee(N){d[N]!==!1&&(r.disable(N),d[N]=!1)}function Ce(N,Y){return p[N]!==Y?(r.bindFramebuffer(N,Y),p[N]=Y,n&&(N===36009&&(p[36160]=Y),N===36160&&(p[36009]=Y)),!0):!1}function Ne(N,Y){let ie=h,ve=!1;if(N)if(ie=m.get(Y),ie===void 0&&(ie=[],m.set(Y,ie)),N.isWebGLMultipleRenderTargets){const Ae=N.texture;if(ie.length!==Ae.length||ie[0]!==36064){for(let ht=0,Rt=Ae.length;ht<Rt;ht++)ie[ht]=36064+ht;ie.length=Ae.length,ve=!0}}else ie[0]!==36064&&(ie[0]=36064,ve=!0);else ie[0]!==1029&&(ie[0]=1029,ve=!0);ve&&(t.isWebGL2?r.drawBuffers(ie):e.get("WEBGL_draw_buffers").drawBuffersWEBGL(ie))}function ke(N){return _!==N?(r.useProgram(N),_=N,!0):!1}const Ge={[Ai]:32774,[dm]:32778,[hm]:32779};if(n)Ge[sl]=32775,Ge[al]=32776;else{const N=e.get("EXT_blend_minmax");N!==null&&(Ge[sl]=N.MIN_EXT,Ge[al]=N.MAX_EXT)}const qe={[pm]:0,[mm]:1,[_m]:768,[Vc]:770,[Mm]:776,[ym]:774,[bm]:772,[gm]:769,[Gc]:771,[wm]:775,[vm]:773};function Ye(N,Y,ie,ve,Ae,ht,Rt,Wt){if(N===Yn){g===!0&&(Ee(3042),g=!1);return}if(g===!1&&(ye(3042),g=!0),N!==fm){if(N!==v||Wt!==T){if((b!==Ai||x!==Ai)&&(r.blendEquation(32774),b=Ai,x=Ai),Wt)switch(N){case Ni:r.blendFuncSeparate(1,771,1,771);break;case nl:r.blendFunc(1,1);break;case il:r.blendFuncSeparate(0,769,0,1);break;case rl:r.blendFuncSeparate(0,768,0,770);break;default:console.error("THREE.WebGLState: Invalid blending: ",N);break}else switch(N){case Ni:r.blendFuncSeparate(770,771,1,771);break;case nl:r.blendFunc(770,1);break;case il:r.blendFuncSeparate(0,769,0,1);break;case rl:r.blendFunc(0,768);break;default:console.error("THREE.WebGLState: Invalid blending: ",N);break}w=null,y=null,S=null,M=null,v=N,T=Wt}return}Ae=Ae||Y,ht=ht||ie,Rt=Rt||ve,(Y!==b||Ae!==x)&&(r.blendEquationSeparate(Ge[Y],Ge[Ae]),b=Y,x=Ae),(ie!==w||ve!==y||ht!==S||Rt!==M)&&(r.blendFuncSeparate(qe[ie],qe[ve],qe[ht],qe[Rt]),w=ie,y=ve,S=ht,M=Rt),v=N,T=!1}function rt(N,Y){N.side===zn?Ee(2884):ye(2884);let ie=N.side===an;Y&&(ie=!ie),wt(ie),N.blending===Ni&&N.transparent===!1?Ye(Yn):Ye(N.blending,N.blendEquation,N.blendSrc,N.blendDst,N.blendEquationAlpha,N.blendSrcAlpha,N.blendDstAlpha,N.premultipliedAlpha),l.setFunc(N.depthFunc),l.setTest(N.depthTest),l.setMask(N.depthWrite),o.setMask(N.colorWrite);const ve=N.stencilWrite;c.setTest(ve),ve&&(c.setMask(N.stencilWriteMask),c.setFunc(N.stencilFunc,N.stencilRef,N.stencilFuncMask),c.setOp(N.stencilFail,N.stencilZFail,N.stencilZPass)),ot(N.polygonOffset,N.polygonOffsetFactor,N.polygonOffsetUnits),N.alphaToCoverage===!0?ye(32926):Ee(32926)}function wt(N){R!==N&&(N?r.frontFace(2304):r.frontFace(2305),R=N)}function gt(N){N!==lm?(ye(2884),N!==k&&(N===tl?r.cullFace(1029):N===cm?r.cullFace(1028):r.cullFace(1032))):Ee(2884),k=N}function at(N){N!==G&&(le&&r.lineWidth(N),G=N)}function ot(N,Y,ie){N?(ye(32823),(F!==Y||O!==ie)&&(r.polygonOffset(Y,ie),F=Y,O=ie)):Ee(32823)}function Ht(N){N?ye(3089):Ee(3089)}function fe(N){N===void 0&&(N=33984+X-1),ne!==N&&(r.activeTexture(N),ne=N)}function L(N,Y,ie){ie===void 0&&(ne===null?ie=33984+X-1:ie=ne);let ve=ue[ie];ve===void 0&&(ve={type:void 0,texture:void 0},ue[ie]=ve),(ve.type!==N||ve.texture!==Y)&&(ne!==ie&&(r.activeTexture(ie),ne=ie),r.bindTexture(N,Y||xe[N]),ve.type=N,ve.texture=Y)}function C(){const N=ue[ne];N!==void 0&&N.type!==void 0&&(r.bindTexture(N.type,null),N.type=void 0,N.texture=void 0)}function K(){try{r.compressedTexImage2D.apply(r,arguments)}catch(N){console.error("THREE.WebGLState:",N)}}function de(){try{r.compressedTexImage3D.apply(r,arguments)}catch(N){console.error("THREE.WebGLState:",N)}}function me(){try{r.texSubImage2D.apply(r,arguments)}catch(N){console.error("THREE.WebGLState:",N)}}function we(){try{r.texSubImage3D.apply(r,arguments)}catch(N){console.error("THREE.WebGLState:",N)}}function Oe(){try{r.compressedTexSubImage2D.apply(r,arguments)}catch(N){console.error("THREE.WebGLState:",N)}}function Se(){try{r.compressedTexSubImage3D.apply(r,arguments)}catch(N){console.error("THREE.WebGLState:",N)}}function oe(){try{r.texStorage2D.apply(r,arguments)}catch(N){console.error("THREE.WebGLState:",N)}}function Be(){try{r.texStorage3D.apply(r,arguments)}catch(N){console.error("THREE.WebGLState:",N)}}function Le(){try{r.texImage2D.apply(r,arguments)}catch(N){console.error("THREE.WebGLState:",N)}}function Fe(){try{r.texImage3D.apply(r,arguments)}catch(N){console.error("THREE.WebGLState:",N)}}function Me(N){ae.equals(N)===!1&&(r.scissor(N.x,N.y,N.z,N.w),ae.copy(N))}function Ie(N){he.equals(N)===!1&&(r.viewport(N.x,N.y,N.z,N.w),he.copy(N))}function Ve(N,Y){let ie=f.get(Y);ie===void 0&&(ie=new WeakMap,f.set(Y,ie));let ve=ie.get(N);ve===void 0&&(ve=r.getUniformBlockIndex(Y,N.name),ie.set(N,ve))}function st(N,Y){const ve=f.get(Y).get(N);u.get(Y)!==ve&&(r.uniformBlockBinding(Y,ve,N.__bindingPointIndex),u.set(Y,ve))}function nt(){r.disable(3042),r.disable(2884),r.disable(2929),r.disable(32823),r.disable(3089),r.disable(2960),r.disable(32926),r.blendEquation(32774),r.blendFunc(1,0),r.blendFuncSeparate(1,0,1,0),r.colorMask(!0,!0,!0,!0),r.clearColor(0,0,0,0),r.depthMask(!0),r.depthFunc(513),r.clearDepth(1),r.stencilMask(4294967295),r.stencilFunc(519,0,4294967295),r.stencilOp(7680,7680,7680),r.clearStencil(0),r.cullFace(1029),r.frontFace(2305),r.polygonOffset(0,0),r.activeTexture(33984),r.bindFramebuffer(36160,null),n===!0&&(r.bindFramebuffer(36009,null),r.bindFramebuffer(36008,null)),r.useProgram(null),r.lineWidth(1),r.scissor(0,0,r.canvas.width,r.canvas.height),r.viewport(0,0,r.canvas.width,r.canvas.height),d={},ne=null,ue={},p={},m=new WeakMap,h=[],_=null,g=!1,v=null,b=null,w=null,y=null,x=null,S=null,M=null,T=!1,R=null,k=null,G=null,F=null,O=null,ae.set(0,0,r.canvas.width,r.canvas.height),he.set(0,0,r.canvas.width,r.canvas.height),o.reset(),l.reset(),c.reset()}return{buffers:{color:o,depth:l,stencil:c},enable:ye,disable:Ee,bindFramebuffer:Ce,drawBuffers:Ne,useProgram:ke,setBlending:Ye,setMaterial:rt,setFlipSided:wt,setCullFace:gt,setLineWidth:at,setPolygonOffset:ot,setScissorTest:Ht,activeTexture:fe,bindTexture:L,unbindTexture:C,compressedTexImage2D:K,compressedTexImage3D:de,texImage2D:Le,texImage3D:Fe,updateUBOMapping:Ve,uniformBlockBinding:st,texStorage2D:oe,texStorage3D:Be,texSubImage2D:me,texSubImage3D:we,compressedTexSubImage2D:Oe,compressedTexSubImage3D:Se,scissor:Me,viewport:Ie,reset:nt}}function p2(r,e,t,n,i,s,a){const o=i.isWebGL2,l=i.maxTextures,c=i.maxCubemapSize,u=i.maxTextureSize,f=i.maxSamples,d=e.has("WEBGL_multisampled_render_to_texture")?e.get("WEBGL_multisampled_render_to_texture"):null,p=typeof navigator>"u"?!1:/OculusBrowser/g.test(navigator.userAgent),m=new WeakMap;let h;const _=new WeakMap;let g=!1;try{g=typeof OffscreenCanvas<"u"&&new OffscreenCanvas(1,1).getContext("2d")!==null}catch{}function v(L,C){return g?new OffscreenCanvas(L,C):ds("canvas")}function b(L,C,K,de){let me=1;if((L.width>de||L.height>de)&&(me=de/Math.max(L.width,L.height)),me<1||C===!0)if(typeof HTMLImageElement<"u"&&L instanceof HTMLImageElement||typeof HTMLCanvasElement<"u"&&L instanceof HTMLCanvasElement||typeof ImageBitmap<"u"&&L instanceof ImageBitmap){const we=C?qc:Math.floor,Oe=we(me*L.width),Se=we(me*L.height);h===void 0&&(h=v(Oe,Se));const oe=K?v(Oe,Se):h;return oe.width=Oe,oe.height=Se,oe.getContext("2d").drawImage(L,0,0,Oe,Se),console.warn("THREE.WebGLRenderer: Texture has been resized from ("+L.width+"x"+L.height+") to ("+Oe+"x"+Se+")."),oe}else return"data"in L&&console.warn("THREE.WebGLRenderer: Image in DataTexture is too big ("+L.width+"x"+L.height+")."),L;return L}function w(L){return pa(L.width)&&pa(L.height)}function y(L){return o?!1:L.wrapS!==_n||L.wrapT!==_n||L.minFilter!==Yt&&L.minFilter!==fn}function x(L,C){return L.generateMipmaps&&C&&L.minFilter!==Yt&&L.minFilter!==fn}function S(L){r.generateMipmap(L)}function M(L,C,K,de,me=!1){if(o===!1)return C;if(L!==null){if(r[L]!==void 0)return r[L];console.warn("THREE.WebGLRenderer: Attempt to use non-existing WebGL internal format '"+L+"'")}let we=C;return C===6403&&(K===5126&&(we=33326),K===5131&&(we=33325),K===5121&&(we=33321)),C===33319&&(K===5126&&(we=33328),K===5131&&(we=33327),K===5121&&(we=33323)),C===6408&&(K===5126&&(we=34836),K===5131&&(we=34842),K===5121&&(we=de===pt&&me===!1?35907:32856),K===32819&&(we=32854),K===32820&&(we=32855)),(we===33325||we===33326||we===33327||we===33328||we===34842||we===34836)&&e.get("EXT_color_buffer_float"),we}function T(L,C,K){return x(L,K)===!0||L.isFramebufferTexture&&L.minFilter!==Yt&&L.minFilter!==fn?Math.log2(Math.max(C.width,C.height))+1:L.mipmaps!==void 0&&L.mipmaps.length>0?L.mipmaps.length:L.isCompressedTexture&&Array.isArray(L.image)?C.mipmaps.length:1}function R(L){return L===Yt||L===ol||L===Ts?9728:9729}function k(L){const C=L.target;C.removeEventListener("dispose",k),F(C),C.isVideoTexture&&m.delete(C)}function G(L){const C=L.target;C.removeEventListener("dispose",G),X(C)}function F(L){const C=n.get(L);if(C.__webglInit===void 0)return;const K=L.source,de=_.get(K);if(de){const me=de[C.__cacheKey];me.usedTimes--,me.usedTimes===0&&O(L),Object.keys(de).length===0&&_.delete(K)}n.remove(L)}function O(L){const C=n.get(L);r.deleteTexture(C.__webglTexture);const K=L.source,de=_.get(K);delete de[C.__cacheKey],a.memory.textures--}function X(L){const C=L.texture,K=n.get(L),de=n.get(C);if(de.__webglTexture!==void 0&&(r.deleteTexture(de.__webglTexture),a.memory.textures--),L.depthTexture&&L.depthTexture.dispose(),L.isWebGLCubeRenderTarget)for(let me=0;me<6;me++)r.deleteFramebuffer(K.__webglFramebuffer[me]),K.__webglDepthbuffer&&r.deleteRenderbuffer(K.__webglDepthbuffer[me]);else{if(r.deleteFramebuffer(K.__webglFramebuffer),K.__webglDepthbuffer&&r.deleteRenderbuffer(K.__webglDepthbuffer),K.__webglMultisampledFramebuffer&&r.deleteFramebuffer(K.__webglMultisampledFramebuffer),K.__webglColorRenderbuffer)for(let me=0;me<K.__webglColorRenderbuffer.length;me++)K.__webglColorRenderbuffer[me]&&r.deleteRenderbuffer(K.__webglColorRenderbuffer[me]);K.__webglDepthRenderbuffer&&r.deleteRenderbuffer(K.__webglDepthRenderbuffer)}if(L.isWebGLMultipleRenderTargets)for(let me=0,we=C.length;me<we;me++){const Oe=n.get(C[me]);Oe.__webglTexture&&(r.deleteTexture(Oe.__webglTexture),a.memory.textures--),n.remove(C[me])}n.remove(C),n.remove(L)}let le=0;function ce(){le=0}function te(){const L=le;return L>=l&&console.warn("THREE.WebGLTextures: Trying to use "+L+" texture units while this GPU supports only "+l),le+=1,L}function ne(L){const C=[];return C.push(L.wrapS),C.push(L.wrapT),C.push(L.wrapR||0),C.push(L.magFilter),C.push(L.minFilter),C.push(L.anisotropy),C.push(L.internalFormat),C.push(L.format),C.push(L.type),C.push(L.generateMipmaps),C.push(L.premultiplyAlpha),C.push(L.flipY),C.push(L.unpackAlignment),C.push(L.encoding),C.join()}function ue(L,C){const K=n.get(L);if(L.isVideoTexture&&Ht(L),L.isRenderTargetTexture===!1&&L.version>0&&K.__version!==L.version){const de=L.image;if(de===null)console.warn("THREE.WebGLRenderer: Texture marked for update but no image data found.");else if(de.complete===!1)console.warn("THREE.WebGLRenderer: Texture marked for update but image is incomplete");else{Ee(K,L,C);return}}t.bindTexture(3553,K.__webglTexture,33984+C)}function be(L,C){const K=n.get(L);if(L.version>0&&K.__version!==L.version){Ee(K,L,C);return}t.bindTexture(35866,K.__webglTexture,33984+C)}function q(L,C){const K=n.get(L);if(L.version>0&&K.__version!==L.version){Ee(K,L,C);return}t.bindTexture(32879,K.__webglTexture,33984+C)}function ae(L,C){const K=n.get(L);if(L.version>0&&K.__version!==L.version){Ce(K,L,C);return}t.bindTexture(34067,K.__webglTexture,33984+C)}const he={[fa]:10497,[_n]:33071,[da]:33648},W={[Yt]:9728,[ol]:9984,[Ts]:9986,[fn]:9729,[Fm]:9985,[br]:9987};function xe(L,C,K){if(K?(r.texParameteri(L,10242,he[C.wrapS]),r.texParameteri(L,10243,he[C.wrapT]),(L===32879||L===35866)&&r.texParameteri(L,32882,he[C.wrapR]),r.texParameteri(L,10240,W[C.magFilter]),r.texParameteri(L,10241,W[C.minFilter])):(r.texParameteri(L,10242,33071),r.texParameteri(L,10243,33071),(L===32879||L===35866)&&r.texParameteri(L,32882,33071),(C.wrapS!==_n||C.wrapT!==_n)&&console.warn("THREE.WebGLRenderer: Texture is not power of two. Texture.wrapS and Texture.wrapT should be set to THREE.ClampToEdgeWrapping."),r.texParameteri(L,10240,R(C.magFilter)),r.texParameteri(L,10241,R(C.minFilter)),C.minFilter!==Yt&&C.minFilter!==fn&&console.warn("THREE.WebGLRenderer: Texture is not power of two. Texture.minFilter should be set to THREE.NearestFilter or THREE.LinearFilter.")),e.has("EXT_texture_filter_anisotropic")===!0){const de=e.get("EXT_texture_filter_anisotropic");if(C.magFilter===Yt||C.minFilter!==Ts&&C.minFilter!==br||C.type===ci&&e.has("OES_texture_float_linear")===!1||o===!1&&C.type===vr&&e.has("OES_texture_half_float_linear")===!1)return;(C.anisotropy>1||n.get(C).__currentAnisotropy)&&(r.texParameterf(L,de.TEXTURE_MAX_ANISOTROPY_EXT,Math.min(C.anisotropy,i.getMaxAnisotropy())),n.get(C).__currentAnisotropy=C.anisotropy)}}function ye(L,C){let K=!1;L.__webglInit===void 0&&(L.__webglInit=!0,C.addEventListener("dispose",k));const de=C.source;let me=_.get(de);me===void 0&&(me={},_.set(de,me));const we=ne(C);if(we!==L.__cacheKey){me[we]===void 0&&(me[we]={texture:r.createTexture(),usedTimes:0},a.memory.textures++,K=!0),me[we].usedTimes++;const Oe=me[L.__cacheKey];Oe!==void 0&&(me[L.__cacheKey].usedTimes--,Oe.usedTimes===0&&O(C)),L.__cacheKey=we,L.__webglTexture=me[we].texture}return K}function Ee(L,C,K){let de=3553;(C.isDataArrayTexture||C.isCompressedArrayTexture)&&(de=35866),C.isData3DTexture&&(de=32879);const me=ye(L,C),we=C.source;t.bindTexture(de,L.__webglTexture,33984+K);const Oe=n.get(we);if(we.version!==Oe.__version||me===!0){t.activeTexture(33984+K),r.pixelStorei(37440,C.flipY),r.pixelStorei(37441,C.premultiplyAlpha),r.pixelStorei(3317,C.unpackAlignment),r.pixelStorei(37443,0);const Se=y(C)&&w(C.image)===!1;let oe=b(C.image,Se,!1,u);oe=fe(C,oe);const Be=w(oe)||o,Le=s.convert(C.format,C.encoding);let Fe=s.convert(C.type),Me=M(C.internalFormat,Le,Fe,C.encoding,C.isVideoTexture);xe(de,C,Be);let Ie;const Ve=C.mipmaps,st=o&&C.isVideoTexture!==!0,nt=Oe.__version===void 0||me===!0,N=T(C,oe,Be);if(C.isDepthTexture)Me=6402,o?C.type===ci?Me=36012:C.type===li?Me=33190:C.type===zi?Me=35056:Me=33189:C.type===ci&&console.error("WebGLRenderer: Floating point depth texture requires WebGL2."),C.format===ui&&Me===6402&&C.type!==Xc&&C.type!==li&&(console.warn("THREE.WebGLRenderer: Use UnsignedShortType or UnsignedIntType for DepthFormat DepthTexture."),C.type=li,Fe=s.convert(C.type)),C.format===Gi&&Me===6402&&(Me=34041,C.type!==zi&&(console.warn("THREE.WebGLRenderer: Use UnsignedInt248Type for DepthStencilFormat DepthTexture."),C.type=zi,Fe=s.convert(C.type))),nt&&(st?t.texStorage2D(3553,1,Me,oe.width,oe.height):t.texImage2D(3553,0,Me,oe.width,oe.height,0,Le,Fe,null));else if(C.isDataTexture)if(Ve.length>0&&Be){st&&nt&&t.texStorage2D(3553,N,Me,Ve[0].width,Ve[0].height);for(let Y=0,ie=Ve.length;Y<ie;Y++)Ie=Ve[Y],st?t.texSubImage2D(3553,Y,0,0,Ie.width,Ie.height,Le,Fe,Ie.data):t.texImage2D(3553,Y,Me,Ie.width,Ie.height,0,Le,Fe,Ie.data);C.generateMipmaps=!1}else st?(nt&&t.texStorage2D(3553,N,Me,oe.width,oe.height),t.texSubImage2D(3553,0,0,0,oe.width,oe.height,Le,Fe,oe.data)):t.texImage2D(3553,0,Me,oe.width,oe.height,0,Le,Fe,oe.data);else if(C.isCompressedTexture)if(C.isCompressedArrayTexture){st&&nt&&t.texStorage3D(35866,N,Me,Ve[0].width,Ve[0].height,oe.depth);for(let Y=0,ie=Ve.length;Y<ie;Y++)Ie=Ve[Y],C.format!==gn?Le!==null?st?t.compressedTexSubImage3D(35866,Y,0,0,0,Ie.width,Ie.height,oe.depth,Le,Ie.data,0,0):t.compressedTexImage3D(35866,Y,Me,Ie.width,Ie.height,oe.depth,0,Ie.data,0,0):console.warn("THREE.WebGLRenderer: Attempt to load unsupported compressed texture format in .uploadTexture()"):st?t.texSubImage3D(35866,Y,0,0,0,Ie.width,Ie.height,oe.depth,Le,Fe,Ie.data):t.texImage3D(35866,Y,Me,Ie.width,Ie.height,oe.depth,0,Le,Fe,Ie.data)}else{st&&nt&&t.texStorage2D(3553,N,Me,Ve[0].width,Ve[0].height);for(let Y=0,ie=Ve.length;Y<ie;Y++)Ie=Ve[Y],C.format!==gn?Le!==null?st?t.compressedTexSubImage2D(3553,Y,0,0,Ie.width,Ie.height,Le,Ie.data):t.compressedTexImage2D(3553,Y,Me,Ie.width,Ie.height,0,Ie.data):console.warn("THREE.WebGLRenderer: Attempt to load unsupported compressed texture format in .uploadTexture()"):st?t.texSubImage2D(3553,Y,0,0,Ie.width,Ie.height,Le,Fe,Ie.data):t.texImage2D(3553,Y,Me,Ie.width,Ie.height,0,Le,Fe,Ie.data)}else if(C.isDataArrayTexture)st?(nt&&t.texStorage3D(35866,N,Me,oe.width,oe.height,oe.depth),t.texSubImage3D(35866,0,0,0,0,oe.width,oe.height,oe.depth,Le,Fe,oe.data)):t.texImage3D(35866,0,Me,oe.width,oe.height,oe.depth,0,Le,Fe,oe.data);else if(C.isData3DTexture)st?(nt&&t.texStorage3D(32879,N,Me,oe.width,oe.height,oe.depth),t.texSubImage3D(32879,0,0,0,0,oe.width,oe.height,oe.depth,Le,Fe,oe.data)):t.texImage3D(32879,0,Me,oe.width,oe.height,oe.depth,0,Le,Fe,oe.data);else if(C.isFramebufferTexture){if(nt)if(st)t.texStorage2D(3553,N,Me,oe.width,oe.height);else{let Y=oe.width,ie=oe.height;for(let ve=0;ve<N;ve++)t.texImage2D(3553,ve,Me,Y,ie,0,Le,Fe,null),Y>>=1,ie>>=1}}else if(Ve.length>0&&Be){st&&nt&&t.texStorage2D(3553,N,Me,Ve[0].width,Ve[0].height);for(let Y=0,ie=Ve.length;Y<ie;Y++)Ie=Ve[Y],st?t.texSubImage2D(3553,Y,0,0,Le,Fe,Ie):t.texImage2D(3553,Y,Me,Le,Fe,Ie);C.generateMipmaps=!1}else st?(nt&&t.texStorage2D(3553,N,Me,oe.width,oe.height),t.texSubImage2D(3553,0,0,0,Le,Fe,oe)):t.texImage2D(3553,0,Me,Le,Fe,oe);x(C,Be)&&S(de),Oe.__version=we.version,C.onUpdate&&C.onUpdate(C)}L.__version=C.version}function Ce(L,C,K){if(C.image.length!==6)return;const de=ye(L,C),me=C.source;t.bindTexture(34067,L.__webglTexture,33984+K);const we=n.get(me);if(me.version!==we.__version||de===!0){t.activeTexture(33984+K),r.pixelStorei(37440,C.flipY),r.pixelStorei(37441,C.premultiplyAlpha),r.pixelStorei(3317,C.unpackAlignment),r.pixelStorei(37443,0);const Oe=C.isCompressedTexture||C.image[0].isCompressedTexture,Se=C.image[0]&&C.image[0].isDataTexture,oe=[];for(let Y=0;Y<6;Y++)!Oe&&!Se?oe[Y]=b(C.image[Y],!1,!0,c):oe[Y]=Se?C.image[Y].image:C.image[Y],oe[Y]=fe(C,oe[Y]);const Be=oe[0],Le=w(Be)||o,Fe=s.convert(C.format,C.encoding),Me=s.convert(C.type),Ie=M(C.internalFormat,Fe,Me,C.encoding),Ve=o&&C.isVideoTexture!==!0,st=we.__version===void 0||de===!0;let nt=T(C,Be,Le);xe(34067,C,Le);let N;if(Oe){Ve&&st&&t.texStorage2D(34067,nt,Ie,Be.width,Be.height);for(let Y=0;Y<6;Y++){N=oe[Y].mipmaps;for(let ie=0;ie<N.length;ie++){const ve=N[ie];C.format!==gn?Fe!==null?Ve?t.compressedTexSubImage2D(34069+Y,ie,0,0,ve.width,ve.height,Fe,ve.data):t.compressedTexImage2D(34069+Y,ie,Ie,ve.width,ve.height,0,ve.data):console.warn("THREE.WebGLRenderer: Attempt to load unsupported compressed texture format in .setTextureCube()"):Ve?t.texSubImage2D(34069+Y,ie,0,0,ve.width,ve.height,Fe,Me,ve.data):t.texImage2D(34069+Y,ie,Ie,ve.width,ve.height,0,Fe,Me,ve.data)}}}else{N=C.mipmaps,Ve&&st&&(N.length>0&&nt++,t.texStorage2D(34067,nt,Ie,oe[0].width,oe[0].height));for(let Y=0;Y<6;Y++)if(Se){Ve?t.texSubImage2D(34069+Y,0,0,0,oe[Y].width,oe[Y].height,Fe,Me,oe[Y].data):t.texImage2D(34069+Y,0,Ie,oe[Y].width,oe[Y].height,0,Fe,Me,oe[Y].data);for(let ie=0;ie<N.length;ie++){const Ae=N[ie].image[Y].image;Ve?t.texSubImage2D(34069+Y,ie+1,0,0,Ae.width,Ae.height,Fe,Me,Ae.data):t.texImage2D(34069+Y,ie+1,Ie,Ae.width,Ae.height,0,Fe,Me,Ae.data)}}else{Ve?t.texSubImage2D(34069+Y,0,0,0,Fe,Me,oe[Y]):t.texImage2D(34069+Y,0,Ie,Fe,Me,oe[Y]);for(let ie=0;ie<N.length;ie++){const ve=N[ie];Ve?t.texSubImage2D(34069+Y,ie+1,0,0,Fe,Me,ve.image[Y]):t.texImage2D(34069+Y,ie+1,Ie,Fe,Me,ve.image[Y])}}}x(C,Le)&&S(34067),we.__version=me.version,C.onUpdate&&C.onUpdate(C)}L.__version=C.version}function Ne(L,C,K,de,me){const we=s.convert(K.format,K.encoding),Oe=s.convert(K.type),Se=M(K.internalFormat,we,Oe,K.encoding);n.get(C).__hasExternalTextures||(me===32879||me===35866?t.texImage3D(me,0,Se,C.width,C.height,C.depth,0,we,Oe,null):t.texImage2D(me,0,Se,C.width,C.height,0,we,Oe,null)),t.bindFramebuffer(36160,L),ot(C)?d.framebufferTexture2DMultisampleEXT(36160,de,me,n.get(K).__webglTexture,0,at(C)):(me===3553||me>=34069&&me<=34074)&&r.framebufferTexture2D(36160,de,me,n.get(K).__webglTexture,0),t.bindFramebuffer(36160,null)}function ke(L,C,K){if(r.bindRenderbuffer(36161,L),C.depthBuffer&&!C.stencilBuffer){let de=33189;if(K||ot(C)){const me=C.depthTexture;me&&me.isDepthTexture&&(me.type===ci?de=36012:me.type===li&&(de=33190));const we=at(C);ot(C)?d.renderbufferStorageMultisampleEXT(36161,we,de,C.width,C.height):r.renderbufferStorageMultisample(36161,we,de,C.width,C.height)}else r.renderbufferStorage(36161,de,C.width,C.height);r.framebufferRenderbuffer(36160,36096,36161,L)}else if(C.depthBuffer&&C.stencilBuffer){const de=at(C);K&&ot(C)===!1?r.renderbufferStorageMultisample(36161,de,35056,C.width,C.height):ot(C)?d.renderbufferStorageMultisampleEXT(36161,de,35056,C.width,C.height):r.renderbufferStorage(36161,34041,C.width,C.height),r.framebufferRenderbuffer(36160,33306,36161,L)}else{const de=C.isWebGLMultipleRenderTargets===!0?C.texture:[C.texture];for(let me=0;me<de.length;me++){const we=de[me],Oe=s.convert(we.format,we.encoding),Se=s.convert(we.type),oe=M(we.internalFormat,Oe,Se,we.encoding),Be=at(C);K&&ot(C)===!1?r.renderbufferStorageMultisample(36161,Be,oe,C.width,C.height):ot(C)?d.renderbufferStorageMultisampleEXT(36161,Be,oe,C.width,C.height):r.renderbufferStorage(36161,oe,C.width,C.height)}}r.bindRenderbuffer(36161,null)}function Ge(L,C){if(C&&C.isWebGLCubeRenderTarget)throw new Error("Depth Texture with cube render targets is not supported");if(t.bindFramebuffer(36160,L),!(C.depthTexture&&C.depthTexture.isDepthTexture))throw new Error("renderTarget.depthTexture must be an instance of THREE.DepthTexture");(!n.get(C.depthTexture).__webglTexture||C.depthTexture.image.width!==C.width||C.depthTexture.image.height!==C.height)&&(C.depthTexture.image.width=C.width,C.depthTexture.image.height=C.height,C.depthTexture.needsUpdate=!0),ue(C.depthTexture,0);const de=n.get(C.depthTexture).__webglTexture,me=at(C);if(C.depthTexture.format===ui)ot(C)?d.framebufferTexture2DMultisampleEXT(36160,36096,3553,de,0,me):r.framebufferTexture2D(36160,36096,3553,de,0);else if(C.depthTexture.format===Gi)ot(C)?d.framebufferTexture2DMultisampleEXT(36160,33306,3553,de,0,me):r.framebufferTexture2D(36160,33306,3553,de,0);else throw new Error("Unknown depthTexture format")}function qe(L){const C=n.get(L),K=L.isWebGLCubeRenderTarget===!0;if(L.depthTexture&&!C.__autoAllocateDepthBuffer){if(K)throw new Error("target.depthTexture not supported in Cube render targets");Ge(C.__webglFramebuffer,L)}else if(K){C.__webglDepthbuffer=[];for(let de=0;de<6;de++)t.bindFramebuffer(36160,C.__webglFramebuffer[de]),C.__webglDepthbuffer[de]=r.createRenderbuffer(),ke(C.__webglDepthbuffer[de],L,!1)}else t.bindFramebuffer(36160,C.__webglFramebuffer),C.__webglDepthbuffer=r.createRenderbuffer(),ke(C.__webglDepthbuffer,L,!1);t.bindFramebuffer(36160,null)}function Ye(L,C,K){const de=n.get(L);C!==void 0&&Ne(de.__webglFramebuffer,L,L.texture,36064,3553),K!==void 0&&qe(L)}function rt(L){const C=L.texture,K=n.get(L),de=n.get(C);L.addEventListener("dispose",G),L.isWebGLMultipleRenderTargets!==!0&&(de.__webglTexture===void 0&&(de.__webglTexture=r.createTexture()),de.__version=C.version,a.memory.textures++);const me=L.isWebGLCubeRenderTarget===!0,we=L.isWebGLMultipleRenderTargets===!0,Oe=w(L)||o;if(me){K.__webglFramebuffer=[];for(let Se=0;Se<6;Se++)K.__webglFramebuffer[Se]=r.createFramebuffer()}else{if(K.__webglFramebuffer=r.createFramebuffer(),we)if(i.drawBuffers){const Se=L.texture;for(let oe=0,Be=Se.length;oe<Be;oe++){const Le=n.get(Se[oe]);Le.__webglTexture===void 0&&(Le.__webglTexture=r.createTexture(),a.memory.textures++)}}else console.warn("THREE.WebGLRenderer: WebGLMultipleRenderTargets can only be used with WebGL2 or WEBGL_draw_buffers extension.");if(o&&L.samples>0&&ot(L)===!1){const Se=we?C:[C];K.__webglMultisampledFramebuffer=r.createFramebuffer(),K.__webglColorRenderbuffer=[],t.bindFramebuffer(36160,K.__webglMultisampledFramebuffer);for(let oe=0;oe<Se.length;oe++){const Be=Se[oe];K.__webglColorRenderbuffer[oe]=r.createRenderbuffer(),r.bindRenderbuffer(36161,K.__webglColorRenderbuffer[oe]);const Le=s.convert(Be.format,Be.encoding),Fe=s.convert(Be.type),Me=M(Be.internalFormat,Le,Fe,Be.encoding,L.isXRRenderTarget===!0),Ie=at(L);r.renderbufferStorageMultisample(36161,Ie,Me,L.width,L.height),r.framebufferRenderbuffer(36160,36064+oe,36161,K.__webglColorRenderbuffer[oe])}r.bindRenderbuffer(36161,null),L.depthBuffer&&(K.__webglDepthRenderbuffer=r.createRenderbuffer(),ke(K.__webglDepthRenderbuffer,L,!0)),t.bindFramebuffer(36160,null)}}if(me){t.bindTexture(34067,de.__webglTexture),xe(34067,C,Oe);for(let Se=0;Se<6;Se++)Ne(K.__webglFramebuffer[Se],L,C,36064,34069+Se);x(C,Oe)&&S(34067),t.unbindTexture()}else if(we){const Se=L.texture;for(let oe=0,Be=Se.length;oe<Be;oe++){const Le=Se[oe],Fe=n.get(Le);t.bindTexture(3553,Fe.__webglTexture),xe(3553,Le,Oe),Ne(K.__webglFramebuffer,L,Le,36064+oe,3553),x(Le,Oe)&&S(3553)}t.unbindTexture()}else{let Se=3553;(L.isWebGL3DRenderTarget||L.isWebGLArrayRenderTarget)&&(o?Se=L.isWebGL3DRenderTarget?32879:35866:console.error("THREE.WebGLTextures: THREE.Data3DTexture and THREE.DataArrayTexture only supported with WebGL2.")),t.bindTexture(Se,de.__webglTexture),xe(Se,C,Oe),Ne(K.__webglFramebuffer,L,C,36064,Se),x(C,Oe)&&S(Se),t.unbindTexture()}L.depthBuffer&&qe(L)}function wt(L){const C=w(L)||o,K=L.isWebGLMultipleRenderTargets===!0?L.texture:[L.texture];for(let de=0,me=K.length;de<me;de++){const we=K[de];if(x(we,C)){const Oe=L.isWebGLCubeRenderTarget?34067:3553,Se=n.get(we).__webglTexture;t.bindTexture(Oe,Se),S(Oe),t.unbindTexture()}}}function gt(L){if(o&&L.samples>0&&ot(L)===!1){const C=L.isWebGLMultipleRenderTargets?L.texture:[L.texture],K=L.width,de=L.height;let me=16384;const we=[],Oe=L.stencilBuffer?33306:36096,Se=n.get(L),oe=L.isWebGLMultipleRenderTargets===!0;if(oe)for(let Be=0;Be<C.length;Be++)t.bindFramebuffer(36160,Se.__webglMultisampledFramebuffer),r.framebufferRenderbuffer(36160,36064+Be,36161,null),t.bindFramebuffer(36160,Se.__webglFramebuffer),r.framebufferTexture2D(36009,36064+Be,3553,null,0);t.bindFramebuffer(36008,Se.__webglMultisampledFramebuffer),t.bindFramebuffer(36009,Se.__webglFramebuffer);for(let Be=0;Be<C.length;Be++){we.push(36064+Be),L.depthBuffer&&we.push(Oe);const Le=Se.__ignoreDepthValues!==void 0?Se.__ignoreDepthValues:!1;if(Le===!1&&(L.depthBuffer&&(me|=256),L.stencilBuffer&&(me|=1024)),oe&&r.framebufferRenderbuffer(36008,36064,36161,Se.__webglColorRenderbuffer[Be]),Le===!0&&(r.invalidateFramebuffer(36008,[Oe]),r.invalidateFramebuffer(36009,[Oe])),oe){const Fe=n.get(C[Be]).__webglTexture;r.framebufferTexture2D(36009,36064,3553,Fe,0)}r.blitFramebuffer(0,0,K,de,0,0,K,de,me,9728),p&&r.invalidateFramebuffer(36008,we)}if(t.bindFramebuffer(36008,null),t.bindFramebuffer(36009,null),oe)for(let Be=0;Be<C.length;Be++){t.bindFramebuffer(36160,Se.__webglMultisampledFramebuffer),r.framebufferRenderbuffer(36160,36064+Be,36161,Se.__webglColorRenderbuffer[Be]);const Le=n.get(C[Be]).__webglTexture;t.bindFramebuffer(36160,Se.__webglFramebuffer),r.framebufferTexture2D(36009,36064+Be,3553,Le,0)}t.bindFramebuffer(36009,Se.__webglMultisampledFramebuffer)}}function at(L){return Math.min(f,L.samples)}function ot(L){const C=n.get(L);return o&&L.samples>0&&e.has("WEBGL_multisampled_render_to_texture")===!0&&C.__useRenderToTexture!==!1}function Ht(L){const C=a.render.frame;m.get(L)!==C&&(m.set(L,C),L.update())}function fe(L,C){const K=L.encoding,de=L.format,me=L.type;return L.isCompressedTexture===!0||L.isVideoTexture===!0||L.format===ha||K!==hi&&(K===pt?o===!1?e.has("EXT_sRGB")===!0&&de===gn?(L.format=ha,L.minFilter=fn,L.generateMipmaps=!1):C=Zc.sRGBToLinear(C):(de!==gn||me!==di)&&console.warn("THREE.WebGLTextures: sRGB encoded textures have to use RGBAFormat and UnsignedByteType."):console.error("THREE.WebGLTextures: Unsupported texture encoding:",K)),C}this.allocateTextureUnit=te,this.resetTextureUnits=ce,this.setTexture2D=ue,this.setTexture2DArray=be,this.setTexture3D=q,this.setTextureCube=ae,this.rebindTextures=Ye,this.setupRenderTarget=rt,this.updateRenderTargetMipmap=wt,this.updateMultisampleRenderTarget=gt,this.setupDepthRenderbuffer=qe,this.setupFrameBufferTexture=Ne,this.useMultisampledRTT=ot}function m2(r,e,t){const n=t.isWebGL2;function i(s,a=null){let o;if(s===di)return 5121;if(s===Vm)return 32819;if(s===Gm)return 32820;if(s===Om)return 5120;if(s===Um)return 5122;if(s===Xc)return 5123;if(s===Bm)return 5124;if(s===li)return 5125;if(s===ci)return 5126;if(s===vr)return n?5131:(o=e.get("OES_texture_half_float"),o!==null?o.HALF_FLOAT_OES:null);if(s===Hm)return 6406;if(s===gn)return 6408;if(s===Wm)return 6409;if(s===Xm)return 6410;if(s===ui)return 6402;if(s===Gi)return 34041;if(s===ha)return o=e.get("EXT_sRGB"),o!==null?o.SRGB_ALPHA_EXT:null;if(s===jm)return 6403;if(s===qm)return 36244;if(s===Ym)return 33319;if(s===Zm)return 33320;if(s===Km)return 36249;if(s===Es||s===Ls||s===Ps||s===As)if(a===pt)if(o=e.get("WEBGL_compressed_texture_s3tc_srgb"),o!==null){if(s===Es)return o.COMPRESSED_SRGB_S3TC_DXT1_EXT;if(s===Ls)return o.COMPRESSED_SRGB_ALPHA_S3TC_DXT1_EXT;if(s===Ps)return o.COMPRESSED_SRGB_ALPHA_S3TC_DXT3_EXT;if(s===As)return o.COMPRESSED_SRGB_ALPHA_S3TC_DXT5_EXT}else return null;else if(o=e.get("WEBGL_compressed_texture_s3tc"),o!==null){if(s===Es)return o.COMPRESSED_RGB_S3TC_DXT1_EXT;if(s===Ls)return o.COMPRESSED_RGBA_S3TC_DXT1_EXT;if(s===Ps)return o.COMPRESSED_RGBA_S3TC_DXT3_EXT;if(s===As)return o.COMPRESSED_RGBA_S3TC_DXT5_EXT}else return null;if(s===ll||s===cl||s===ul||s===fl)if(o=e.get("WEBGL_compressed_texture_pvrtc"),o!==null){if(s===ll)return o.COMPRESSED_RGB_PVRTC_4BPPV1_IMG;if(s===cl)return o.COMPRESSED_RGB_PVRTC_2BPPV1_IMG;if(s===ul)return o.COMPRESSED_RGBA_PVRTC_4BPPV1_IMG;if(s===fl)return o.COMPRESSED_RGBA_PVRTC_2BPPV1_IMG}else return null;if(s===Jm)return o=e.get("WEBGL_compressed_texture_etc1"),o!==null?o.COMPRESSED_RGB_ETC1_WEBGL:null;if(s===dl||s===hl)if(o=e.get("WEBGL_compressed_texture_etc"),o!==null){if(s===dl)return a===pt?o.COMPRESSED_SRGB8_ETC2:o.COMPRESSED_RGB8_ETC2;if(s===hl)return a===pt?o.COMPRESSED_SRGB8_ALPHA8_ETC2_EAC:o.COMPRESSED_RGBA8_ETC2_EAC}else return null;if(s===pl||s===ml||s===_l||s===gl||s===bl||s===vl||s===yl||s===wl||s===Ml||s===xl||s===Sl||s===Cl||s===Tl||s===El)if(o=e.get("WEBGL_compressed_texture_astc"),o!==null){if(s===pl)return a===pt?o.COMPRESSED_SRGB8_ALPHA8_ASTC_4x4_KHR:o.COMPRESSED_RGBA_ASTC_4x4_KHR;if(s===ml)return a===pt?o.COMPRESSED_SRGB8_ALPHA8_ASTC_5x4_KHR:o.COMPRESSED_RGBA_ASTC_5x4_KHR;if(s===_l)return a===pt?o.COMPRESSED_SRGB8_ALPHA8_ASTC_5x5_KHR:o.COMPRESSED_RGBA_ASTC_5x5_KHR;if(s===gl)return a===pt?o.COMPRESSED_SRGB8_ALPHA8_ASTC_6x5_KHR:o.COMPRESSED_RGBA_ASTC_6x5_KHR;if(s===bl)return a===pt?o.COMPRESSED_SRGB8_ALPHA8_ASTC_6x6_KHR:o.COMPRESSED_RGBA_ASTC_6x6_KHR;if(s===vl)return a===pt?o.COMPRESSED_SRGB8_ALPHA8_ASTC_8x5_KHR:o.COMPRESSED_RGBA_ASTC_8x5_KHR;if(s===yl)return a===pt?o.COMPRESSED_SRGB8_ALPHA8_ASTC_8x6_KHR:o.COMPRESSED_RGBA_ASTC_8x6_KHR;if(s===wl)return a===pt?o.COMPRESSED_SRGB8_ALPHA8_ASTC_8x8_KHR:o.COMPRESSED_RGBA_ASTC_8x8_KHR;if(s===Ml)return a===pt?o.COMPRESSED_SRGB8_ALPHA8_ASTC_10x5_KHR:o.COMPRESSED_RGBA_ASTC_10x5_KHR;if(s===xl)return a===pt?o.COMPRESSED_SRGB8_ALPHA8_ASTC_10x6_KHR:o.COMPRESSED_RGBA_ASTC_10x6_KHR;if(s===Sl)return a===pt?o.COMPRESSED_SRGB8_ALPHA8_ASTC_10x8_KHR:o.COMPRESSED_RGBA_ASTC_10x8_KHR;if(s===Cl)return a===pt?o.COMPRESSED_SRGB8_ALPHA8_ASTC_10x10_KHR:o.COMPRESSED_RGBA_ASTC_10x10_KHR;if(s===Tl)return a===pt?o.COMPRESSED_SRGB8_ALPHA8_ASTC_12x10_KHR:o.COMPRESSED_RGBA_ASTC_12x10_KHR;if(s===El)return a===pt?o.COMPRESSED_SRGB8_ALPHA8_ASTC_12x12_KHR:o.COMPRESSED_RGBA_ASTC_12x12_KHR}else return null;if(s===Ds)if(o=e.get("EXT_texture_compression_bptc"),o!==null){if(s===Ds)return a===pt?o.COMPRESSED_SRGB_ALPHA_BPTC_UNORM_EXT:o.COMPRESSED_RGBA_BPTC_UNORM_EXT}else return null;if(s===Qm||s===Ll||s===Pl||s===Al)if(o=e.get("EXT_texture_compression_rgtc"),o!==null){if(s===Ds)return o.COMPRESSED_RED_RGTC1_EXT;if(s===Ll)return o.COMPRESSED_SIGNED_RED_RGTC1_EXT;if(s===Pl)return o.COMPRESSED_RED_GREEN_RGTC2_EXT;if(s===Al)return o.COMPRESSED_SIGNED_RED_GREEN_RGTC2_EXT}else return null;return s===zi?n?34042:(o=e.get("WEBGL_depth_texture"),o!==null?o.UNSIGNED_INT_24_8_WEBGL:null):r[s]!==void 0?r[s]:null}return{convert:i}}class _2 extends dn{constructor(e=[]){super(),this.isArrayCamera=!0,this.cameras=e}}class Yr extends Ut{constructor(){super(),this.isGroup=!0,this.type="Group"}}const g2={type:"move"};class ta{constructor(){this._targetRay=null,this._grip=null,this._hand=null}getHandSpace(){return this._hand===null&&(this._hand=new Yr,this._hand.matrixAutoUpdate=!1,this._hand.visible=!1,this._hand.joints={},this._hand.inputState={pinching:!1}),this._hand}getTargetRaySpace(){return this._targetRay===null&&(this._targetRay=new Yr,this._targetRay.matrixAutoUpdate=!1,this._targetRay.visible=!1,this._targetRay.hasLinearVelocity=!1,this._targetRay.linearVelocity=new V,this._targetRay.hasAngularVelocity=!1,this._targetRay.angularVelocity=new V),this._targetRay}getGripSpace(){return this._grip===null&&(this._grip=new Yr,this._grip.matrixAutoUpdate=!1,this._grip.visible=!1,this._grip.hasLinearVelocity=!1,this._grip.linearVelocity=new V,this._grip.hasAngularVelocity=!1,this._grip.angularVelocity=new V),this._grip}dispatchEvent(e){return this._targetRay!==null&&this._targetRay.dispatchEvent(e),this._grip!==null&&this._grip.dispatchEvent(e),this._hand!==null&&this._hand.dispatchEvent(e),this}connect(e){if(e&&e.hand){const t=this._hand;if(t)for(const n of e.hand.values())this._getHandJoint(t,n)}return this.dispatchEvent({type:"connected",data:e}),this}disconnect(e){return this.dispatchEvent({type:"disconnected",data:e}),this._targetRay!==null&&(this._targetRay.visible=!1),this._grip!==null&&(this._grip.visible=!1),this._hand!==null&&(this._hand.visible=!1),this}update(e,t,n){let i=null,s=null,a=null;const o=this._targetRay,l=this._grip,c=this._hand;if(e&&t.session.visibilityState!=="visible-blurred"){if(c&&e.hand){a=!0;for(const h of e.hand.values()){const _=t.getJointPose(h,n),g=this._getHandJoint(c,h);_!==null&&(g.matrix.fromArray(_.transform.matrix),g.matrix.decompose(g.position,g.rotation,g.scale),g.jointRadius=_.radius),g.visible=_!==null}const u=c.joints["index-finger-tip"],f=c.joints["thumb-tip"],d=u.position.distanceTo(f.position),p=.02,m=.005;c.inputState.pinching&&d>p+m?(c.inputState.pinching=!1,this.dispatchEvent({type:"pinchend",handedness:e.handedness,target:this})):!c.inputState.pinching&&d<=p-m&&(c.inputState.pinching=!0,this.dispatchEvent({type:"pinchstart",handedness:e.handedness,target:this}))}else l!==null&&e.gripSpace&&(s=t.getPose(e.gripSpace,n),s!==null&&(l.matrix.fromArray(s.transform.matrix),l.matrix.decompose(l.position,l.rotation,l.scale),s.linearVelocity?(l.hasLinearVelocity=!0,l.linearVelocity.copy(s.linearVelocity)):l.hasLinearVelocity=!1,s.angularVelocity?(l.hasAngularVelocity=!0,l.angularVelocity.copy(s.angularVelocity)):l.hasAngularVelocity=!1));o!==null&&(i=t.getPose(e.targetRaySpace,n),i===null&&s!==null&&(i=s),i!==null&&(o.matrix.fromArray(i.transform.matrix),o.matrix.decompose(o.position,o.rotation,o.scale),i.linearVelocity?(o.hasLinearVelocity=!0,o.linearVelocity.copy(i.linearVelocity)):o.hasLinearVelocity=!1,i.angularVelocity?(o.hasAngularVelocity=!0,o.angularVelocity.copy(i.angularVelocity)):o.hasAngularVelocity=!1,this.dispatchEvent(g2)))}return o!==null&&(o.visible=i!==null),l!==null&&(l.visible=s!==null),c!==null&&(c.visible=a!==null),this}_getHandJoint(e,t){if(e.joints[t.jointName]===void 0){const n=new Yr;n.matrixAutoUpdate=!1,n.visible=!1,e.joints[t.jointName]=n,e.add(n)}return e.joints[t.jointName]}}class b2 extends on{constructor(e,t,n,i,s,a,o,l,c,u){if(u=u!==void 0?u:ui,u!==ui&&u!==Gi)throw new Error("DepthTexture format must be either THREE.DepthFormat or THREE.DepthStencilFormat");n===void 0&&u===ui&&(n=li),n===void 0&&u===Gi&&(n=zi),super(null,i,s,a,o,l,u,n,c),this.isDepthTexture=!0,this.image={width:e,height:t},this.magFilter=o!==void 0?o:Yt,this.minFilter=l!==void 0?l:Yt,this.flipY=!1,this.generateMipmaps=!1}}class v2 extends Xi{constructor(e,t){super();const n=this;let i=null,s=1,a=null,o="local-floor",l=1,c=null,u=null,f=null,d=null,p=null,m=null;const h=t.getContextAttributes();let _=null,g=null;const v=[],b=[],w=new Set,y=new Map,x=new dn;x.layers.enable(1),x.viewport=new Ot;const S=new dn;S.layers.enable(2),S.viewport=new Ot;const M=[x,S],T=new _2;T.layers.enable(1),T.layers.enable(2);let R=null,k=null;this.cameraAutoUpdate=!0,this.enabled=!1,this.isPresenting=!1,this.getController=function(q){let ae=v[q];return ae===void 0&&(ae=new ta,v[q]=ae),ae.getTargetRaySpace()},this.getControllerGrip=function(q){let ae=v[q];return ae===void 0&&(ae=new ta,v[q]=ae),ae.getGripSpace()},this.getHand=function(q){let ae=v[q];return ae===void 0&&(ae=new ta,v[q]=ae),ae.getHandSpace()};function G(q){const ae=b.indexOf(q.inputSource);if(ae===-1)return;const he=v[ae];he!==void 0&&he.dispatchEvent({type:q.type,data:q.inputSource})}function F(){i.removeEventListener("select",G),i.removeEventListener("selectstart",G),i.removeEventListener("selectend",G),i.removeEventListener("squeeze",G),i.removeEventListener("squeezestart",G),i.removeEventListener("squeezeend",G),i.removeEventListener("end",F),i.removeEventListener("inputsourceschange",O);for(let q=0;q<v.length;q++){const ae=b[q];ae!==null&&(b[q]=null,v[q].disconnect(ae))}R=null,k=null,e.setRenderTarget(_),p=null,d=null,f=null,i=null,g=null,be.stop(),n.isPresenting=!1,n.dispatchEvent({type:"sessionend"})}this.setFramebufferScaleFactor=function(q){s=q,n.isPresenting===!0&&console.warn("THREE.WebXRManager: Cannot change framebuffer scale while presenting.")},this.setReferenceSpaceType=function(q){o=q,n.isPresenting===!0&&console.warn("THREE.WebXRManager: Cannot change reference space type while presenting.")},this.getReferenceSpace=function(){return c||a},this.setReferenceSpace=function(q){c=q},this.getBaseLayer=function(){return d!==null?d:p},this.getBinding=function(){return f},this.getFrame=function(){return m},this.getSession=function(){return i},this.setSession=async function(q){if(i=q,i!==null){if(_=e.getRenderTarget(),i.addEventListener("select",G),i.addEventListener("selectstart",G),i.addEventListener("selectend",G),i.addEventListener("squeeze",G),i.addEventListener("squeezestart",G),i.addEventListener("squeezeend",G),i.addEventListener("end",F),i.addEventListener("inputsourceschange",O),h.xrCompatible!==!0&&await t.makeXRCompatible(),i.renderState.layers===void 0||e.capabilities.isWebGL2===!1){const ae={antialias:i.renderState.layers===void 0?h.antialias:!0,alpha:h.alpha,depth:h.depth,stencil:h.stencil,framebufferScaleFactor:s};p=new XRWebGLLayer(i,t,ae),i.updateRenderState({baseLayer:p}),g=new pi(p.framebufferWidth,p.framebufferHeight,{format:gn,type:di,encoding:e.outputEncoding,stencilBuffer:h.stencil})}else{let ae=null,he=null,W=null;h.depth&&(W=h.stencil?35056:33190,ae=h.stencil?Gi:ui,he=h.stencil?zi:li);const xe={colorFormat:32856,depthFormat:W,scaleFactor:s};f=new XRWebGLBinding(i,t),d=f.createProjectionLayer(xe),i.updateRenderState({layers:[d]}),g=new pi(d.textureWidth,d.textureHeight,{format:gn,type:di,depthTexture:new b2(d.textureWidth,d.textureHeight,he,void 0,void 0,void 0,void 0,void 0,void 0,ae),stencilBuffer:h.stencil,encoding:e.outputEncoding,samples:h.antialias?4:0});const ye=e.properties.get(g);ye.__ignoreDepthValues=d.ignoreDepthValues}g.isXRRenderTarget=!0,this.setFoveation(l),c=null,a=await i.requestReferenceSpace(o),be.setContext(i),be.start(),n.isPresenting=!0,n.dispatchEvent({type:"sessionstart"})}};function O(q){for(let ae=0;ae<q.removed.length;ae++){const he=q.removed[ae],W=b.indexOf(he);W>=0&&(b[W]=null,v[W].disconnect(he))}for(let ae=0;ae<q.added.length;ae++){const he=q.added[ae];let W=b.indexOf(he);if(W===-1){for(let ye=0;ye<v.length;ye++)if(ye>=b.length){b.push(he),W=ye;break}else if(b[ye]===null){b[ye]=he,W=ye;break}if(W===-1)break}const xe=v[W];xe&&xe.connect(he)}}const X=new V,le=new V;function ce(q,ae,he){X.setFromMatrixPosition(ae.matrixWorld),le.setFromMatrixPosition(he.matrixWorld);const W=X.distanceTo(le),xe=ae.projectionMatrix.elements,ye=he.projectionMatrix.elements,Ee=xe[14]/(xe[10]-1),Ce=xe[14]/(xe[10]+1),Ne=(xe[9]+1)/xe[5],ke=(xe[9]-1)/xe[5],Ge=(xe[8]-1)/xe[0],qe=(ye[8]+1)/ye[0],Ye=Ee*Ge,rt=Ee*qe,wt=W/(-Ge+qe),gt=wt*-Ge;ae.matrixWorld.decompose(q.position,q.quaternion,q.scale),q.translateX(gt),q.translateZ(wt),q.matrixWorld.compose(q.position,q.quaternion,q.scale),q.matrixWorldInverse.copy(q.matrixWorld).invert();const at=Ee+wt,ot=Ce+wt,Ht=Ye-gt,fe=rt+(W-gt),L=Ne*Ce/ot*at,C=ke*Ce/ot*at;q.projectionMatrix.makePerspective(Ht,fe,L,C,at,ot)}function te(q,ae){ae===null?q.matrixWorld.copy(q.matrix):q.matrixWorld.multiplyMatrices(ae.matrixWorld,q.matrix),q.matrixWorldInverse.copy(q.matrixWorld).invert()}this.updateCamera=function(q){if(i===null)return;T.near=S.near=x.near=q.near,T.far=S.far=x.far=q.far,(R!==T.near||k!==T.far)&&(i.updateRenderState({depthNear:T.near,depthFar:T.far}),R=T.near,k=T.far);const ae=q.parent,he=T.cameras;te(T,ae);for(let xe=0;xe<he.length;xe++)te(he[xe],ae);T.matrixWorld.decompose(T.position,T.quaternion,T.scale),q.matrix.copy(T.matrix),q.matrix.decompose(q.position,q.quaternion,q.scale);const W=q.children;for(let xe=0,ye=W.length;xe<ye;xe++)W[xe].updateMatrixWorld(!0);he.length===2?ce(T,x,S):T.projectionMatrix.copy(x.projectionMatrix)},this.getCamera=function(){return T},this.getFoveation=function(){if(!(d===null&&p===null))return l},this.setFoveation=function(q){l=q,d!==null&&(d.fixedFoveation=q),p!==null&&p.fixedFoveation!==void 0&&(p.fixedFoveation=q)},this.getPlanes=function(){return w};let ne=null;function ue(q,ae){if(u=ae.getViewerPose(c||a),m=ae,u!==null){const he=u.views;p!==null&&(e.setRenderTargetFramebuffer(g,p.framebuffer),e.setRenderTarget(g));let W=!1;he.length!==T.cameras.length&&(T.cameras.length=0,W=!0);for(let xe=0;xe<he.length;xe++){const ye=he[xe];let Ee=null;if(p!==null)Ee=p.getViewport(ye);else{const Ne=f.getViewSubImage(d,ye);Ee=Ne.viewport,xe===0&&(e.setRenderTargetTextures(g,Ne.colorTexture,d.ignoreDepthValues?void 0:Ne.depthStencilTexture),e.setRenderTarget(g))}let Ce=M[xe];Ce===void 0&&(Ce=new dn,Ce.layers.enable(xe),Ce.viewport=new Ot,M[xe]=Ce),Ce.matrix.fromArray(ye.transform.matrix),Ce.projectionMatrix.fromArray(ye.projectionMatrix),Ce.viewport.set(Ee.x,Ee.y,Ee.width,Ee.height),xe===0&&T.matrix.copy(Ce.matrix),W===!0&&T.cameras.push(Ce)}}for(let he=0;he<v.length;he++){const W=b[he],xe=v[he];W!==null&&xe!==void 0&&xe.update(W,ae,c||a)}if(ne&&ne(q,ae),ae.detectedPlanes){n.dispatchEvent({type:"planesdetected",data:ae.detectedPlanes});let he=null;for(const W of w)ae.detectedPlanes.has(W)||(he===null&&(he=[]),he.push(W));if(he!==null)for(const W of he)w.delete(W),y.delete(W),n.dispatchEvent({type:"planeremoved",data:W});for(const W of ae.detectedPlanes)if(!w.has(W))w.add(W),y.set(W,ae.lastChangedTime),n.dispatchEvent({type:"planeadded",data:W});else{const xe=y.get(W);W.lastChangedTime>xe&&(y.set(W,W.lastChangedTime),n.dispatchEvent({type:"planechanged",data:W}))}}m=null}const be=new su;be.setAnimationLoop(ue),this.setAnimationLoop=function(q){ne=q},this.dispose=function(){}}}function y2(r,e){function t(h,_){_.color.getRGB(h.fogColor.value,tu(r)),_.isFog?(h.fogNear.value=_.near,h.fogFar.value=_.far):_.isFogExp2&&(h.fogDensity.value=_.density)}function n(h,_,g,v,b){_.isMeshBasicMaterial||_.isMeshLambertMaterial?i(h,_):_.isMeshToonMaterial?(i(h,_),u(h,_)):_.isMeshPhongMaterial?(i(h,_),c(h,_)):_.isMeshStandardMaterial?(i(h,_),f(h,_),_.isMeshPhysicalMaterial&&d(h,_,b)):_.isMeshMatcapMaterial?(i(h,_),p(h,_)):_.isMeshDepthMaterial?i(h,_):_.isMeshDistanceMaterial?(i(h,_),m(h,_)):_.isMeshNormalMaterial?i(h,_):_.isLineBasicMaterial?(s(h,_),_.isLineDashedMaterial&&a(h,_)):_.isPointsMaterial?o(h,_,g,v):_.isSpriteMaterial?l(h,_):_.isShadowMaterial?(h.color.value.copy(_.color),h.opacity.value=_.opacity):_.isShaderMaterial&&(_.uniformsNeedUpdate=!1)}function i(h,_){h.opacity.value=_.opacity,_.color&&h.diffuse.value.copy(_.color),_.emissive&&h.emissive.value.copy(_.emissive).multiplyScalar(_.emissiveIntensity),_.map&&(h.map.value=_.map),_.alphaMap&&(h.alphaMap.value=_.alphaMap),_.bumpMap&&(h.bumpMap.value=_.bumpMap,h.bumpScale.value=_.bumpScale,_.side===an&&(h.bumpScale.value*=-1)),_.displacementMap&&(h.displacementMap.value=_.displacementMap,h.displacementScale.value=_.displacementScale,h.displacementBias.value=_.displacementBias),_.emissiveMap&&(h.emissiveMap.value=_.emissiveMap),_.normalMap&&(h.normalMap.value=_.normalMap,h.normalScale.value.copy(_.normalScale),_.side===an&&h.normalScale.value.negate()),_.specularMap&&(h.specularMap.value=_.specularMap),_.alphaTest>0&&(h.alphaTest.value=_.alphaTest);const g=e.get(_).envMap;if(g&&(h.envMap.value=g,h.flipEnvMap.value=g.isCubeTexture&&g.isRenderTargetTexture===!1?-1:1,h.reflectivity.value=_.reflectivity,h.ior.value=_.ior,h.refractionRatio.value=_.refractionRatio),_.lightMap){h.lightMap.value=_.lightMap;const w=r.useLegacyLights===!0?Math.PI:1;h.lightMapIntensity.value=_.lightMapIntensity*w}_.aoMap&&(h.aoMap.value=_.aoMap,h.aoMapIntensity.value=_.aoMapIntensity);let v;_.map?v=_.map:_.specularMap?v=_.specularMap:_.displacementMap?v=_.displacementMap:_.normalMap?v=_.normalMap:_.bumpMap?v=_.bumpMap:_.roughnessMap?v=_.roughnessMap:_.metalnessMap?v=_.metalnessMap:_.alphaMap?v=_.alphaMap:_.emissiveMap?v=_.emissiveMap:_.clearcoatMap?v=_.clearcoatMap:_.clearcoatNormalMap?v=_.clearcoatNormalMap:_.clearcoatRoughnessMap?v=_.clearcoatRoughnessMap:_.iridescenceMap?v=_.iridescenceMap:_.iridescenceThicknessMap?v=_.iridescenceThicknessMap:_.specularIntensityMap?v=_.specularIntensityMap:_.specularColorMap?v=_.specularColorMap:_.transmissionMap?v=_.transmissionMap:_.thicknessMap?v=_.thicknessMap:_.sheenColorMap?v=_.sheenColorMap:_.sheenRoughnessMap&&(v=_.sheenRoughnessMap),v!==void 0&&(v.isWebGLRenderTarget&&(v=v.texture),v.matrixAutoUpdate===!0&&v.updateMatrix(),h.uvTransform.value.copy(v.matrix));let b;_.aoMap?b=_.aoMap:_.lightMap&&(b=_.lightMap),b!==void 0&&(b.isWebGLRenderTarget&&(b=b.texture),b.matrixAutoUpdate===!0&&b.updateMatrix(),h.uv2Transform.value.copy(b.matrix))}function s(h,_){h.diffuse.value.copy(_.color),h.opacity.value=_.opacity}function a(h,_){h.dashSize.value=_.dashSize,h.totalSize.value=_.dashSize+_.gapSize,h.scale.value=_.scale}function o(h,_,g,v){h.diffuse.value.copy(_.color),h.opacity.value=_.opacity,h.size.value=_.size*g,h.scale.value=v*.5,_.map&&(h.map.value=_.map),_.alphaMap&&(h.alphaMap.value=_.alphaMap),_.alphaTest>0&&(h.alphaTest.value=_.alphaTest);let b;_.map?b=_.map:_.alphaMap&&(b=_.alphaMap),b!==void 0&&(b.matrixAutoUpdate===!0&&b.updateMatrix(),h.uvTransform.value.copy(b.matrix))}function l(h,_){h.diffuse.value.copy(_.color),h.opacity.value=_.opacity,h.rotation.value=_.rotation,_.map&&(h.map.value=_.map),_.alphaMap&&(h.alphaMap.value=_.alphaMap),_.alphaTest>0&&(h.alphaTest.value=_.alphaTest);let g;_.map?g=_.map:_.alphaMap&&(g=_.alphaMap),g!==void 0&&(g.matrixAutoUpdate===!0&&g.updateMatrix(),h.uvTransform.value.copy(g.matrix))}function c(h,_){h.specular.value.copy(_.specular),h.shininess.value=Math.max(_.shininess,1e-4)}function u(h,_){_.gradientMap&&(h.gradientMap.value=_.gradientMap)}function f(h,_){h.roughness.value=_.roughness,h.metalness.value=_.metalness,_.roughnessMap&&(h.roughnessMap.value=_.roughnessMap),_.metalnessMap&&(h.metalnessMap.value=_.metalnessMap),e.get(_).envMap&&(h.envMapIntensity.value=_.envMapIntensity)}function d(h,_,g){h.ior.value=_.ior,_.sheen>0&&(h.sheenColor.value.copy(_.sheenColor).multiplyScalar(_.sheen),h.sheenRoughness.value=_.sheenRoughness,_.sheenColorMap&&(h.sheenColorMap.value=_.sheenColorMap),_.sheenRoughnessMap&&(h.sheenRoughnessMap.value=_.sheenRoughnessMap)),_.clearcoat>0&&(h.clearcoat.value=_.clearcoat,h.clearcoatRoughness.value=_.clearcoatRoughness,_.clearcoatMap&&(h.clearcoatMap.value=_.clearcoatMap),_.clearcoatRoughnessMap&&(h.clearcoatRoughnessMap.value=_.clearcoatRoughnessMap),_.clearcoatNormalMap&&(h.clearcoatNormalScale.value.copy(_.clearcoatNormalScale),h.clearcoatNormalMap.value=_.clearcoatNormalMap,_.side===an&&h.clearcoatNormalScale.value.negate())),_.iridescence>0&&(h.iridescence.value=_.iridescence,h.iridescenceIOR.value=_.iridescenceIOR,h.iridescenceThicknessMinimum.value=_.iridescenceThicknessRange[0],h.iridescenceThicknessMaximum.value=_.iridescenceThicknessRange[1],_.iridescenceMap&&(h.iridescenceMap.value=_.iridescenceMap),_.iridescenceThicknessMap&&(h.iridescenceThicknessMap.value=_.iridescenceThicknessMap)),_.transmission>0&&(h.transmission.value=_.transmission,h.transmissionSamplerMap.value=g.texture,h.transmissionSamplerSize.value.set(g.width,g.height),_.transmissionMap&&(h.transmissionMap.value=_.transmissionMap),h.thickness.value=_.thickness,_.thicknessMap&&(h.thicknessMap.value=_.thicknessMap),h.attenuationDistance.value=_.attenuationDistance,h.attenuationColor.value.copy(_.attenuationColor)),h.specularIntensity.value=_.specularIntensity,h.specularColor.value.copy(_.specularColor),_.specularIntensityMap&&(h.specularIntensityMap.value=_.specularIntensityMap),_.specularColorMap&&(h.specularColorMap.value=_.specularColorMap)}function p(h,_){_.matcap&&(h.matcap.value=_.matcap)}function m(h,_){h.referencePosition.value.copy(_.referencePosition),h.nearDistance.value=_.nearDistance,h.farDistance.value=_.farDistance}return{refreshFogUniforms:t,refreshMaterialUniforms:n}}function w2(r,e,t,n){let i={},s={},a=[];const o=t.isWebGL2?r.getParameter(35375):0;function l(v,b){const w=b.program;n.uniformBlockBinding(v,w)}function c(v,b){let w=i[v.id];w===void 0&&(m(v),w=u(v),i[v.id]=w,v.addEventListener("dispose",_));const y=b.program;n.updateUBOMapping(v,y);const x=e.render.frame;s[v.id]!==x&&(d(v),s[v.id]=x)}function u(v){const b=f();v.__bindingPointIndex=b;const w=r.createBuffer(),y=v.__size,x=v.usage;return r.bindBuffer(35345,w),r.bufferData(35345,y,x),r.bindBuffer(35345,null),r.bindBufferBase(35345,b,w),w}function f(){for(let v=0;v<o;v++)if(a.indexOf(v)===-1)return a.push(v),v;return console.error("THREE.WebGLRenderer: Maximum number of simultaneously usable uniforms groups reached."),0}function d(v){const b=i[v.id],w=v.uniforms,y=v.__cache;r.bindBuffer(35345,b);for(let x=0,S=w.length;x<S;x++){const M=w[x];if(p(M,x,y)===!0){const T=M.__offset,R=Array.isArray(M.value)?M.value:[M.value];let k=0;for(let G=0;G<R.length;G++){const F=R[G],O=h(F);typeof F=="number"?(M.__data[0]=F,r.bufferSubData(35345,T+k,M.__data)):F.isMatrix3?(M.__data[0]=F.elements[0],M.__data[1]=F.elements[1],M.__data[2]=F.elements[2],M.__data[3]=F.elements[0],M.__data[4]=F.elements[3],M.__data[5]=F.elements[4],M.__data[6]=F.elements[5],M.__data[7]=F.elements[0],M.__data[8]=F.elements[6],M.__data[9]=F.elements[7],M.__data[10]=F.elements[8],M.__data[11]=F.elements[0]):(F.toArray(M.__data,k),k+=O.storage/Float32Array.BYTES_PER_ELEMENT)}r.bufferSubData(35345,T,M.__data)}}r.bindBuffer(35345,null)}function p(v,b,w){const y=v.value;if(w[b]===void 0){if(typeof y=="number")w[b]=y;else{const x=Array.isArray(y)?y:[y],S=[];for(let M=0;M<x.length;M++)S.push(x[M].clone());w[b]=S}return!0}else if(typeof y=="number"){if(w[b]!==y)return w[b]=y,!0}else{const x=Array.isArray(w[b])?w[b]:[w[b]],S=Array.isArray(y)?y:[y];for(let M=0;M<x.length;M++){const T=x[M];if(T.equals(S[M])===!1)return T.copy(S[M]),!0}}return!1}function m(v){const b=v.uniforms;let w=0;const y=16;let x=0;for(let S=0,M=b.length;S<M;S++){const T=b[S],R={boundary:0,storage:0},k=Array.isArray(T.value)?T.value:[T.value];for(let G=0,F=k.length;G<F;G++){const O=k[G],X=h(O);R.boundary+=X.boundary,R.storage+=X.storage}if(T.__data=new Float32Array(R.storage/Float32Array.BYTES_PER_ELEMENT),T.__offset=w,S>0){x=w%y;const G=y-x;x!==0&&G-R.boundary<0&&(w+=y-x,T.__offset=w)}w+=R.storage}return x=w%y,x>0&&(w+=y-x),v.__size=w,v.__cache={},this}function h(v){const b={boundary:0,storage:0};return typeof v=="number"?(b.boundary=4,b.storage=4):v.isVector2?(b.boundary=8,b.storage=8):v.isVector3||v.isColor?(b.boundary=16,b.storage=12):v.isVector4?(b.boundary=16,b.storage=16):v.isMatrix3?(b.boundary=48,b.storage=48):v.isMatrix4?(b.boundary=64,b.storage=64):v.isTexture?console.warn("THREE.WebGLRenderer: Texture samplers can not be part of an uniforms group."):console.warn("THREE.WebGLRenderer: Unsupported uniform value type.",v),b}function _(v){const b=v.target;b.removeEventListener("dispose",_);const w=a.indexOf(b.__bindingPointIndex);a.splice(w,1),r.deleteBuffer(i[b.id]),delete i[b.id],delete s[b.id]}function g(){for(const v in i)r.deleteBuffer(i[v]);a=[],i={},s={}}return{bind:l,update:c,dispose:g}}function M2(){const r=ds("canvas");return r.style.display="block",r}function Ca(r={}){this.isWebGLRenderer=!0;const e=r.canvas!==void 0?r.canvas:M2(),t=r.context!==void 0?r.context:null,n=r.depth!==void 0?r.depth:!0,i=r.stencil!==void 0?r.stencil:!0,s=r.antialias!==void 0?r.antialias:!1,a=r.premultipliedAlpha!==void 0?r.premultipliedAlpha:!0,o=r.preserveDrawingBuffer!==void 0?r.preserveDrawingBuffer:!1,l=r.powerPreference!==void 0?r.powerPreference:"default",c=r.failIfMajorPerformanceCaveat!==void 0?r.failIfMajorPerformanceCaveat:!1;let u;t!==null?u=t.getContextAttributes().alpha:u=r.alpha!==void 0?r.alpha:!1;let f=null,d=null;const p=[],m=[];this.domElement=e,this.debug={checkShaderErrors:!0},this.autoClear=!0,this.autoClearColor=!0,this.autoClearDepth=!0,this.autoClearStencil=!0,this.sortObjects=!0,this.clippingPlanes=[],this.localClippingEnabled=!1,this.outputEncoding=hi,this.useLegacyLights=!0,this.toneMapping=Un,this.toneMappingExposure=1;const h=this;let _=!1,g=0,v=0,b=null,w=-1,y=null;const x=new Ot,S=new Ot;let M=null,T=e.width,R=e.height,k=1,G=null,F=null;const O=new Ot(0,0,T,R),X=new Ot(0,0,T,R);let le=!1;const ce=new ru;let te=!1,ne=!1,ue=null;const be=new Lt,q=new V,ae={background:null,fog:null,environment:null,overrideMaterial:null,isScene:!0};function he(){return b===null?k:1}let W=t;function xe(A,j){for(let re=0;re<A.length;re++){const H=A[re],se=e.getContext(H,j);if(se!==null)return se}return null}try{const A={alpha:!0,depth:n,stencil:i,antialias:s,premultipliedAlpha:a,preserveDrawingBuffer:o,powerPreference:l,failIfMajorPerformanceCaveat:c};if("setAttribute"in e&&e.setAttribute("data-engine",`three.js r${ya}`),e.addEventListener("webglcontextlost",Fe,!1),e.addEventListener("webglcontextrestored",Me,!1),e.addEventListener("webglcontextcreationerror",Ie,!1),W===null){const j=["webgl2","webgl","experimental-webgl"];if(h.isWebGL1Renderer===!0&&j.shift(),W=xe(j,A),W===null)throw xe(j)?new Error("Error creating WebGL context with your selected attributes."):new Error("Error creating WebGL context.")}W.getShaderPrecisionFormat===void 0&&(W.getShaderPrecisionFormat=function(){return{rangeMin:1,rangeMax:1,precision:1}})}catch(A){throw console.error("THREE.WebGLRenderer: "+A.message),A}let ye,Ee,Ce,Ne,ke,Ge,qe,Ye,rt,wt,gt,at,ot,Ht,fe,L,C,K,de,me,we,Oe,Se,oe;function Be(){ye=new k1(W),Ee=new T1(W,ye,r),ye.init(Ee),Oe=new m2(W,ye,Ee),Ce=new h2(W,ye,Ee),Ne=new z1,ke=new $b,Ge=new p2(W,ye,Ce,ke,Ee,Oe,Ne),qe=new L1(h),Ye=new R1(h),rt=new W_(W,Ee),Se=new S1(W,ye,rt,Ee),wt=new I1(W,rt,Ne,Se),gt=new B1(W,wt,rt,Ne),de=new U1(W,Ee,Ge),L=new E1(ke),at=new Qb(h,qe,Ye,ye,Ee,Se,L),ot=new y2(h,ke),Ht=new t2,fe=new o2(ye,Ee),K=new x1(h,qe,Ye,Ce,gt,u,a),C=new d2(h,gt,Ee),oe=new w2(W,Ne,Ee,Ce),me=new C1(W,ye,Ne,Ee),we=new N1(W,ye,Ne,Ee),Ne.programs=at.programs,h.capabilities=Ee,h.extensions=ye,h.properties=ke,h.renderLists=Ht,h.shadowMap=C,h.state=Ce,h.info=Ne}Be();const Le=new v2(h,W);this.xr=Le,this.getContext=function(){return W},this.getContextAttributes=function(){return W.getContextAttributes()},this.forceContextLoss=function(){const A=ye.get("WEBGL_lose_context");A&&A.loseContext()},this.forceContextRestore=function(){const A=ye.get("WEBGL_lose_context");A&&A.restoreContext()},this.getPixelRatio=function(){return k},this.setPixelRatio=function(A){A!==void 0&&(k=A,this.setSize(T,R,!1))},this.getSize=function(A){return A.set(T,R)},this.setSize=function(A,j,re=!0){if(Le.isPresenting){console.warn("THREE.WebGLRenderer: Can't change size while VR device is presenting.");return}T=A,R=j,e.width=Math.floor(A*k),e.height=Math.floor(j*k),re===!0&&(e.style.width=A+"px",e.style.height=j+"px"),this.setViewport(0,0,A,j)},this.getDrawingBufferSize=function(A){return A.set(T*k,R*k).floor()},this.setDrawingBufferSize=function(A,j,re){T=A,R=j,k=re,e.width=Math.floor(A*re),e.height=Math.floor(j*re),this.setViewport(0,0,A,j)},this.getCurrentViewport=function(A){return A.copy(x)},this.getViewport=function(A){return A.copy(O)},this.setViewport=function(A,j,re,H){A.isVector4?O.set(A.x,A.y,A.z,A.w):O.set(A,j,re,H),Ce.viewport(x.copy(O).multiplyScalar(k).floor())},this.getScissor=function(A){return A.copy(X)},this.setScissor=function(A,j,re,H){A.isVector4?X.set(A.x,A.y,A.z,A.w):X.set(A,j,re,H),Ce.scissor(S.copy(X).multiplyScalar(k).floor())},this.getScissorTest=function(){return le},this.setScissorTest=function(A){Ce.setScissorTest(le=A)},this.setOpaqueSort=function(A){G=A},this.setTransparentSort=function(A){F=A},this.getClearColor=function(A){return A.copy(K.getClearColor())},this.setClearColor=function(){K.setClearColor.apply(K,arguments)},this.getClearAlpha=function(){return K.getClearAlpha()},this.setClearAlpha=function(){K.setClearAlpha.apply(K,arguments)},this.clear=function(A=!0,j=!0,re=!0){let H=0;A&&(H|=16384),j&&(H|=256),re&&(H|=1024),W.clear(H)},this.clearColor=function(){this.clear(!0,!1,!1)},this.clearDepth=function(){this.clear(!1,!0,!1)},this.clearStencil=function(){this.clear(!1,!1,!0)},this.dispose=function(){e.removeEventListener("webglcontextlost",Fe,!1),e.removeEventListener("webglcontextrestored",Me,!1),e.removeEventListener("webglcontextcreationerror",Ie,!1),Ht.dispose(),fe.dispose(),ke.dispose(),qe.dispose(),Ye.dispose(),gt.dispose(),Se.dispose(),oe.dispose(),at.dispose(),Le.dispose(),Le.removeEventListener("sessionstart",ie),Le.removeEventListener("sessionend",ve),ue&&(ue.dispose(),ue=null),Ae.stop()};function Fe(A){A.preventDefault(),console.log("THREE.WebGLRenderer: Context Lost."),_=!0}function Me(){console.log("THREE.WebGLRenderer: Context Restored."),_=!1;const A=Ne.autoReset,j=C.enabled,re=C.autoUpdate,H=C.needsUpdate,se=C.type;Be(),Ne.autoReset=A,C.enabled=j,C.autoUpdate=re,C.needsUpdate=H,C.type=se}function Ie(A){console.error("THREE.WebGLRenderer: A WebGL context could not be created. Reason: ",A.statusMessage)}function Ve(A){const j=A.target;j.removeEventListener("dispose",Ve),st(j)}function st(A){nt(A),ke.remove(A)}function nt(A){const j=ke.get(A).programs;j!==void 0&&(j.forEach(function(re){at.releaseProgram(re)}),A.isShaderMaterial&&at.releaseShaderCache(A))}this.renderBufferDirect=function(A,j,re,H,se,Ue){j===null&&(j=ae);const je=se.isMesh&&se.matrixWorld.determinant()<0,Ke=fu(A,j,re,H,se);Ce.setMaterial(H,je);let Je=re.index,it=1;H.wireframe===!0&&(Je=wt.getWireframeAttribute(re),it=2);const Qe=re.drawRange,$e=re.attributes.position;let St=Qe.start*it,tn=(Qe.start+Qe.count)*it;Ue!==null&&(St=Math.max(St,Ue.start*it),tn=Math.min(tn,(Ue.start+Ue.count)*it)),Je!==null?(St=Math.max(St,0),tn=Math.min(tn,Je.count)):$e!=null&&(St=Math.max(St,0),tn=Math.min(tn,$e.count));const En=tn-St;if(En<0||En===1/0)return;Se.setup(se,H,Ke,re,Je);let Kn,Ct=me;if(Je!==null&&(Kn=rt.get(Je),Ct=we,Ct.setIndex(Kn)),se.isMesh)H.wireframe===!0?(Ce.setLineWidth(H.wireframeLinewidth*he()),Ct.setMode(1)):Ct.setMode(4);else if(se.isLine){let et=H.linewidth;et===void 0&&(et=1),Ce.setLineWidth(et*he()),se.isLineSegments?Ct.setMode(1):se.isLineLoop?Ct.setMode(2):Ct.setMode(3)}else se.isPoints?Ct.setMode(0):se.isSprite&&Ct.setMode(4);if(se.isInstancedMesh)Ct.renderInstances(St,En,se.count);else if(re.isInstancedBufferGeometry){const et=re._maxInstanceCount!==void 0?re._maxInstanceCount:1/0,ys=Math.min(re.instanceCount,et);Ct.renderInstances(St,En,ys)}else Ct.render(St,En)},this.compile=function(A,j){function re(H,se,Ue){H.transparent===!0&&H.side===zn&&H.forceSinglePass===!1?(H.side=an,H.needsUpdate=!0,cn(H,se,Ue),H.side=Zn,H.needsUpdate=!0,cn(H,se,Ue),H.side=zn):cn(H,se,Ue)}d=fe.get(A),d.init(),m.push(d),A.traverseVisible(function(H){H.isLight&&H.layers.test(j.layers)&&(d.pushLight(H),H.castShadow&&d.pushShadow(H))}),d.setupLights(h.useLegacyLights),A.traverse(function(H){const se=H.material;if(se)if(Array.isArray(se))for(let Ue=0;Ue<se.length;Ue++){const je=se[Ue];re(je,A,H)}else re(se,A,H)}),m.pop(),d=null};let N=null;function Y(A){N&&N(A)}function ie(){Ae.stop()}function ve(){Ae.start()}const Ae=new su;Ae.setAnimationLoop(Y),typeof self<"u"&&Ae.setContext(self),this.setAnimationLoop=function(A){N=A,Le.setAnimationLoop(A),A===null?Ae.stop():Ae.start()},Le.addEventListener("sessionstart",ie),Le.addEventListener("sessionend",ve),this.render=function(A,j){if(j!==void 0&&j.isCamera!==!0){console.error("THREE.WebGLRenderer.render: camera is not an instance of THREE.Camera.");return}if(_===!0)return;A.matrixWorldAutoUpdate===!0&&A.updateMatrixWorld(),j.parent===null&&j.matrixWorldAutoUpdate===!0&&j.updateMatrixWorld(),Le.enabled===!0&&Le.isPresenting===!0&&(Le.cameraAutoUpdate===!0&&Le.updateCamera(j),j=Le.getCamera()),A.isScene===!0&&A.onBeforeRender(h,A,j,b),d=fe.get(A,m.length),d.init(),m.push(d),be.multiplyMatrices(j.projectionMatrix,j.matrixWorldInverse),ce.setFromProjectionMatrix(be),ne=this.localClippingEnabled,te=L.init(this.clippingPlanes,ne),f=Ht.get(A,p.length),f.init(),p.push(f),ht(A,j,0,h.sortObjects),f.finish(),h.sortObjects===!0&&f.sort(G,F),te===!0&&L.beginShadows();const re=d.state.shadowsArray;if(C.render(re,A,j),te===!0&&L.endShadows(),this.info.autoReset===!0&&this.info.reset(),K.render(f,A),d.setupLights(h.useLegacyLights),j.isArrayCamera){const H=j.cameras;for(let se=0,Ue=H.length;se<Ue;se++){const je=H[se];Rt(f,A,je,je.viewport)}}else Rt(f,A,j);b!==null&&(Ge.updateMultisampleRenderTarget(b),Ge.updateRenderTargetMipmap(b)),A.isScene===!0&&A.onAfterRender(h,A,j),Se.resetDefaultState(),w=-1,y=null,m.pop(),m.length>0?d=m[m.length-1]:d=null,p.pop(),p.length>0?f=p[p.length-1]:f=null};function ht(A,j,re,H){if(A.visible===!1)return;if(A.layers.test(j.layers)){if(A.isGroup)re=A.renderOrder;else if(A.isLOD)A.autoUpdate===!0&&A.update(j);else if(A.isLight)d.pushLight(A),A.castShadow&&d.pushShadow(A);else if(A.isSprite){if(!A.frustumCulled||ce.intersectsSprite(A)){H&&q.setFromMatrixPosition(A.matrixWorld).applyMatrix4(be);const je=gt.update(A),Ke=A.material;Ke.visible&&f.push(A,je,Ke,re,q.z,null)}}else if((A.isMesh||A.isLine||A.isPoints)&&(A.isSkinnedMesh&&A.skeleton.frame!==Ne.render.frame&&(A.skeleton.update(),A.skeleton.frame=Ne.render.frame),!A.frustumCulled||ce.intersectsObject(A))){H&&q.setFromMatrixPosition(A.matrixWorld).applyMatrix4(be);const je=gt.update(A),Ke=A.material;if(Array.isArray(Ke)){const Je=je.groups;for(let it=0,Qe=Je.length;it<Qe;it++){const $e=Je[it],St=Ke[$e.materialIndex];St&&St.visible&&f.push(A,je,St,re,q.z,$e)}}else Ke.visible&&f.push(A,je,Ke,re,q.z,null)}}const Ue=A.children;for(let je=0,Ke=Ue.length;je<Ke;je++)ht(Ue[je],j,re,H)}function Rt(A,j,re,H){const se=A.opaque,Ue=A.transmissive,je=A.transparent;d.setupLightsView(re),te===!0&&L.setGlobalState(h.clippingPlanes,re),Ue.length>0&&Wt(se,j,re),H&&Ce.viewport(x.copy(H)),se.length>0&&vn(se,j,re),Ue.length>0&&vn(Ue,j,re),je.length>0&&vn(je,j,re),Ce.buffers.depth.setTest(!0),Ce.buffers.depth.setMask(!0),Ce.buffers.color.setMask(!0),Ce.setPolygonOffset(!1)}function Wt(A,j,re){const H=Ee.isWebGL2;ue===null&&(ue=new pi(1024,1024,{generateMipmaps:!0,type:ye.has("EXT_color_buffer_half_float")?vr:di,minFilter:br,samples:H&&s===!0?4:0}));const se=h.getRenderTarget();h.setRenderTarget(ue),h.clear();const Ue=h.toneMapping;h.toneMapping=Un,vn(A,j,re),h.toneMapping=Ue,Ge.updateMultisampleRenderTarget(ue),Ge.updateRenderTargetMipmap(ue),h.setRenderTarget(se)}function vn(A,j,re){const H=j.isScene===!0?j.overrideMaterial:null;for(let se=0,Ue=A.length;se<Ue;se++){const je=A[se],Ke=je.object,Je=je.geometry,it=H===null?je.material:H,Qe=je.group;Ke.layers.test(re.layers)&&Mt(Ke,j,re,Je,it,Qe)}}function Mt(A,j,re,H,se,Ue){A.onBeforeRender(h,j,re,H,se,Ue),A.modelViewMatrix.multiplyMatrices(re.matrixWorldInverse,A.matrixWorld),A.normalMatrix.getNormalMatrix(A.modelViewMatrix),se.onBeforeRender(h,j,re,H,A,Ue),se.transparent===!0&&se.side===zn&&se.forceSinglePass===!1?(se.side=an,se.needsUpdate=!0,h.renderBufferDirect(re,j,H,se,A,Ue),se.side=Zn,se.needsUpdate=!0,h.renderBufferDirect(re,j,H,se,A,Ue),se.side=zn):h.renderBufferDirect(re,j,H,se,A,Ue),A.onAfterRender(h,j,re,H,se,Ue)}function cn(A,j,re){j.isScene!==!0&&(j=ae);const H=ke.get(A),se=d.state.lights,Ue=d.state.shadowsArray,je=se.state.version,Ke=at.getParameters(A,se.state,Ue,j,re),Je=at.getProgramCacheKey(Ke);let it=H.programs;H.environment=A.isMeshStandardMaterial?j.environment:null,H.fog=j.fog,H.envMap=(A.isMeshStandardMaterial?Ye:qe).get(A.envMap||H.environment),it===void 0&&(A.addEventListener("dispose",Ve),it=new Map,H.programs=it);let Qe=it.get(Je);if(Qe!==void 0){if(H.currentProgram===Qe&&H.lightsStateVersion===je)return yn(A,Ke),Qe}else Ke.uniforms=at.getUniforms(A),A.onBuild(re,Ke,h),A.onBeforeCompile(Ke,h),Qe=at.acquireProgram(Ke,Je),it.set(Je,Qe),H.uniforms=Ke.uniforms;const $e=H.uniforms;(!A.isShaderMaterial&&!A.isRawShaderMaterial||A.clipping===!0)&&($e.clippingPlanes=L.uniform),yn(A,Ke),H.needsLights=hu(A),H.lightsStateVersion=je,H.needsLights&&($e.ambientLightColor.value=se.state.ambient,$e.lightProbe.value=se.state.probe,$e.directionalLights.value=se.state.directional,$e.directionalLightShadows.value=se.state.directionalShadow,$e.spotLights.value=se.state.spot,$e.spotLightShadows.value=se.state.spotShadow,$e.rectAreaLights.value=se.state.rectArea,$e.ltc_1.value=se.state.rectAreaLTC1,$e.ltc_2.value=se.state.rectAreaLTC2,$e.pointLights.value=se.state.point,$e.pointLightShadows.value=se.state.pointShadow,$e.hemisphereLights.value=se.state.hemi,$e.directionalShadowMap.value=se.state.directionalShadowMap,$e.directionalShadowMatrix.value=se.state.directionalShadowMatrix,$e.spotShadowMap.value=se.state.spotShadowMap,$e.spotLightMatrix.value=se.state.spotLightMatrix,$e.spotLightMap.value=se.state.spotLightMap,$e.pointShadowMap.value=se.state.pointShadowMap,$e.pointShadowMatrix.value=se.state.pointShadowMatrix);const St=Qe.getUniforms(),tn=ts.seqWithValue(St.seq,$e);return H.currentProgram=Qe,H.uniformsList=tn,Qe}function yn(A,j){const re=ke.get(A);re.outputEncoding=j.outputEncoding,re.instancing=j.instancing,re.skinning=j.skinning,re.morphTargets=j.morphTargets,re.morphNormals=j.morphNormals,re.morphColors=j.morphColors,re.morphTargetsCount=j.morphTargetsCount,re.numClippingPlanes=j.numClippingPlanes,re.numIntersection=j.numClipIntersection,re.vertexAlphas=j.vertexAlphas,re.vertexTangents=j.vertexTangents,re.toneMapping=j.toneMapping}function fu(A,j,re,H,se){j.isScene!==!0&&(j=ae),Ge.resetTextureUnits();const Ue=j.fog,je=H.isMeshStandardMaterial?j.environment:null,Ke=b===null?h.outputEncoding:b.isXRRenderTarget===!0?b.texture.encoding:hi,Je=(H.isMeshStandardMaterial?Ye:qe).get(H.envMap||je),it=H.vertexColors===!0&&!!re.attributes.color&&re.attributes.color.itemSize===4,Qe=!!H.normalMap&&!!re.attributes.tangent,$e=!!re.morphAttributes.position,St=!!re.morphAttributes.normal,tn=!!re.morphAttributes.color,En=H.toneMapped?h.toneMapping:Un,Kn=re.morphAttributes.position||re.morphAttributes.normal||re.morphAttributes.color,Ct=Kn!==void 0?Kn.length:0,et=ke.get(H),ys=d.state.lights;if(te===!0&&(ne===!0||A!==y)){const nn=A===y&&H.id===w;L.setState(H,A,nn)}let kt=!1;H.version===et.__version?(et.needsLights&&et.lightsStateVersion!==ys.state.version||et.outputEncoding!==Ke||se.isInstancedMesh&&et.instancing===!1||!se.isInstancedMesh&&et.instancing===!0||se.isSkinnedMesh&&et.skinning===!1||!se.isSkinnedMesh&&et.skinning===!0||et.envMap!==Je||H.fog===!0&&et.fog!==Ue||et.numClippingPlanes!==void 0&&(et.numClippingPlanes!==L.numPlanes||et.numIntersection!==L.numIntersection)||et.vertexAlphas!==it||et.vertexTangents!==Qe||et.morphTargets!==$e||et.morphNormals!==St||et.morphColors!==tn||et.toneMapping!==En||Ee.isWebGL2===!0&&et.morphTargetsCount!==Ct)&&(kt=!0):(kt=!0,et.__version=H.version);let Jn=et.currentProgram;kt===!0&&(Jn=cn(H,j,se));let La=!1,Yi=!1,ws=!1;const Xt=Jn.getUniforms(),Qn=et.uniforms;if(Ce.useProgram(Jn.program)&&(La=!0,Yi=!0,ws=!0),H.id!==w&&(w=H.id,Yi=!0),La||y!==A){if(Xt.setValue(W,"projectionMatrix",A.projectionMatrix),Ee.logarithmicDepthBuffer&&Xt.setValue(W,"logDepthBufFC",2/(Math.log(A.far+1)/Math.LN2)),y!==A&&(y=A,Yi=!0,ws=!0),H.isShaderMaterial||H.isMeshPhongMaterial||H.isMeshToonMaterial||H.isMeshStandardMaterial||H.envMap){const nn=Xt.map.cameraPosition;nn!==void 0&&nn.setValue(W,q.setFromMatrixPosition(A.matrixWorld))}(H.isMeshPhongMaterial||H.isMeshToonMaterial||H.isMeshLambertMaterial||H.isMeshBasicMaterial||H.isMeshStandardMaterial||H.isShaderMaterial)&&Xt.setValue(W,"isOrthographic",A.isOrthographicCamera===!0),(H.isMeshPhongMaterial||H.isMeshToonMaterial||H.isMeshLambertMaterial||H.isMeshBasicMaterial||H.isMeshStandardMaterial||H.isShaderMaterial||H.isShadowMaterial||se.isSkinnedMesh)&&Xt.setValue(W,"viewMatrix",A.matrixWorldInverse)}if(se.isSkinnedMesh){Xt.setOptional(W,se,"bindMatrix"),Xt.setOptional(W,se,"bindMatrixInverse");const nn=se.skeleton;nn&&(Ee.floatVertexTextures?(nn.boneTexture===null&&nn.computeBoneTexture(),Xt.setValue(W,"boneTexture",nn.boneTexture,Ge),Xt.setValue(W,"boneTextureSize",nn.boneTextureSize)):console.warn("THREE.WebGLRenderer: SkinnedMesh can only be used with WebGL 2. With WebGL 1 OES_texture_float and vertex textures support is required."))}const Ms=re.morphAttributes;if((Ms.position!==void 0||Ms.normal!==void 0||Ms.color!==void 0&&Ee.isWebGL2===!0)&&de.update(se,re,Jn),(Yi||et.receiveShadow!==se.receiveShadow)&&(et.receiveShadow=se.receiveShadow,Xt.setValue(W,"receiveShadow",se.receiveShadow)),H.isMeshGouraudMaterial&&H.envMap!==null&&(Qn.envMap.value=Je,Qn.flipEnvMap.value=Je.isCubeTexture&&Je.isRenderTargetTexture===!1?-1:1),Yi&&(Xt.setValue(W,"toneMappingExposure",h.toneMappingExposure),et.needsLights&&du(Qn,ws),Ue&&H.fog===!0&&ot.refreshFogUniforms(Qn,Ue),ot.refreshMaterialUniforms(Qn,H,k,R,ue),ts.upload(W,et.uniformsList,Qn,Ge)),H.isShaderMaterial&&H.uniformsNeedUpdate===!0&&(ts.upload(W,et.uniformsList,Qn,Ge),H.uniformsNeedUpdate=!1),H.isSpriteMaterial&&Xt.setValue(W,"center",se.center),Xt.setValue(W,"modelViewMatrix",se.modelViewMatrix),Xt.setValue(W,"normalMatrix",se.normalMatrix),Xt.setValue(W,"modelMatrix",se.matrixWorld),H.isShaderMaterial||H.isRawShaderMaterial){const nn=H.uniformsGroups;for(let xs=0,pu=nn.length;xs<pu;xs++)if(Ee.isWebGL2){const Pa=nn[xs];oe.update(Pa,Jn),oe.bind(Pa,Jn)}else console.warn("THREE.WebGLRenderer: Uniform Buffer Objects can only be used with WebGL 2.")}return Jn}function du(A,j){A.ambientLightColor.needsUpdate=j,A.lightProbe.needsUpdate=j,A.directionalLights.needsUpdate=j,A.directionalLightShadows.needsUpdate=j,A.pointLights.needsUpdate=j,A.pointLightShadows.needsUpdate=j,A.spotLights.needsUpdate=j,A.spotLightShadows.needsUpdate=j,A.rectAreaLights.needsUpdate=j,A.hemisphereLights.needsUpdate=j}function hu(A){return A.isMeshLambertMaterial||A.isMeshToonMaterial||A.isMeshPhongMaterial||A.isMeshStandardMaterial||A.isShadowMaterial||A.isShaderMaterial&&A.lights===!0}this.getActiveCubeFace=function(){return g},this.getActiveMipmapLevel=function(){return v},this.getRenderTarget=function(){return b},this.setRenderTargetTextures=function(A,j,re){ke.get(A.texture).__webglTexture=j,ke.get(A.depthTexture).__webglTexture=re;const H=ke.get(A);H.__hasExternalTextures=!0,H.__hasExternalTextures&&(H.__autoAllocateDepthBuffer=re===void 0,H.__autoAllocateDepthBuffer||ye.has("WEBGL_multisampled_render_to_texture")===!0&&(console.warn("THREE.WebGLRenderer: Render-to-texture extension was disabled because an external texture was provided"),H.__useRenderToTexture=!1))},this.setRenderTargetFramebuffer=function(A,j){const re=ke.get(A);re.__webglFramebuffer=j,re.__useDefaultFramebuffer=j===void 0},this.setRenderTarget=function(A,j=0,re=0){b=A,g=j,v=re;let H=!0,se=null,Ue=!1,je=!1;if(A){const Je=ke.get(A);Je.__useDefaultFramebuffer!==void 0?(Ce.bindFramebuffer(36160,null),H=!1):Je.__webglFramebuffer===void 0?Ge.setupRenderTarget(A):Je.__hasExternalTextures&&Ge.rebindTextures(A,ke.get(A.texture).__webglTexture,ke.get(A.depthTexture).__webglTexture);const it=A.texture;(it.isData3DTexture||it.isDataArrayTexture||it.isCompressedArrayTexture)&&(je=!0);const Qe=ke.get(A).__webglFramebuffer;A.isWebGLCubeRenderTarget?(se=Qe[j],Ue=!0):Ee.isWebGL2&&A.samples>0&&Ge.useMultisampledRTT(A)===!1?se=ke.get(A).__webglMultisampledFramebuffer:se=Qe,x.copy(A.viewport),S.copy(A.scissor),M=A.scissorTest}else x.copy(O).multiplyScalar(k).floor(),S.copy(X).multiplyScalar(k).floor(),M=le;if(Ce.bindFramebuffer(36160,se)&&Ee.drawBuffers&&H&&Ce.drawBuffers(A,se),Ce.viewport(x),Ce.scissor(S),Ce.setScissorTest(M),Ue){const Je=ke.get(A.texture);W.framebufferTexture2D(36160,36064,34069+j,Je.__webglTexture,re)}else if(je){const Je=ke.get(A.texture),it=j||0;W.framebufferTextureLayer(36160,36064,Je.__webglTexture,re||0,it)}w=-1},this.readRenderTargetPixels=function(A,j,re,H,se,Ue,je){if(!(A&&A.isWebGLRenderTarget)){console.error("THREE.WebGLRenderer.readRenderTargetPixels: renderTarget is not THREE.WebGLRenderTarget.");return}let Ke=ke.get(A).__webglFramebuffer;if(A.isWebGLCubeRenderTarget&&je!==void 0&&(Ke=Ke[je]),Ke){Ce.bindFramebuffer(36160,Ke);try{const Je=A.texture,it=Je.format,Qe=Je.type;if(it!==gn&&Oe.convert(it)!==W.getParameter(35739)){console.error("THREE.WebGLRenderer.readRenderTargetPixels: renderTarget is not in RGBA or implementation defined format.");return}const $e=Qe===vr&&(ye.has("EXT_color_buffer_half_float")||Ee.isWebGL2&&ye.has("EXT_color_buffer_float"));if(Qe!==di&&Oe.convert(Qe)!==W.getParameter(35738)&&!(Qe===ci&&(Ee.isWebGL2||ye.has("OES_texture_float")||ye.has("WEBGL_color_buffer_float")))&&!$e){console.error("THREE.WebGLRenderer.readRenderTargetPixels: renderTarget is not in UnsignedByteType or implementation defined type.");return}j>=0&&j<=A.width-H&&re>=0&&re<=A.height-se&&W.readPixels(j,re,H,se,Oe.convert(it),Oe.convert(Qe),Ue)}finally{const Je=b!==null?ke.get(b).__webglFramebuffer:null;Ce.bindFramebuffer(36160,Je)}}},this.copyFramebufferToTexture=function(A,j,re=0){const H=Math.pow(2,-re),se=Math.floor(j.image.width*H),Ue=Math.floor(j.image.height*H);Ge.setTexture2D(j,0),W.copyTexSubImage2D(3553,re,0,0,A.x,A.y,se,Ue),Ce.unbindTexture()},this.copyTextureToTexture=function(A,j,re,H=0){const se=j.image.width,Ue=j.image.height,je=Oe.convert(re.format),Ke=Oe.convert(re.type);Ge.setTexture2D(re,0),W.pixelStorei(37440,re.flipY),W.pixelStorei(37441,re.premultiplyAlpha),W.pixelStorei(3317,re.unpackAlignment),j.isDataTexture?W.texSubImage2D(3553,H,A.x,A.y,se,Ue,je,Ke,j.image.data):j.isCompressedTexture?W.compressedTexSubImage2D(3553,H,A.x,A.y,j.mipmaps[0].width,j.mipmaps[0].height,je,j.mipmaps[0].data):W.texSubImage2D(3553,H,A.x,A.y,je,Ke,j.image),H===0&&re.generateMipmaps&&W.generateMipmap(3553),Ce.unbindTexture()},this.copyTextureToTexture3D=function(A,j,re,H,se=0){if(h.isWebGL1Renderer){console.warn("THREE.WebGLRenderer.copyTextureToTexture3D: can only be used with WebGL2.");return}const Ue=A.max.x-A.min.x+1,je=A.max.y-A.min.y+1,Ke=A.max.z-A.min.z+1,Je=Oe.convert(H.format),it=Oe.convert(H.type);let Qe;if(H.isData3DTexture)Ge.setTexture3D(H,0),Qe=32879;else if(H.isDataArrayTexture)Ge.setTexture2DArray(H,0),Qe=35866;else{console.warn("THREE.WebGLRenderer.copyTextureToTexture3D: only supports THREE.DataTexture3D and THREE.DataTexture2DArray.");return}W.pixelStorei(37440,H.flipY),W.pixelStorei(37441,H.premultiplyAlpha),W.pixelStorei(3317,H.unpackAlignment);const $e=W.getParameter(3314),St=W.getParameter(32878),tn=W.getParameter(3316),En=W.getParameter(3315),Kn=W.getParameter(32877),Ct=re.isCompressedTexture?re.mipmaps[0]:re.image;W.pixelStorei(3314,Ct.width),W.pixelStorei(32878,Ct.height),W.pixelStorei(3316,A.min.x),W.pixelStorei(3315,A.min.y),W.pixelStorei(32877,A.min.z),re.isDataTexture||re.isData3DTexture?W.texSubImage3D(Qe,se,j.x,j.y,j.z,Ue,je,Ke,Je,it,Ct.data):re.isCompressedArrayTexture?(console.warn("THREE.WebGLRenderer.copyTextureToTexture3D: untested support for compressed srcTexture."),W.compressedTexSubImage3D(Qe,se,j.x,j.y,j.z,Ue,je,Ke,Je,Ct.data)):W.texSubImage3D(Qe,se,j.x,j.y,j.z,Ue,je,Ke,Je,it,Ct),W.pixelStorei(3314,$e),W.pixelStorei(32878,St),W.pixelStorei(3316,tn),W.pixelStorei(3315,En),W.pixelStorei(32877,Kn),se===0&&H.generateMipmaps&&W.generateMipmap(Qe),Ce.unbindTexture()},this.initTexture=function(A){A.isCubeTexture?Ge.setTextureCube(A,0):A.isData3DTexture?Ge.setTexture3D(A,0):A.isDataArrayTexture||A.isCompressedArrayTexture?Ge.setTexture2DArray(A,0):Ge.setTexture2D(A,0),Ce.unbindTexture()},this.resetState=function(){g=0,v=0,b=null,Ce.reset(),Se.reset()},typeof __THREE_DEVTOOLS__<"u"&&__THREE_DEVTOOLS__.dispatchEvent(new CustomEvent("observe",{detail:this}))}Object.defineProperties(Ca.prototype,{physicallyCorrectLights:{get:function(){return console.warn("THREE.WebGLRenderer: the property .physicallyCorrectLights has been removed. Set renderer.useLegacyLights instead."),!this.useLegacyLights},set:function(r){console.warn("THREE.WebGLRenderer: the property .physicallyCorrectLights has been removed. Set renderer.useLegacyLights instead."),this.useLegacyLights=!r}}});class x2 extends Ca{}x2.prototype.isWebGL1Renderer=!0;class S2 extends Ut{constructor(){super(),this.isScene=!0,this.type="Scene",this.background=null,this.environment=null,this.fog=null,this.backgroundBlurriness=0,this.backgroundIntensity=1,this.overrideMaterial=null,typeof __THREE_DEVTOOLS__<"u"&&__THREE_DEVTOOLS__.dispatchEvent(new CustomEvent("observe",{detail:this}))}copy(e,t){return super.copy(e,t),e.background!==null&&(this.background=e.background.clone()),e.environment!==null&&(this.environment=e.environment.clone()),e.fog!==null&&(this.fog=e.fog.clone()),this.backgroundBlurriness=e.backgroundBlurriness,this.backgroundIntensity=e.backgroundIntensity,e.overrideMaterial!==null&&(this.overrideMaterial=e.overrideMaterial.clone()),this.matrixAutoUpdate=e.matrixAutoUpdate,this}toJSON(e){const t=super.toJSON(e);return this.fog!==null&&(t.object.fog=this.fog.toJSON()),this.backgroundBlurriness>0&&(t.object.backgroundBlurriness=this.backgroundBlurriness),this.backgroundIntensity!==1&&(t.object.backgroundIntensity=this.backgroundIntensity),t}get autoUpdate(){return console.warn("THREE.Scene: autoUpdate was renamed to matrixWorldAutoUpdate in r144."),this.matrixWorldAutoUpdate}set autoUpdate(e){console.warn("THREE.Scene: autoUpdate was renamed to matrixWorldAutoUpdate in r144."),this.matrixWorldAutoUpdate=e}}class uu extends Er{constructor(e){super(),this.isLineBasicMaterial=!0,this.type="LineBasicMaterial",this.color=new mt(16777215),this.linewidth=1,this.linecap="round",this.linejoin="round",this.fog=!0,this.setValues(e)}copy(e){return super.copy(e),this.color.copy(e.color),this.linewidth=e.linewidth,this.linecap=e.linecap,this.linejoin=e.linejoin,this.fog=e.fog,this}}const hc=new V,pc=new V,mc=new Lt,na=new Ma,Zr=new _s;class Xn extends Ut{constructor(e=new en,t=new uu){super(),this.isLine=!0,this.type="Line",this.geometry=e,this.material=t,this.updateMorphTargets()}copy(e,t){return super.copy(e,t),this.material=e.material,this.geometry=e.geometry,this}computeLineDistances(){const e=this.geometry;if(e.index===null){const t=e.attributes.position,n=[0];for(let i=1,s=t.count;i<s;i++)hc.fromBufferAttribute(t,i-1),pc.fromBufferAttribute(t,i),n[i]=n[i-1],n[i]+=hc.distanceTo(pc);e.setAttribute("lineDistance",new vt(n,1))}else console.warn("THREE.Line.computeLineDistances(): Computation only possible with non-indexed BufferGeometry.");return this}raycast(e,t){const n=this.geometry,i=this.matrixWorld,s=e.params.Line.threshold,a=n.drawRange;if(n.boundingSphere===null&&n.computeBoundingSphere(),Zr.copy(n.boundingSphere),Zr.applyMatrix4(i),Zr.radius+=s,e.ray.intersectsSphere(Zr)===!1)return;mc.copy(i).invert(),na.copy(e.ray).applyMatrix4(mc);const o=s/((this.scale.x+this.scale.y+this.scale.z)/3),l=o*o,c=new V,u=new V,f=new V,d=new V,p=this.isLineSegments?2:1,m=n.index,_=n.attributes.position;if(m!==null){const g=Math.max(0,a.start),v=Math.min(m.count,a.start+a.count);for(let b=g,w=v-1;b<w;b+=p){const y=m.getX(b),x=m.getX(b+1);if(c.fromBufferAttribute(_,y),u.fromBufferAttribute(_,x),na.distanceSqToSegment(c,u,d,f)>l)continue;d.applyMatrix4(this.matrixWorld);const M=e.ray.origin.distanceTo(d);M<e.near||M>e.far||t.push({distance:M,point:f.clone().applyMatrix4(this.matrixWorld),index:b,face:null,faceIndex:null,object:this})}}else{const g=Math.max(0,a.start),v=Math.min(_.count,a.start+a.count);for(let b=g,w=v-1;b<w;b+=p){if(c.fromBufferAttribute(_,b),u.fromBufferAttribute(_,b+1),na.distanceSqToSegment(c,u,d,f)>l)continue;d.applyMatrix4(this.matrixWorld);const x=e.ray.origin.distanceTo(d);x<e.near||x>e.far||t.push({distance:x,point:f.clone().applyMatrix4(this.matrixWorld),index:b,face:null,faceIndex:null,object:this})}}}updateMorphTargets(){const t=this.geometry.morphAttributes,n=Object.keys(t);if(n.length>0){const i=t[n[0]];if(i!==void 0){this.morphTargetInfluences=[],this.morphTargetDictionary={};for(let s=0,a=i.length;s<a;s++){const o=i[s].name||String(s);this.morphTargetInfluences.push(0),this.morphTargetDictionary[o]=s}}}}}class Gt extends en{constructor(e=1,t=1,n=1,i=32,s=1,a=!1,o=0,l=Math.PI*2){super(),this.type="CylinderGeometry",this.parameters={radiusTop:e,radiusBottom:t,height:n,radialSegments:i,heightSegments:s,openEnded:a,thetaStart:o,thetaLength:l};const c=this;i=Math.floor(i),s=Math.floor(s);const u=[],f=[],d=[],p=[];let m=0;const h=[],_=n/2;let g=0;v(),a===!1&&(e>0&&b(!0),t>0&&b(!1)),this.setIndex(u),this.setAttribute("position",new vt(f,3)),this.setAttribute("normal",new vt(d,3)),this.setAttribute("uv",new vt(p,2));function v(){const w=new V,y=new V;let x=0;const S=(t-e)/n;for(let M=0;M<=s;M++){const T=[],R=M/s,k=R*(t-e)+e;for(let G=0;G<=i;G++){const F=G/i,O=F*l+o,X=Math.sin(O),le=Math.cos(O);y.x=k*X,y.y=-R*n+_,y.z=k*le,f.push(y.x,y.y,y.z),w.set(X,S,le).normalize(),d.push(w.x,w.y,w.z),p.push(F,1-R),T.push(m++)}h.push(T)}for(let M=0;M<i;M++)for(let T=0;T<s;T++){const R=h[T][M],k=h[T+1][M],G=h[T+1][M+1],F=h[T][M+1];u.push(R,k,F),u.push(k,G,F),x+=6}c.addGroup(g,x,0),g+=x}function b(w){const y=m,x=new lt,S=new V;let M=0;const T=w===!0?e:t,R=w===!0?1:-1;for(let G=1;G<=i;G++)f.push(0,_*R,0),d.push(0,R,0),p.push(.5,.5),m++;const k=m;for(let G=0;G<=i;G++){const O=G/i*l+o,X=Math.cos(O),le=Math.sin(O);S.x=T*le,S.y=_*R,S.z=T*X,f.push(S.x,S.y,S.z),d.push(0,R,0),x.x=X*.5+.5,x.y=le*.5*R+.5,p.push(x.x,x.y),m++}for(let G=0;G<i;G++){const F=y+G,O=k+G;w===!0?u.push(O,O+1,F):u.push(O+1,O,F),M+=3}c.addGroup(g,M,w===!0?1:2),g+=M}}copy(e){return super.copy(e),this.parameters=Object.assign({},e.parameters),this}static fromJSON(e){return new Gt(e.radiusTop,e.radiusBottom,e.height,e.radialSegments,e.heightSegments,e.openEnded,e.thetaStart,e.thetaLength)}}class Ta extends en{constructor(e=[],t=[],n=1,i=0){super(),this.type="PolyhedronGeometry",this.parameters={vertices:e,indices:t,radius:n,detail:i};const s=[],a=[];o(i),c(n),u(),this.setAttribute("position",new vt(s,3)),this.setAttribute("normal",new vt(s.slice(),3)),this.setAttribute("uv",new vt(a,2)),i===0?this.computeVertexNormals():this.normalizeNormals();function o(v){const b=new V,w=new V,y=new V;for(let x=0;x<t.length;x+=3)p(t[x+0],b),p(t[x+1],w),p(t[x+2],y),l(b,w,y,v)}function l(v,b,w,y){const x=y+1,S=[];for(let M=0;M<=x;M++){S[M]=[];const T=v.clone().lerp(w,M/x),R=b.clone().lerp(w,M/x),k=x-M;for(let G=0;G<=k;G++)G===0&&M===x?S[M][G]=T:S[M][G]=T.clone().lerp(R,G/k)}for(let M=0;M<x;M++)for(let T=0;T<2*(x-M)-1;T++){const R=Math.floor(T/2);T%2===0?(d(S[M][R+1]),d(S[M+1][R]),d(S[M][R])):(d(S[M][R+1]),d(S[M+1][R+1]),d(S[M+1][R]))}}function c(v){const b=new V;for(let w=0;w<s.length;w+=3)b.x=s[w+0],b.y=s[w+1],b.z=s[w+2],b.normalize().multiplyScalar(v),s[w+0]=b.x,s[w+1]=b.y,s[w+2]=b.z}function u(){const v=new V;for(let b=0;b<s.length;b+=3){v.x=s[b+0],v.y=s[b+1],v.z=s[b+2];const w=_(v)/2/Math.PI+.5,y=g(v)/Math.PI+.5;a.push(w,1-y)}m(),f()}function f(){for(let v=0;v<a.length;v+=6){const b=a[v+0],w=a[v+2],y=a[v+4],x=Math.max(b,w,y),S=Math.min(b,w,y);x>.9&&S<.1&&(b<.2&&(a[v+0]+=1),w<.2&&(a[v+2]+=1),y<.2&&(a[v+4]+=1))}}function d(v){s.push(v.x,v.y,v.z)}function p(v,b){const w=v*3;b.x=e[w+0],b.y=e[w+1],b.z=e[w+2]}function m(){const v=new V,b=new V,w=new V,y=new V,x=new lt,S=new lt,M=new lt;for(let T=0,R=0;T<s.length;T+=9,R+=6){v.set(s[T+0],s[T+1],s[T+2]),b.set(s[T+3],s[T+4],s[T+5]),w.set(s[T+6],s[T+7],s[T+8]),x.set(a[R+0],a[R+1]),S.set(a[R+2],a[R+3]),M.set(a[R+4],a[R+5]),y.copy(v).add(b).add(w).divideScalar(3);const k=_(y);h(x,R+0,v,k),h(S,R+2,b,k),h(M,R+4,w,k)}}function h(v,b,w,y){y<0&&v.x===1&&(a[b]=v.x-1),w.x===0&&w.z===0&&(a[b]=y/2/Math.PI+.5)}function _(v){return Math.atan2(v.z,-v.x)}function g(v){return Math.atan2(-v.y,Math.sqrt(v.x*v.x+v.z*v.z))}}copy(e){return super.copy(e),this.parameters=Object.assign({},e.parameters),this}static fromJSON(e){return new Ta(e.vertices,e.indices,e.radius,e.details)}}class Ri extends Ta{constructor(e=1,t=0){const n=[1,0,0,-1,0,0,0,1,0,0,-1,0,0,0,1,0,0,-1],i=[0,2,4,0,4,3,0,3,5,0,5,2,1,2,5,1,5,3,1,3,4,1,4,2];super(n,i,e,t),this.type="OctahedronGeometry",this.parameters={radius:e,detail:t}}static fromJSON(e){return new Ri(e.radius,e.detail)}}class Ea extends en{constructor(e=1,t=32,n=16,i=0,s=Math.PI*2,a=0,o=Math.PI){super(),this.type="SphereGeometry",this.parameters={radius:e,widthSegments:t,heightSegments:n,phiStart:i,phiLength:s,thetaStart:a,thetaLength:o},t=Math.max(3,Math.floor(t)),n=Math.max(2,Math.floor(n));const l=Math.min(a+o,Math.PI);let c=0;const u=[],f=new V,d=new V,p=[],m=[],h=[],_=[];for(let g=0;g<=n;g++){const v=[],b=g/n;let w=0;g==0&&a==0?w=.5/t:g==n&&l==Math.PI&&(w=-.5/t);for(let y=0;y<=t;y++){const x=y/t;f.x=-e*Math.cos(i+x*s)*Math.sin(a+b*o),f.y=e*Math.cos(a+b*o),f.z=e*Math.sin(i+x*s)*Math.sin(a+b*o),m.push(f.x,f.y,f.z),d.copy(f).normalize(),h.push(d.x,d.y,d.z),_.push(x+w,1-b),v.push(c++)}u.push(v)}for(let g=0;g<n;g++)for(let v=0;v<t;v++){const b=u[g][v+1],w=u[g][v],y=u[g+1][v],x=u[g+1][v+1];(g!==0||a>0)&&p.push(b,w,x),(g!==n-1||l<Math.PI)&&p.push(w,y,x)}this.setIndex(p),this.setAttribute("position",new vt(m,3)),this.setAttribute("normal",new vt(h,3)),this.setAttribute("uv",new vt(_,2))}copy(e){return super.copy(e),this.parameters=Object.assign({},e.parameters),this}static fromJSON(e){return new Ea(e.radius,e.widthSegments,e.heightSegments,e.phiStart,e.phiLength,e.thetaStart,e.thetaLength)}}class oi extends en{constructor(e=1,t=.4,n=12,i=48,s=Math.PI*2){super(),this.type="TorusGeometry",this.parameters={radius:e,tube:t,radialSegments:n,tubularSegments:i,arc:s},n=Math.floor(n),i=Math.floor(i);const a=[],o=[],l=[],c=[],u=new V,f=new V,d=new V;for(let p=0;p<=n;p++)for(let m=0;m<=i;m++){const h=m/i*s,_=p/n*Math.PI*2;f.x=(e+t*Math.cos(_))*Math.cos(h),f.y=(e+t*Math.cos(_))*Math.sin(h),f.z=t*Math.sin(_),o.push(f.x,f.y,f.z),u.x=e*Math.cos(h),u.y=e*Math.sin(h),d.subVectors(f,u).normalize(),l.push(d.x,d.y,d.z),c.push(m/i),c.push(p/n)}for(let p=1;p<=n;p++)for(let m=1;m<=i;m++){const h=(i+1)*p+m-1,_=(i+1)*(p-1)+m-1,g=(i+1)*(p-1)+m,v=(i+1)*p+m;a.push(h,_,v),a.push(_,g,v)}this.setIndex(a),this.setAttribute("position",new vt(o,3)),this.setAttribute("normal",new vt(l,3)),this.setAttribute("uv",new vt(c,2))}copy(e){return super.copy(e),this.parameters=Object.assign({},e.parameters),this}static fromJSON(e){return new oi(e.radius,e.tube,e.radialSegments,e.tubularSegments,e.arc)}}class C2{constructor(e,t,n=0,i=1/0){this.ray=new Ma(e,t),this.near=n,this.far=i,this.camera=null,this.layers=new xa,this.params={Mesh:{},Line:{threshold:1},LOD:{},Points:{threshold:1},Sprite:{}}}set(e,t){this.ray.set(e,t)}setFromCamera(e,t){t.isPerspectiveCamera?(this.ray.origin.setFromMatrixPosition(t.matrixWorld),this.ray.direction.set(e.x,e.y,.5).unproject(t).sub(this.ray.origin).normalize(),this.camera=t):t.isOrthographicCamera?(this.ray.origin.set(e.x,e.y,(t.near+t.far)/(t.near-t.far)).unproject(t),this.ray.direction.set(0,0,-1).transformDirection(t.matrixWorld),this.camera=t):console.error("THREE.Raycaster: Unsupported camera type: "+t.type)}intersectObject(e,t=!0,n=[]){return _a(e,this,n,t),n.sort(_c),n}intersectObjects(e,t=!0,n=[]){for(let i=0,s=e.length;i<s;i++)_a(e[i],this,n,t);return n.sort(_c),n}}function _c(r,e){return r.distance-e.distance}function _a(r,e,t,n){if(r.layers.test(e.layers)&&r.raycast(e,t),n===!0){const i=r.children;for(let s=0,a=i.length;s<a;s++)_a(i[s],e,t,!0)}}typeof __THREE_DEVTOOLS__<"u"&&__THREE_DEVTOOLS__.dispatchEvent(new CustomEvent("register",{detail:{revision:ya}}));typeof window<"u"&&(window.__THREE__?console.warn("WARNING: Multiple instances of Three.js being imported."):window.__THREE__=ya);const ni=new C2,Qt=new V,jn=new V,_t=new Zt,gc={X:new V(1,0,0),Y:new V(0,1,0),Z:new V(0,0,1)},ia={type:"change"},bc={type:"mouseDown"},vc={type:"mouseUp",mode:null},yc={type:"objectChange"};class T2 extends Ut{constructor(e,t){super(),t===void 0&&(console.warn('THREE.TransformControls: The second parameter "domElement" is now mandatory.'),t=document),this.isTransformControls=!0,this.visible=!1,this.domElement=t,this.domElement.style.touchAction="none";const n=new R2;this._gizmo=n,this.add(n);const i=new k2;this._plane=i,this.add(i);const s=this;function a(v,b){let w=b;Object.defineProperty(s,v,{get:function(){return w!==void 0?w:b},set:function(y){w!==y&&(w=y,i[v]=y,n[v]=y,s.dispatchEvent({type:v+"-changed",value:y}),s.dispatchEvent(ia))}}),s[v]=b,i[v]=b,n[v]=b}a("camera",e),a("object",void 0),a("enabled",!0),a("axis",null),a("mode","translate"),a("translationSnap",null),a("rotationSnap",null),a("scaleSnap",null),a("space","world"),a("size",1),a("dragging",!1),a("showX",!0),a("showY",!0),a("showZ",!0);const o=new V,l=new V,c=new Zt,u=new Zt,f=new V,d=new Zt,p=new V,m=new V,h=new V,_=0,g=new V;a("worldPosition",o),a("worldPositionStart",l),a("worldQuaternion",c),a("worldQuaternionStart",u),a("cameraPosition",f),a("cameraQuaternion",d),a("pointStart",p),a("pointEnd",m),a("rotationAxis",h),a("rotationAngle",_),a("eye",g),this._offset=new V,this._startNorm=new V,this._endNorm=new V,this._cameraScale=new V,this._parentPosition=new V,this._parentQuaternion=new Zt,this._parentQuaternionInv=new Zt,this._parentScale=new V,this._worldScaleStart=new V,this._worldQuaternionInv=new Zt,this._worldScale=new V,this._positionStart=new V,this._quaternionStart=new Zt,this._scaleStart=new V,this._getPointer=E2.bind(this),this._onPointerDown=P2.bind(this),this._onPointerHover=L2.bind(this),this._onPointerMove=A2.bind(this),this._onPointerUp=D2.bind(this),this.domElement.addEventListener("pointerdown",this._onPointerDown),this.domElement.addEventListener("pointermove",this._onPointerHover),this.domElement.addEventListener("pointerup",this._onPointerUp)}updateMatrixWorld(){this.object!==void 0&&(this.object.updateMatrixWorld(),this.object.parent===null?console.error("TransformControls: The attached 3D object must be a part of the scene graph."):this.object.parent.matrixWorld.decompose(this._parentPosition,this._parentQuaternion,this._parentScale),this.object.matrixWorld.decompose(this.worldPosition,this.worldQuaternion,this._worldScale),this._parentQuaternionInv.copy(this._parentQuaternion).invert(),this._worldQuaternionInv.copy(this.worldQuaternion).invert()),this.camera.updateMatrixWorld(),this.camera.matrixWorld.decompose(this.cameraPosition,this.cameraQuaternion,this._cameraScale),this.camera.isOrthographicCamera?this.camera.getWorldDirection(this.eye).negate():this.eye.copy(this.cameraPosition).sub(this.worldPosition).normalize(),super.updateMatrixWorld(this)}pointerHover(e){if(this.object===void 0||this.dragging===!0)return;ni.setFromCamera(e,this.camera);const t=ra(this._gizmo.picker[this.mode],ni);t?this.axis=t.object.name:this.axis=null}pointerDown(e){if(!(this.object===void 0||this.dragging===!0||e.button!==0)&&this.axis!==null){ni.setFromCamera(e,this.camera);const t=ra(this._plane,ni,!0);t&&(this.object.updateMatrixWorld(),this.object.parent.updateMatrixWorld(),this._positionStart.copy(this.object.position),this._quaternionStart.copy(this.object.quaternion),this._scaleStart.copy(this.object.scale),this.object.matrixWorld.decompose(this.worldPositionStart,this.worldQuaternionStart,this._worldScaleStart),this.pointStart.copy(t.point).sub(this.worldPositionStart)),this.dragging=!0,bc.mode=this.mode,this.dispatchEvent(bc)}}pointerMove(e){const t=this.axis,n=this.mode,i=this.object;let s=this.space;if(n==="scale"?s="local":(t==="E"||t==="XYZE"||t==="XYZ")&&(s="world"),i===void 0||t===null||this.dragging===!1||e.button!==-1)return;ni.setFromCamera(e,this.camera);const a=ra(this._plane,ni,!0);if(!!a){if(this.pointEnd.copy(a.point).sub(this.worldPositionStart),n==="translate")this._offset.copy(this.pointEnd).sub(this.pointStart),s==="local"&&t!=="XYZ"&&this._offset.applyQuaternion(this._worldQuaternionInv),t.indexOf("X")===-1&&(this._offset.x=0),t.indexOf("Y")===-1&&(this._offset.y=0),t.indexOf("Z")===-1&&(this._offset.z=0),s==="local"&&t!=="XYZ"?this._offset.applyQuaternion(this._quaternionStart).divide(this._parentScale):this._offset.applyQuaternion(this._parentQuaternionInv).divide(this._parentScale),i.position.copy(this._offset).add(this._positionStart),this.translationSnap&&(s==="local"&&(i.position.applyQuaternion(_t.copy(this._quaternionStart).invert()),t.search("X")!==-1&&(i.position.x=Math.round(i.position.x/this.translationSnap)*this.translationSnap),t.search("Y")!==-1&&(i.position.y=Math.round(i.position.y/this.translationSnap)*this.translationSnap),t.search("Z")!==-1&&(i.position.z=Math.round(i.position.z/this.translationSnap)*this.translationSnap),i.position.applyQuaternion(this._quaternionStart)),s==="world"&&(i.parent&&i.position.add(Qt.setFromMatrixPosition(i.parent.matrixWorld)),t.search("X")!==-1&&(i.position.x=Math.round(i.position.x/this.translationSnap)*this.translationSnap),t.search("Y")!==-1&&(i.position.y=Math.round(i.position.y/this.translationSnap)*this.translationSnap),t.search("Z")!==-1&&(i.position.z=Math.round(i.position.z/this.translationSnap)*this.translationSnap),i.parent&&i.position.sub(Qt.setFromMatrixPosition(i.parent.matrixWorld))));else if(n==="scale"){if(t.search("XYZ")!==-1){let o=this.pointEnd.length()/this.pointStart.length();this.pointEnd.dot(this.pointStart)<0&&(o*=-1),jn.set(o,o,o)}else Qt.copy(this.pointStart),jn.copy(this.pointEnd),Qt.applyQuaternion(this._worldQuaternionInv),jn.applyQuaternion(this._worldQuaternionInv),jn.divide(Qt),t.search("X")===-1&&(jn.x=1),t.search("Y")===-1&&(jn.y=1),t.search("Z")===-1&&(jn.z=1);i.scale.copy(this._scaleStart).multiply(jn),this.scaleSnap&&(t.search("X")!==-1&&(i.scale.x=Math.round(i.scale.x/this.scaleSnap)*this.scaleSnap||this.scaleSnap),t.search("Y")!==-1&&(i.scale.y=Math.round(i.scale.y/this.scaleSnap)*this.scaleSnap||this.scaleSnap),t.search("Z")!==-1&&(i.scale.z=Math.round(i.scale.z/this.scaleSnap)*this.scaleSnap||this.scaleSnap))}else if(n==="rotate"){this._offset.copy(this.pointEnd).sub(this.pointStart);const o=20/this.worldPosition.distanceTo(Qt.setFromMatrixPosition(this.camera.matrixWorld));t==="E"?(this.rotationAxis.copy(this.eye),this.rotationAngle=this.pointEnd.angleTo(this.pointStart),this._startNorm.copy(this.pointStart).normalize(),this._endNorm.copy(this.pointEnd).normalize(),this.rotationAngle*=this._endNorm.cross(this._startNorm).dot(this.eye)<0?1:-1):t==="XYZE"?(this.rotationAxis.copy(this._offset).cross(this.eye).normalize(),this.rotationAngle=this._offset.dot(Qt.copy(this.rotationAxis).cross(this.eye))*o):(t==="X"||t==="Y"||t==="Z")&&(this.rotationAxis.copy(gc[t]),Qt.copy(gc[t]),s==="local"&&Qt.applyQuaternion(this.worldQuaternion),this.rotationAngle=this._offset.dot(Qt.cross(this.eye).normalize())*o),this.rotationSnap&&(this.rotationAngle=Math.round(this.rotationAngle/this.rotationSnap)*this.rotationSnap),s==="local"&&t!=="E"&&t!=="XYZE"?(i.quaternion.copy(this._quaternionStart),i.quaternion.multiply(_t.setFromAxisAngle(this.rotationAxis,this.rotationAngle)).normalize()):(this.rotationAxis.applyQuaternion(this._parentQuaternionInv),i.quaternion.copy(_t.setFromAxisAngle(this.rotationAxis,this.rotationAngle)),i.quaternion.multiply(this._quaternionStart).normalize())}this.dispatchEvent(ia),this.dispatchEvent(yc)}}pointerUp(e){e.button===0&&(this.dragging&&this.axis!==null&&(vc.mode=this.mode,this.dispatchEvent(vc)),this.dragging=!1,this.axis=null)}dispose(){this.domElement.removeEventListener("pointerdown",this._onPointerDown),this.domElement.removeEventListener("pointermove",this._onPointerHover),this.domElement.removeEventListener("pointermove",this._onPointerMove),this.domElement.removeEventListener("pointerup",this._onPointerUp),this.traverse(function(e){e.geometry&&e.geometry.dispose(),e.material&&e.material.dispose()})}attach(e){return this.object=e,this.visible=!0,this}detach(){return this.object=void 0,this.visible=!1,this.axis=null,this}reset(){!this.enabled||this.dragging&&(this.object.position.copy(this._positionStart),this.object.quaternion.copy(this._quaternionStart),this.object.scale.copy(this._scaleStart),this.dispatchEvent(ia),this.dispatchEvent(yc),this.pointStart.copy(this.pointEnd))}getRaycaster(){return ni}getMode(){return this.mode}setMode(e){this.mode=e}setTranslationSnap(e){this.translationSnap=e}setRotationSnap(e){this.rotationSnap=e}setScaleSnap(e){this.scaleSnap=e}setSize(e){this.size=e}setSpace(e){this.space=e}}function E2(r){if(this.domElement.ownerDocument.pointerLockElement)return{x:0,y:0,button:r.button};{const e=this.domElement.getBoundingClientRect();return{x:(r.clientX-e.left)/e.width*2-1,y:-(r.clientY-e.top)/e.height*2+1,button:r.button}}}function L2(r){if(!!this.enabled)switch(r.pointerType){case"mouse":case"pen":this.pointerHover(this._getPointer(r));break}}function P2(r){!this.enabled||(document.pointerLockElement||this.domElement.setPointerCapture(r.pointerId),this.domElement.addEventListener("pointermove",this._onPointerMove),this.pointerHover(this._getPointer(r)),this.pointerDown(this._getPointer(r)))}function A2(r){!this.enabled||this.pointerMove(this._getPointer(r))}function D2(r){!this.enabled||(this.domElement.releasePointerCapture(r.pointerId),this.domElement.removeEventListener("pointermove",this._onPointerMove),this.pointerUp(this._getPointer(r)))}function ra(r,e,t){const n=e.intersectObject(r,!0);for(let i=0;i<n.length;i++)if(n[i].object.visible||t)return n[i];return!1}const Kr=new Tr,ut=new V(0,1,0),wc=new V(0,0,0),Mc=new Lt,Jr=new Zt,ns=new Zt,Mn=new V,xc=new Lt,cr=new V(1,0,0),si=new V(0,1,0),ur=new V(0,0,1),Qr=new V,ir=new V,rr=new V;class R2 extends Ut{constructor(){super(),this.isTransformControlsGizmo=!0,this.type="TransformControlsGizmo";const e=new gs({depthTest:!1,depthWrite:!1,fog:!1,toneMapped:!1,transparent:!0}),t=new uu({depthTest:!1,depthWrite:!1,fog:!1,toneMapped:!1,transparent:!0}),n=e.clone();n.opacity=.15;const i=t.clone();i.opacity=.5;const s=e.clone();s.color.setHex(16711680);const a=e.clone();a.color.setHex(65280);const o=e.clone();o.color.setHex(255);const l=e.clone();l.color.setHex(16711680),l.opacity=.5;const c=e.clone();c.color.setHex(65280),c.opacity=.5;const u=e.clone();u.color.setHex(255),u.opacity=.5;const f=e.clone();f.opacity=.25;const d=e.clone();d.color.setHex(16776960),d.opacity=.25,e.clone().color.setHex(16776960);const m=e.clone();m.color.setHex(7895160);const h=new Gt(0,.04,.1,12);h.translate(0,.05,0);const _=new Et(.08,.08,.08);_.translate(0,.04,0);const g=new en;g.setAttribute("position",new vt([0,0,0,1,0,0],3));const v=new Gt(.0075,.0075,.5,3);v.translate(0,.25,0);function b(X,le){const ce=new oi(X,.0075,3,64,le*Math.PI*2);return ce.rotateY(Math.PI/2),ce.rotateX(Math.PI/2),ce}function w(){const X=new en;return X.setAttribute("position",new vt([0,0,0,1,1,1],3)),X}const y={X:[[new Te(h,s),[.5,0,0],[0,0,-Math.PI/2]],[new Te(h,s),[-.5,0,0],[0,0,Math.PI/2]],[new Te(v,s),[0,0,0],[0,0,-Math.PI/2]]],Y:[[new Te(h,a),[0,.5,0]],[new Te(h,a),[0,-.5,0],[Math.PI,0,0]],[new Te(v,a)]],Z:[[new Te(h,o),[0,0,.5],[Math.PI/2,0,0]],[new Te(h,o),[0,0,-.5],[-Math.PI/2,0,0]],[new Te(v,o),null,[Math.PI/2,0,0]]],XYZ:[[new Te(new Ri(.1,0),f.clone()),[0,0,0]]],XY:[[new Te(new Et(.15,.15,.01),u.clone()),[.15,.15,0]]],YZ:[[new Te(new Et(.15,.15,.01),l.clone()),[0,.15,.15],[0,Math.PI/2,0]]],XZ:[[new Te(new Et(.15,.15,.01),c.clone()),[.15,0,.15],[-Math.PI/2,0,0]]]},x={X:[[new Te(new Gt(.2,0,.6,4),n),[.3,0,0],[0,0,-Math.PI/2]],[new Te(new Gt(.2,0,.6,4),n),[-.3,0,0],[0,0,Math.PI/2]]],Y:[[new Te(new Gt(.2,0,.6,4),n),[0,.3,0]],[new Te(new Gt(.2,0,.6,4),n),[0,-.3,0],[0,0,Math.PI]]],Z:[[new Te(new Gt(.2,0,.6,4),n),[0,0,.3],[Math.PI/2,0,0]],[new Te(new Gt(.2,0,.6,4),n),[0,0,-.3],[-Math.PI/2,0,0]]],XYZ:[[new Te(new Ri(.2,0),n)]],XY:[[new Te(new Et(.2,.2,.01),n),[.15,.15,0]]],YZ:[[new Te(new Et(.2,.2,.01),n),[0,.15,.15],[0,Math.PI/2,0]]],XZ:[[new Te(new Et(.2,.2,.01),n),[.15,0,.15],[-Math.PI/2,0,0]]]},S={START:[[new Te(new Ri(.01,2),i),null,null,null,"helper"]],END:[[new Te(new Ri(.01,2),i),null,null,null,"helper"]],DELTA:[[new Xn(w(),i),null,null,null,"helper"]],X:[[new Xn(g,i.clone()),[-1e3,0,0],null,[1e6,1,1],"helper"]],Y:[[new Xn(g,i.clone()),[0,-1e3,0],[0,0,Math.PI/2],[1e6,1,1],"helper"]],Z:[[new Xn(g,i.clone()),[0,0,-1e3],[0,-Math.PI/2,0],[1e6,1,1],"helper"]]},M={XYZE:[[new Te(b(.5,1),m),null,[0,Math.PI/2,0]]],X:[[new Te(b(.5,.5),s)]],Y:[[new Te(b(.5,.5),a),null,[0,0,-Math.PI/2]]],Z:[[new Te(b(.5,.5),o),null,[0,Math.PI/2,0]]],E:[[new Te(b(.75,1),d),null,[0,Math.PI/2,0]]]},T={AXIS:[[new Xn(g,i.clone()),[-1e3,0,0],null,[1e6,1,1],"helper"]]},R={XYZE:[[new Te(new Ea(.25,10,8),n)]],X:[[new Te(new oi(.5,.1,4,24),n),[0,0,0],[0,-Math.PI/2,-Math.PI/2]]],Y:[[new Te(new oi(.5,.1,4,24),n),[0,0,0],[Math.PI/2,0,0]]],Z:[[new Te(new oi(.5,.1,4,24),n),[0,0,0],[0,0,-Math.PI/2]]],E:[[new Te(new oi(.75,.1,2,24),n)]]},k={X:[[new Te(_,s),[.5,0,0],[0,0,-Math.PI/2]],[new Te(v,s),[0,0,0],[0,0,-Math.PI/2]],[new Te(_,s),[-.5,0,0],[0,0,Math.PI/2]]],Y:[[new Te(_,a),[0,.5,0]],[new Te(v,a)],[new Te(_,a),[0,-.5,0],[0,0,Math.PI]]],Z:[[new Te(_,o),[0,0,.5],[Math.PI/2,0,0]],[new Te(v,o),[0,0,0],[Math.PI/2,0,0]],[new Te(_,o),[0,0,-.5],[-Math.PI/2,0,0]]],XY:[[new Te(new Et(.15,.15,.01),u),[.15,.15,0]]],YZ:[[new Te(new Et(.15,.15,.01),l),[0,.15,.15],[0,Math.PI/2,0]]],XZ:[[new Te(new Et(.15,.15,.01),c),[.15,0,.15],[-Math.PI/2,0,0]]],XYZ:[[new Te(new Et(.1,.1,.1),f.clone())]]},G={X:[[new Te(new Gt(.2,0,.6,4),n),[.3,0,0],[0,0,-Math.PI/2]],[new Te(new Gt(.2,0,.6,4),n),[-.3,0,0],[0,0,Math.PI/2]]],Y:[[new Te(new Gt(.2,0,.6,4),n),[0,.3,0]],[new Te(new Gt(.2,0,.6,4),n),[0,-.3,0],[0,0,Math.PI]]],Z:[[new Te(new Gt(.2,0,.6,4),n),[0,0,.3],[Math.PI/2,0,0]],[new Te(new Gt(.2,0,.6,4),n),[0,0,-.3],[-Math.PI/2,0,0]]],XY:[[new Te(new Et(.2,.2,.01),n),[.15,.15,0]]],YZ:[[new Te(new Et(.2,.2,.01),n),[0,.15,.15],[0,Math.PI/2,0]]],XZ:[[new Te(new Et(.2,.2,.01),n),[.15,0,.15],[-Math.PI/2,0,0]]],XYZ:[[new Te(new Et(.2,.2,.2),n),[0,0,0]]]},F={X:[[new Xn(g,i.clone()),[-1e3,0,0],null,[1e6,1,1],"helper"]],Y:[[new Xn(g,i.clone()),[0,-1e3,0],[0,0,Math.PI/2],[1e6,1,1],"helper"]],Z:[[new Xn(g,i.clone()),[0,0,-1e3],[0,-Math.PI/2,0],[1e6,1,1],"helper"]]};function O(X){const le=new Ut;for(const ce in X)for(let te=X[ce].length;te--;){const ne=X[ce][te][0].clone(),ue=X[ce][te][1],be=X[ce][te][2],q=X[ce][te][3],ae=X[ce][te][4];ne.name=ce,ne.tag=ae,ue&&ne.position.set(ue[0],ue[1],ue[2]),be&&ne.rotation.set(be[0],be[1],be[2]),q&&ne.scale.set(q[0],q[1],q[2]),ne.updateMatrix();const he=ne.geometry.clone();he.applyMatrix4(ne.matrix),ne.geometry=he,ne.renderOrder=1/0,ne.position.set(0,0,0),ne.rotation.set(0,0,0),ne.scale.set(1,1,1),le.add(ne)}return le}this.gizmo={},this.picker={},this.helper={},this.add(this.gizmo.translate=O(y)),this.add(this.gizmo.rotate=O(M)),this.add(this.gizmo.scale=O(k)),this.add(this.picker.translate=O(x)),this.add(this.picker.rotate=O(R)),this.add(this.picker.scale=O(G)),this.add(this.helper.translate=O(S)),this.add(this.helper.rotate=O(T)),this.add(this.helper.scale=O(F)),this.picker.translate.visible=!1,this.picker.rotate.visible=!1,this.picker.scale.visible=!1}updateMatrixWorld(e){const n=(this.mode==="scale"?"local":this.space)==="local"?this.worldQuaternion:ns;this.gizmo.translate.visible=this.mode==="translate",this.gizmo.rotate.visible=this.mode==="rotate",this.gizmo.scale.visible=this.mode==="scale",this.helper.translate.visible=this.mode==="translate",this.helper.rotate.visible=this.mode==="rotate",this.helper.scale.visible=this.mode==="scale";let i=[];i=i.concat(this.picker[this.mode].children),i=i.concat(this.gizmo[this.mode].children),i=i.concat(this.helper[this.mode].children);for(let s=0;s<i.length;s++){const a=i[s];a.visible=!0,a.rotation.set(0,0,0),a.position.copy(this.worldPosition);let o;if(this.camera.isOrthographicCamera?o=(this.camera.top-this.camera.bottom)/this.camera.zoom:o=this.worldPosition.distanceTo(this.cameraPosition)*Math.min(1.9*Math.tan(Math.PI*this.camera.fov/360)/this.camera.zoom,7),a.scale.set(1,1,1).multiplyScalar(o*this.size/4),a.tag==="helper"){a.visible=!1,a.name==="AXIS"?(a.visible=!!this.axis,this.axis==="X"&&(_t.setFromEuler(Kr.set(0,0,0)),a.quaternion.copy(n).multiply(_t),Math.abs(ut.copy(cr).applyQuaternion(n).dot(this.eye))>.9&&(a.visible=!1)),this.axis==="Y"&&(_t.setFromEuler(Kr.set(0,0,Math.PI/2)),a.quaternion.copy(n).multiply(_t),Math.abs(ut.copy(si).applyQuaternion(n).dot(this.eye))>.9&&(a.visible=!1)),this.axis==="Z"&&(_t.setFromEuler(Kr.set(0,Math.PI/2,0)),a.quaternion.copy(n).multiply(_t),Math.abs(ut.copy(ur).applyQuaternion(n).dot(this.eye))>.9&&(a.visible=!1)),this.axis==="XYZE"&&(_t.setFromEuler(Kr.set(0,Math.PI/2,0)),ut.copy(this.rotationAxis),a.quaternion.setFromRotationMatrix(Mc.lookAt(wc,ut,si)),a.quaternion.multiply(_t),a.visible=this.dragging),this.axis==="E"&&(a.visible=!1)):a.name==="START"?(a.position.copy(this.worldPositionStart),a.visible=this.dragging):a.name==="END"?(a.position.copy(this.worldPosition),a.visible=this.dragging):a.name==="DELTA"?(a.position.copy(this.worldPositionStart),a.quaternion.copy(this.worldQuaternionStart),Qt.set(1e-10,1e-10,1e-10).add(this.worldPositionStart).sub(this.worldPosition).multiplyScalar(-1),Qt.applyQuaternion(this.worldQuaternionStart.clone().invert()),a.scale.copy(Qt),a.visible=this.dragging):(a.quaternion.copy(n),this.dragging?a.position.copy(this.worldPositionStart):a.position.copy(this.worldPosition),this.axis&&(a.visible=this.axis.search(a.name)!==-1));continue}a.quaternion.copy(n),this.mode==="translate"||this.mode==="scale"?(a.name==="X"&&Math.abs(ut.copy(cr).applyQuaternion(n).dot(this.eye))>.99&&(a.scale.set(1e-10,1e-10,1e-10),a.visible=!1),a.name==="Y"&&Math.abs(ut.copy(si).applyQuaternion(n).dot(this.eye))>.99&&(a.scale.set(1e-10,1e-10,1e-10),a.visible=!1),a.name==="Z"&&Math.abs(ut.copy(ur).applyQuaternion(n).dot(this.eye))>.99&&(a.scale.set(1e-10,1e-10,1e-10),a.visible=!1),a.name==="XY"&&Math.abs(ut.copy(ur).applyQuaternion(n).dot(this.eye))<.2&&(a.scale.set(1e-10,1e-10,1e-10),a.visible=!1),a.name==="YZ"&&Math.abs(ut.copy(cr).applyQuaternion(n).dot(this.eye))<.2&&(a.scale.set(1e-10,1e-10,1e-10),a.visible=!1),a.name==="XZ"&&Math.abs(ut.copy(si).applyQuaternion(n).dot(this.eye))<.2&&(a.scale.set(1e-10,1e-10,1e-10),a.visible=!1)):this.mode==="rotate"&&(Jr.copy(n),ut.copy(this.eye).applyQuaternion(_t.copy(n).invert()),a.name.search("E")!==-1&&a.quaternion.setFromRotationMatrix(Mc.lookAt(this.eye,wc,si)),a.name==="X"&&(_t.setFromAxisAngle(cr,Math.atan2(-ut.y,ut.z)),_t.multiplyQuaternions(Jr,_t),a.quaternion.copy(_t)),a.name==="Y"&&(_t.setFromAxisAngle(si,Math.atan2(ut.x,ut.z)),_t.multiplyQuaternions(Jr,_t),a.quaternion.copy(_t)),a.name==="Z"&&(_t.setFromAxisAngle(ur,Math.atan2(ut.y,ut.x)),_t.multiplyQuaternions(Jr,_t),a.quaternion.copy(_t))),a.visible=a.visible&&(a.name.indexOf("X")===-1||this.showX),a.visible=a.visible&&(a.name.indexOf("Y")===-1||this.showY),a.visible=a.visible&&(a.name.indexOf("Z")===-1||this.showZ),a.visible=a.visible&&(a.name.indexOf("E")===-1||this.showX&&this.showY&&this.showZ),a.material._color=a.material._color||a.material.color.clone(),a.material._opacity=a.material._opacity||a.material.opacity,a.material.color.copy(a.material._color),a.material.opacity=a.material._opacity,this.enabled&&this.axis&&(a.name===this.axis||this.axis.split("").some(function(l){return a.name===l}))&&(a.material.color.setHex(16776960),a.material.opacity=1)}super.updateMatrixWorld(e)}}class k2 extends Te{constructor(){super(new bs(1e5,1e5,2,2),new gs({visible:!1,wireframe:!0,side:zn,transparent:!0,opacity:.1,toneMapped:!1})),this.isTransformControlsPlane=!0,this.type="TransformControlsPlane"}updateMatrixWorld(e){let t=this.space;switch(this.position.copy(this.worldPosition),this.mode==="scale"&&(t="local"),Qr.copy(cr).applyQuaternion(t==="local"?this.worldQuaternion:ns),ir.copy(si).applyQuaternion(t==="local"?this.worldQuaternion:ns),rr.copy(ur).applyQuaternion(t==="local"?this.worldQuaternion:ns),ut.copy(ir),this.mode){case"translate":case"scale":switch(this.axis){case"X":ut.copy(this.eye).cross(Qr),Mn.copy(Qr).cross(ut);break;case"Y":ut.copy(this.eye).cross(ir),Mn.copy(ir).cross(ut);break;case"Z":ut.copy(this.eye).cross(rr),Mn.copy(rr).cross(ut);break;case"XY":Mn.copy(rr);break;case"YZ":Mn.copy(Qr);break;case"XZ":ut.copy(rr),Mn.copy(ir);break;case"XYZ":case"E":Mn.set(0,0,0);break}break;case"rotate":default:Mn.set(0,0,0)}Mn.length()===0?this.quaternion.copy(this.cameraQuaternion):(xc.lookAt(Qt.set(0,0,0),Mn,ut),this.quaternion.setFromRotationMatrix(xc)),super.updateMatrixWorld(e)}}function Sc(r){let e;return{c(){e=z("div"),P(e,"class","gizmo")},m(t,n){B(t,e,n)},d(t){t&&U(e)}}}function I2(r){let e,t=r[0].handle&&Sc();return{c(){t&&t.c(),e=Ft()},m(n,i){t&&t.m(n,i),B(n,e,i)},p(n,[i]){n[0].handle?t||(t=Sc(),t.c(),t.m(e.parentNode,e)):t&&(t.d(1),t=null)},i:_e,o:_e,d(n){t&&t.d(n),n&&U(e)}}}function Cc(r,e){return r>0&&r<90?e:r>-180&&r<-90||r>0?-e:e}function N2(r,e,t){let n,i,{gizmoData:s,gizmoCamData:a}=dr;ft(r,s,S=>t(0,i=S)),ft(r,a,S=>t(5,n=S)),ct(()=>{i.handle&&(w(i),v(),x(),g())});let o,l,c,u,f,d,p,m,h,_=!1;function g(){f&&f.render(u,l)}function v(){f=new Ca({alpha:!0}),f.setPixelRatio(window.devicePixelRatio),f.setSize(window.innerWidth,window.innerHeight),document.body.appendChild(f.domElement);const S=window.innerWidth/window.innerHeight;o=new dn(45,S,.01),l=o,l.lookAt(0,200,0),d=new T2(l,f.domElement),d.addEventListener("change",g),d.addEventListener("objectChange",M=>{_||b()}),d.attach(c),d.showX=!0,d.showY=!0,d.showZ=!0,d.size=.5,u.add(d),window.addEventListener("keydown",async function(M){if(!_)switch(M.keyCode){case 90:d.setMode("translate");break;case 82:d.setMode("rotate");break;case 27:await Pe("closeGizmo"),y();break;case 69:await Pe("placeObject"),await Pe("closeGizmo"),y();break}})}function b(){const S={handle:p,position:{x:c.position.x,y:-c.position.z,z:c.position.y},rotation:{x:Ln.radToDeg(c.rotation.x),y:Ln.radToDeg(-c.rotation.z),z:Ln.radToDeg(c.rotation.y)}};Pe("gizmo-object-update",S)}function w(S){!S.handle||(u=new S2,c=new Te,u.add(c),t(3,p=S.handle),c.position.set(S.position.x,S.position.z,-S.position.y),c.rotation.order="YZX",c.rotation.set(Ln.degToRad(S.rotation.x),Ln.degToRad(Cc(S.rotation.x,S.rotation.z)),Ln.degToRad(S.rotation.y)))}function y(){_=!0,f.domElement.remove(),t(3,p=null),u.remove(c),f=null,c=null,t(4,m=null),h=null,l=null,d=null}function x(){_||(t(4,m=n.camCords),h=n.camRot,l.position.set(m.x,m.z,-m.y),l.rotation.order="YZX",l.rotation.set(Ln.degToRad(h.x),Ln.degToRad(Cc(h.x,h.z)),Ln.degToRad(h.y)))}return r.$$.update=()=>{r.$$.dirty&56&&n.camCords!==m&&p&&x()},[i,s,a,p,m,n]}class z2 extends Xe{constructor(e){super(),We(this,e,N2,I2,He,{})}}function F2(r){let e,t,n,i,s,a,o,l,c,u,f,d,p;return{c(){e=z("div"),t=z("div"),t.textContent="Key Binds",n=Z(),i=z("div"),s=z("p"),s.textContent=`${r[1].press_Z_gizmo_helper}`,a=Z(),o=z("p"),o.textContent=`${r[1].press_R_gizmo_helper}`,l=Z(),c=z("p"),c.textContent=`${r[1].press_E_gizmo_helper}`,u=Z(),f=z("p"),f.textContent=`${r[1].press_esc_gizmo_helper}`,d=Z(),p=z("p"),p.textContent=`${r[1].press_alt_gizmo_helper}`,P(t,"class","heading"),P(i,"class","body"),P(e,"class","gizmo-helper-main")},m(m,h){B(m,e,h),E(e,t),E(e,n),E(e,i),E(i,s),E(i,a),E(i,o),E(i,l),E(i,c),E(i,u),E(i,f),E(i,d),E(i,p)},p:_e,i:_e,o:_e,d(m){m&&U(e)}}}function O2(r,e,t){let n,{locales:i}=yt;return ft(r,i,a=>t(2,n=a)),[i,n]}class U2 extends Xe{constructor(e){super(),We(this,e,O2,F2,He,{})}}function B2(r){let e,t,n,i;return e=new z2({}),n=new U2({}),{c(){ee(e.$$.fragment),t=Z(),ee(n.$$.fragment)},m(s,a){Q(e,s,a),B(s,t,a),Q(n,s,a),i=!0},i(s){i||(D(e.$$.fragment,s),D(n.$$.fragment,s),i=!0)},o(s){I(e.$$.fragment,s),I(n.$$.fragment,s),i=!1},d(s){$(e,s),s&&U(t),$(n,s)}}}function V2(r){let e,t;return e=new sm({}),{c(){ee(e.$$.fragment)},m(n,i){Q(e,n,i),t=!0},i(n){t||(D(e.$$.fragment,n),t=!0)},o(n){I(e.$$.fragment,n),t=!1},d(n){$(e,n)}}}function G2(r){let e,t;return e=new em({}),{c(){ee(e.$$.fragment)},m(n,i){Q(e,n,i),t=!0},i(n){t||(D(e.$$.fragment,n),t=!0)},o(n){I(e.$$.fragment,n),t=!1},d(n){$(e,n)}}}function Tc(r){let e,t;return e=new om({}),{c(){ee(e.$$.fragment)},m(n,i){Q(e,n,i),t=!0},i(n){t||(D(e.$$.fragment,n),t=!0)},o(n){I(e.$$.fragment,n),t=!1},d(n){$(e,n)}}}function H2(r){let e,t,n,i,s;const a=[G2,V2,B2],o=[];function l(u,f){return u[0]?0:u[1]?1:u[2]?2:-1}~(e=l(r))&&(t=o[e]=a[e](r));let c=r[3]&&Tc();return{c(){t&&t.c(),n=Z(),c&&c.c(),i=Ft()},m(u,f){~e&&o[e].m(u,f),B(u,n,f),c&&c.m(u,f),B(u,i,f),s=!0},p(u,[f]){let d=e;e=l(u),e!==d&&(t&&(De(),I(o[d],1,1,()=>{o[d]=null}),Re()),~e?(t=o[e],t||(t=o[e]=a[e](u),t.c()),D(t,1),t.m(n.parentNode,n)):t=null),u[3]?c?f&8&&D(c,1):(c=Tc(),c.c(),D(c,1),c.m(i.parentNode,i)):c&&(De(),I(c,1,1,()=>{c=null}),Re())},i(u){s||(D(t),D(c),s=!0)},o(u){I(t),I(c),s=!1},d(u){~e&&o[e].d(u),u&&U(n),c&&c.d(u),u&&U(i)}}}function W2(r,e,t){let n,i,s,a;qu();let{show:o}=yt;ft(r,o,f=>t(0,n=f));let{showReport:l}=_r;ft(r,l,f=>t(1,i=f));let{unreadReport:c}=oa;ft(r,c,f=>t(3,a=f));let{showObject:u}=dr;return ft(r,u,f=>t(2,s=f)),document.onkeyup=yt.handleKeyUp,[n,i,s,a,o,l,c,u]}class X2 extends Xe{constructor(e){super(),We(this,e,W2,H2,He,{})}}new X2({target:document.getElementById("app")});

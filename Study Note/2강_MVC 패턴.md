<h1> Lecture 2 - MVC </h1>

<h3>1. MVC 패턴을 구성하는 3가지 캠프</h3>

+ Model : Application에 관한 지식들을 정의

+ Controller : UI Logic(Model이 User에게 어떻게 화면에 나오는가) 정의

+ View : Controller의 servant
(Controller가 Model과 통신해 Application내의 무언가를 UI로 가져오도록 할 때 필요함)

##### MVC는 이 3가지간의 Communication을 관리한다는데 있어서 큰 의미를 가진다  

<br/><br/>
<h3> 2. 캠프들간의 관계 </h3>

<img width="343" alt="스크린샷 2021-10-13 오후 4 26 53" src="https://user-images.githubusercontent.com/40496065/137087028-7fff65ef-3a1f-4ef4-bde4-430702a6e46d.png">

+ Controller -> Model  
> Controller는 Model에 원하는대로 직접적으로 접근할 수 있다.  
> 왜냐하면, Controller의 job이 무엇인지 User들에게 보여줘야하기 때문이다.

+ Model -> Controller  
> Model은 UI와 독립적이고, Controller는 근본적으로 UI에 종속되기 때문에 직접적인 접근이 불가능하다.  
> 하지만, Model속의 어떤 data가 변경되어서 관련된 UI들이 그것을 Update 해야 하는 경우에는 Model -> Controller의 통신이 가능하다.  
> 이 때, 사용하는 방식을 우리는 Notification & KVO이라 부른다.

+ Controller -> View
> Controller의 Job을 User들이 볼 수 있게 해야하므로 Controller -> View 접근은 가능하다.  

+ View -> Controller
> View는 Controller에게 구조적으로 미리 정해진 방식으로 Controller에게 
> 행위에 대한 요청(delegate), 데이터에 대한 요청(data source)이 가능하다.  
> 또한, action(View) - target(Controller) 구조로 사용자의 행위에 따라 필요한 함수를 호출할 수도 있다.
>> Data Source의 동작 방식
>> <pre><code>view는 Controller에게 data를 요구  
>> Controller는 그것을 구현하고, Model에게 전달함  
>> Data를 view에게 가져다줌  
>> </pre></code>

+ Model -> View & View -> Model
> 불가능하다
> <pre><code>1. 모델이 UI와 독립적이다
> 2. View는 Generic Object이다
> </pre></code>





<!--@START_MENU_TOKEN@-->Text<!--@END_MENU_TOKEN@-->

## Topics

### <!--@START_MENU_TOKEN@-->Group<!--@END_MENU_TOKEN@-->

- <!--@START_MENU_TOKEN@-->``Symbol``<!--@END_MENU_TOKEN@-->

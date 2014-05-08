package sample.neo4j

import edu.harvard.Disease;
import edu.harvard.Patient;
import edu.harvard.Symptom;

class CypherController {

    def index() {
        forward action:"cypher"

    }

    def cypher() {
        response.contentType = "text/plain"
        render Patient.cypherStatic("start n=node(${params.id}) match n-[:symptoms]-[others:symptoms]  return others").collect { Patient.createInstanceForNode(it.others)}
    }
	
//	def cypher2() {
//		response.contentType = "text/plain"
//		render Patient.cypherStatic("start n=node(10) match n-[:symptoms]->talk<-[:symptoms] - buddy RETURN buddy")
//	}
//
//	def cypher3() {
//		response.contentType = "text/plain"
//		println Patient.cypherStatic("start n=node(3843) return n").next()
//	}
//	
//	def commonRelatives() {
//		//response.contentType = "text/plain"
//		def talks = Talk.cypherStatic("""START rob=node(12), john=node(10)
//MATCH rob-[:attendsTo]->talk<-[attendsTo]-john
//RETURN talk
//         """).collect { Talk.createInstanceForNode(it.talk)}
//
//		 
////		 respond Talk.list(params), model:[talkInstanceCount: Talk.count()]
//		render (view:'/talk/index', model:[talkInstanceList:talks,talkInstanceCount: Talk.count()])
//	}

}

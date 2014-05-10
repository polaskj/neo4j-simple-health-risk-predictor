import edu.harvard.Disease
import edu.harvard.Patient;
import edu.harvard.Symptom;

class BootStrap {

	def init = { servletContext ->
		
//Uncomment to seed initial data 

//Note: You may get an error the first time you uncomment the lines below and 
//run-app. This is caused by a bug in the plugin likely caused by non-flushable 
//session in hibernate on startup. It should run the second time. Comment lines once run 
//successfully to avoid duplicating node relationship
		
//		Random rand = new Random()
//		int max = 500
//
//		//Generate diseases
//		(0..25).each{
//			if (!Disease.findByName("Disease$it")){
//				//Equiv to Cypher statement:
//				//CREATE (n {name:"Disease1",percentSurvival:50})
//				new Disease(name:"Disease$it",percentSurvival:rand.nextInt(100)).save(flush:true)
//			}
//		}
//
//		//Generate symptoms
//		(0..50).each{
//			if (!Symptom.findByName("Symptom$it")){
//				new Symptom(name:"Symptom$it",suggestedTreatment:rand.nextInt(max)).save(flush:true)
//			}
//		}
//
//		//Generate Patients
//		(0..max).each{
//			if (!Patient.findByName("Patient$it")){
//				new Patient(name:"Patient$it",dateOfBirth:new Date(),dateOfDeath:new Date()).save(flush:true)
//			}
//		}
//
//		(1..max).each{
//			def p = Patient.findByName("Patient$it")
//			if (p){
//				rand.nextInt(5).times{
//					def r = Patient.findByName("Patient${rand.nextInt(max)}")
//					if (r){
//						println "Linking relative $p $r"
//						p.relatives += [r]
//						p.save(flush:true)
//					}
//				}
//				rand.nextInt(5).times{
//					def s = Symptom.findByName("Symptom${rand.nextInt(50)}")
//					if (s){
//						println "Linking symptoms $p $s"
//						p.symptoms += [s]
//						p.save(flush:true)
//					}
//				}
//				rand.nextInt(3).times{
//					def d = Disease.findByName("Disease${rand.nextInt(25)}")
//					if (d){
//						println "Linking diseases $p $d"
//						p.diseases += [d]
//						p.save(flush:true)
//					}
//				}
//
//			}
//		}
	}
	def destroy = {
	}
}

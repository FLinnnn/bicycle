package cn.flin.bean;

import java.util.ArrayList;
import java.util.List;

public class zldExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public zldExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andZldidIsNull() {
            addCriterion("zldid is null");
            return (Criteria) this;
        }

        public Criteria andZldidIsNotNull() {
            addCriterion("zldid is not null");
            return (Criteria) this;
        }

        public Criteria andZldidEqualTo(Integer value) {
            addCriterion("zldid =", value, "zldid");
            return (Criteria) this;
        }

        public Criteria andZldidNotEqualTo(Integer value) {
            addCriterion("zldid <>", value, "zldid");
            return (Criteria) this;
        }

        public Criteria andZldidGreaterThan(Integer value) {
            addCriterion("zldid >", value, "zldid");
            return (Criteria) this;
        }

        public Criteria andZldidGreaterThanOrEqualTo(Integer value) {
            addCriterion("zldid >=", value, "zldid");
            return (Criteria) this;
        }

        public Criteria andZldidLessThan(Integer value) {
            addCriterion("zldid <", value, "zldid");
            return (Criteria) this;
        }

        public Criteria andZldidLessThanOrEqualTo(Integer value) {
            addCriterion("zldid <=", value, "zldid");
            return (Criteria) this;
        }

        public Criteria andZldidIn(List<Integer> values) {
            addCriterion("zldid in", values, "zldid");
            return (Criteria) this;
        }

        public Criteria andZldidNotIn(List<Integer> values) {
            addCriterion("zldid not in", values, "zldid");
            return (Criteria) this;
        }

        public Criteria andZldidBetween(Integer value1, Integer value2) {
            addCriterion("zldid between", value1, value2, "zldid");
            return (Criteria) this;
        }

        public Criteria andZldidNotBetween(Integer value1, Integer value2) {
            addCriterion("zldid not between", value1, value2, "zldid");
            return (Criteria) this;
        }

        public Criteria andBianhaoIsNull() {
            addCriterion("bianhao is null");
            return (Criteria) this;
        }

        public Criteria andBianhaoIsNotNull() {
            addCriterion("bianhao is not null");
            return (Criteria) this;
        }

        public Criteria andBianhaoEqualTo(String value) {
            addCriterion("bianhao =", value, "bianhao");
            return (Criteria) this;
        }

        public Criteria andBianhaoNotEqualTo(String value) {
            addCriterion("bianhao <>", value, "bianhao");
            return (Criteria) this;
        }

        public Criteria andBianhaoGreaterThan(String value) {
            addCriterion("bianhao >", value, "bianhao");
            return (Criteria) this;
        }

        public Criteria andBianhaoGreaterThanOrEqualTo(String value) {
            addCriterion("bianhao >=", value, "bianhao");
            return (Criteria) this;
        }

        public Criteria andBianhaoLessThan(String value) {
            addCriterion("bianhao <", value, "bianhao");
            return (Criteria) this;
        }

        public Criteria andBianhaoLessThanOrEqualTo(String value) {
            addCriterion("bianhao <=", value, "bianhao");
            return (Criteria) this;
        }

        public Criteria andBianhaoLike(String value) {
            addCriterion("bianhao like", value, "bianhao");
            return (Criteria) this;
        }

        public Criteria andBianhaoNotLike(String value) {
            addCriterion("bianhao not like", value, "bianhao");
            return (Criteria) this;
        }

        public Criteria andBianhaoIn(List<String> values) {
            addCriterion("bianhao in", values, "bianhao");
            return (Criteria) this;
        }

        public Criteria andBianhaoNotIn(List<String> values) {
            addCriterion("bianhao not in", values, "bianhao");
            return (Criteria) this;
        }

        public Criteria andBianhaoBetween(String value1, String value2) {
            addCriterion("bianhao between", value1, value2, "bianhao");
            return (Criteria) this;
        }

        public Criteria andBianhaoNotBetween(String value1, String value2) {
            addCriterion("bianhao not between", value1, value2, "bianhao");
            return (Criteria) this;
        }

        public Criteria andMingchengIsNull() {
            addCriterion("mingcheng is null");
            return (Criteria) this;
        }

        public Criteria andMingchengIsNotNull() {
            addCriterion("mingcheng is not null");
            return (Criteria) this;
        }

        public Criteria andMingchengEqualTo(String value) {
            addCriterion("mingcheng =", value, "mingcheng");
            return (Criteria) this;
        }

        public Criteria andMingchengNotEqualTo(String value) {
            addCriterion("mingcheng <>", value, "mingcheng");
            return (Criteria) this;
        }

        public Criteria andMingchengGreaterThan(String value) {
            addCriterion("mingcheng >", value, "mingcheng");
            return (Criteria) this;
        }

        public Criteria andMingchengGreaterThanOrEqualTo(String value) {
            addCriterion("mingcheng >=", value, "mingcheng");
            return (Criteria) this;
        }

        public Criteria andMingchengLessThan(String value) {
            addCriterion("mingcheng <", value, "mingcheng");
            return (Criteria) this;
        }

        public Criteria andMingchengLessThanOrEqualTo(String value) {
            addCriterion("mingcheng <=", value, "mingcheng");
            return (Criteria) this;
        }

        public Criteria andMingchengLike(String value) {
            addCriterion("mingcheng like", value, "mingcheng");
            return (Criteria) this;
        }

        public Criteria andMingchengNotLike(String value) {
            addCriterion("mingcheng not like", value, "mingcheng");
            return (Criteria) this;
        }

        public Criteria andMingchengIn(List<String> values) {
            addCriterion("mingcheng in", values, "mingcheng");
            return (Criteria) this;
        }

        public Criteria andMingchengNotIn(List<String> values) {
            addCriterion("mingcheng not in", values, "mingcheng");
            return (Criteria) this;
        }

        public Criteria andMingchengBetween(String value1, String value2) {
            addCriterion("mingcheng between", value1, value2, "mingcheng");
            return (Criteria) this;
        }

        public Criteria andMingchengNotBetween(String value1, String value2) {
            addCriterion("mingcheng not between", value1, value2, "mingcheng");
            return (Criteria) this;
        }

        public Criteria andDidianIsNull() {
            addCriterion("didian is null");
            return (Criteria) this;
        }

        public Criteria andDidianIsNotNull() {
            addCriterion("didian is not null");
            return (Criteria) this;
        }

        public Criteria andDidianEqualTo(String value) {
            addCriterion("didian =", value, "didian");
            return (Criteria) this;
        }

        public Criteria andDidianNotEqualTo(String value) {
            addCriterion("didian <>", value, "didian");
            return (Criteria) this;
        }

        public Criteria andDidianGreaterThan(String value) {
            addCriterion("didian >", value, "didian");
            return (Criteria) this;
        }

        public Criteria andDidianGreaterThanOrEqualTo(String value) {
            addCriterion("didian >=", value, "didian");
            return (Criteria) this;
        }

        public Criteria andDidianLessThan(String value) {
            addCriterion("didian <", value, "didian");
            return (Criteria) this;
        }

        public Criteria andDidianLessThanOrEqualTo(String value) {
            addCriterion("didian <=", value, "didian");
            return (Criteria) this;
        }

        public Criteria andDidianLike(String value) {
            addCriterion("didian like", value, "didian");
            return (Criteria) this;
        }

        public Criteria andDidianNotLike(String value) {
            addCriterion("didian not like", value, "didian");
            return (Criteria) this;
        }

        public Criteria andDidianIn(List<String> values) {
            addCriterion("didian in", values, "didian");
            return (Criteria) this;
        }

        public Criteria andDidianNotIn(List<String> values) {
            addCriterion("didian not in", values, "didian");
            return (Criteria) this;
        }

        public Criteria andDidianBetween(String value1, String value2) {
            addCriterion("didian between", value1, value2, "didian");
            return (Criteria) this;
        }

        public Criteria andDidianNotBetween(String value1, String value2) {
            addCriterion("didian not between", value1, value2, "didian");
            return (Criteria) this;
        }

        public Criteria andZldimageIsNull() {
            addCriterion("zldimage is null");
            return (Criteria) this;
        }

        public Criteria andZldimageIsNotNull() {
            addCriterion("zldimage is not null");
            return (Criteria) this;
        }

        public Criteria andZldimageEqualTo(String value) {
            addCriterion("zldimage =", value, "zldimage");
            return (Criteria) this;
        }

        public Criteria andZldimageNotEqualTo(String value) {
            addCriterion("zldimage <>", value, "zldimage");
            return (Criteria) this;
        }

        public Criteria andZldimageGreaterThan(String value) {
            addCriterion("zldimage >", value, "zldimage");
            return (Criteria) this;
        }

        public Criteria andZldimageGreaterThanOrEqualTo(String value) {
            addCriterion("zldimage >=", value, "zldimage");
            return (Criteria) this;
        }

        public Criteria andZldimageLessThan(String value) {
            addCriterion("zldimage <", value, "zldimage");
            return (Criteria) this;
        }

        public Criteria andZldimageLessThanOrEqualTo(String value) {
            addCriterion("zldimage <=", value, "zldimage");
            return (Criteria) this;
        }

        public Criteria andZldimageLike(String value) {
            addCriterion("zldimage like", value, "zldimage");
            return (Criteria) this;
        }

        public Criteria andZldimageNotLike(String value) {
            addCriterion("zldimage not like", value, "zldimage");
            return (Criteria) this;
        }

        public Criteria andZldimageIn(List<String> values) {
            addCriterion("zldimage in", values, "zldimage");
            return (Criteria) this;
        }

        public Criteria andZldimageNotIn(List<String> values) {
            addCriterion("zldimage not in", values, "zldimage");
            return (Criteria) this;
        }

        public Criteria andZldimageBetween(String value1, String value2) {
            addCriterion("zldimage between", value1, value2, "zldimage");
            return (Criteria) this;
        }

        public Criteria andZldimageNotBetween(String value1, String value2) {
            addCriterion("zldimage not between", value1, value2, "zldimage");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}